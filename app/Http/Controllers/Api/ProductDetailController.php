<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\ProductDetail;
use App\Services\OrderService;
use Illuminate\Http\Request;

class ProductDetailController extends Controller
{
    protected OrderService $orderService;

    public function __construct(OrderService $orderService)
    {
        $this->orderService = $orderService;
    }

    /**
     * Assign a vendor to a specific product.
     */
    public function assignVendor(Request $request, ProductDetail $product)
    {
        $request->validate([
            'vendor_id' => 'required|exists:vendors,id'
        ]);

        $updatedProduct = $this->orderService->assignVendorToProduct($product, $request->vendor_id);

        return response()->json([
            'message' => 'Vendor assigned to product successfully.',
            'product' => $updatedProduct
        ]);
    }

    /**
     * Update the status of an individual product.
     */
    public function updateStatus(Request $request, ProductDetail $product)
    {
        $request->validate([
            'status' => 'required|string'
        ]);

        $updatedProduct = $this->orderService->updateProductStatus($product, $request->status);

        return response()->json([
            'message' => 'Product status updated successfully.',
            'product' => $updatedProduct
        ]);
    }

    /**
     * Track status of product (optional).
     */
    public function track(ProductDetail $product)
    {
        return response()->json([
            'status' => $product->status,
            'awb_number' => $product->awb_number,
            'courier_company_id' => $product->courier_company_id,
            'shiprocket_status' => $product->shiprocket_status,
            'shipment_date' => $product->shipment_date,
            'delivery_date' => $product->delivery_date,
        ]);
    }

    /**
     * Update shipping information for multiple products.
     */
    public function updateShipping(Request $request)
    {
        //$this->authorize('admin-only');

        $request->validate([
            'awb_number' => 'required|string|max:255',
            'courier_company_id' => 'required|exists:courier_companies,id',
            'products' => 'required|array|min:1',
            'products.*.id' => 'required|exists:product_details,id',
            'products.*.vendor_purchase_amount' => 'nullable|numeric'
        ]);

        foreach ($request->products as $item) {
            ProductDetail::where('id', $item['id'])->update([
                'awb_number' => $request->awb_number,
                'courier_company_id' => $request->courier_company_id,
                'vendor_purchase_amount' => $item['vendor_purchase_amount'] ?? null,
                'shipment_date' => now(),
                'status' => 'shipped'
            ]);
        }

        return response()->json([
            'message' => 'Shipping info updated for selected products.',
            'awb_number' => $request->awb_number
        ]);
    }

    /**
     * Update pricing for a product.
     */
    public function updatePricing(Request $request, ProductDetail $product)
    {
        // $this->authorize('admin-only');

        $request->validate([
            'vendor_purchase_amount' => 'nullable|numeric',
            'customer_price' => 'nullable|numeric',
        ]);

        $updates = [];

        if ($request->has('vendor_purchase_amount')) {
            $updates['vendor_purchase_amount'] = $request->vendor_purchase_amount;
        }

        if ($request->has('customer_price')) {
            $updates['customer_price'] = $request->customer_price;
        }

        if (empty($updates)) {
            return response()->json(['message' => 'No fields provided to update.'], 422);
        }

        $product->update($updates);

        return response()->json([
            'message' => 'Product pricing updated successfully.',
            'product' => $product->fresh()
        ]);
    }

    public function markDelivered(Request $request)
    {
        //$this->authorize('admin-only');

        $request->validate([
            'product_ids' => 'required|array|min:1',
            'product_ids.*' => 'exists:product_details,id',
            'delivery_date' => 'nullable|date'
        ]);

        $date = $request->delivery_date ?? now()->toDateString();

        $updated = \App\Models\ProductDetail::whereIn('id', $request->product_ids)
            ->update([
                'delivery_date' => $date,
                'status' => 'delivered'
            ]);

        return response()->json([
            'message' => "Marked {$updated} product(s) as delivered.",
            'delivery_date' => $date
        ]);
    }



    /**
     * Soft delete a product.
     */
    public function destroy(ProductDetail $product)
    {
        $product->delete();
        return response()->json(['message' => 'Product soft deleted successfully.']);
    }
}
