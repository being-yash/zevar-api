<?php

namespace App\Services;

use App\Models\{Order, Customer, ProductDetail, OrderTransaction};
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

            $lastBalance = OrderTransaction::where('customer_id', $customerId)->latest()->value('balance') ?? 0;
            $newBalance = $lastBalance + $amount;
            OrderTransaction::create([
                'order_id'       => $order->id,
                'customer_id'    => $customer->id,
                'trans_amount'   => $data['paid_amount'] ?? 0,
                'trans_type'     => 'credit',
                'payment_status' => 'pending',
                'trans_date'     => now(),
                'mode'           => $data['payment_method'] ?? null,
                'remark'         => 'Initial payment on order create',
                'balance'        => $newBalance,
            ]);

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
        $product->update(['status' => $status]);
        return $product;
    }

    public function updatePaymentStatus(Order $order, string $status): Order
    {
        $order->update(['payment_status' => $status]);
        // OrderTransaction::update(['payment_status' => $status]);
        return $order;
    }

    public function assignVendorToProducts(Order $order, array $productIds, int $vendorId, string $status = 'approved')
    {
        $products = $order->productDetails()->whereIn('id', $productIds)->get();

        foreach ($products as $product) {
            $product->vendor_id = $vendorId;
            $product->status = $status;
            $product->save();
        }

        // Set order status to approved if not already
        if ($order->order_status !== 'approved') {
            $order->order_status = 'approved';
            $order->save();
        }

        return $products;
    }

    public function assignVendorToProduct(ProductDetail $product, int $vendorId, string $status = 'approved')
    {
        $product->vendor_id = $vendorId;
        $product->status = $status;
        $product->save();

        // Also update the parent order status to approved
        $order = $product->order;
        if ($order && $order->order_status !== 'approved') {
            $order->order_status = 'approved';
            $order->save();
        }

        return $product;
    }
}