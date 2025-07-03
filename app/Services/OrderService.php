<?php

namespace App\Services;

use App\Models\{Order, Customer, ProductDetail};
use Illuminate\Support\Facades\DB;

class OrderService
{
    public function create(array $data): Order
    {
        return DB::transaction(function () use ($data) {
            $customerData = $data['customer'];
            $customer = Customer::firstOrCreate(
                ['mobile_number' => $customerData['mobile_number']],
                $customerData
            );

            $order = Order::create(array_merge(
                $data,
                ['customer_id' => $customer->id]
            ));

            foreach ($data['products'] as $product) {
                ProductDetail::create(array_merge($product, [
                    'order_id' => $order->id
                ]));
            }

            return $order->load('customer', 'productDetails');
        });
    }

    public function updateStatus(Order $order, string $status): Order
    {
        $order->update(['order_status' => $status]);
        return $order;
    }

    public function updateProductStatus(ProductDetail $product, string $status): ProductDetail
    {
        $product->fill($data);
        $product->save();
        return $product;
    }

    /**
     * Assigns a vendor to specified products within an order.
     *
     * @param \App\Models\Order $order The order instance.
     * @param array $productIds Array of product IDs to assign.
     * @param int $vendorId The ID of the vendor to assign.
     * @param string $status The status to set for the assigned products (default: 'approved').
     * @return \Illuminate\Support\Collection A collection of updated ProductDetail models.
     */
    public function assignVendorToProducts(Order $order, array $productIds, int $vendorId, string $status = 'approved')
    {
        return DB::transaction(function () use ($order, $productIds, $vendorId, $status) {
            // Find products belonging to this order and the given product IDs
            // Use ProductDetail model directly as it maps to 'product_details' table
            $productsToUpdate = ProductDetail::where('order_id', $order->id)
                                             ->whereIn('id', $productIds)
                                             ->get();

            if ($productsToUpdate->isEmpty()) {
                throw new \Exception('No matching products found for the given order and product IDs.');
            }

            foreach ($productsToUpdate as $product) {
                $product->vendor_id = $vendorId;
                $product->status = $status; // Set the new status, e.g., 'approved'
                $product->save();
            }

            return $productsToUpdate;
        });
    }
}
