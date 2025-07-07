<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Requests\StoreOrderRequest;
use App\Http\Requests\AssignVendorRequest;
use App\Services\OrderService;
use App\Models\{Order, ProductDetail};
use Illuminate\Http\Request;

class OrderController extends Controller
{
    protected OrderService $orderService;

    public function __construct(OrderService $orderService)
    {
        $this->orderService = $orderService;
    }

    public function store(StoreOrderRequest $request)
    {
        $order = $this->orderService->create($request->validated());
        return response()->json(['success' => true, 'order' => $order], 201);
    }

    public function index()
    {
        return response()->json(Order::with('customer', 'productDetails')->latest()->paginate(20));
    }

    public function show(Order $order)
    {
        return response()->json($order->load('customer', 'productDetails'));
    }

    public function updateStatus(Request $request, Order $order)
    {
        $request->validate(['order_status' => 'required|string']);
        $order = $this->orderService->updateStatus($order, $request->order_status);
        return response()->json(['message' => 'Order status updated', 'order' => $order]);
    }

    // public function updateProductStatus(Request $request, ProductDetail $product)
    // {
    //     try {
    //         $request->validate([
    //             'status' => 'sometimes|required|string|in:pending,approved,shipped,delivered,returned,refunded,cancelled',
    //             'awb_number' => 'nullable|string|max:255',
    //             'courier_company_id' => 'nullable|exists:courier_companies,id',
    //             'shipment_date' => 'nullable|date',
    //             'delivery_date' => 'nullable|date',
    //             'shiprocket_order_id' => 'nullable|string|max:255', // Assuming string as per schema
    //             'shiprocket_shipment_id' => 'nullable|string|max:255', // Assuming string as per schema
    //             'shiprocket_status' => 'nullable|string|max:50',
    //             'last_status' => 'nullable|string|max:50', // Allow updating last_status
    //         ]);

    //         // Pass all validated data to the service
    //         $product = $this->orderService->updateProductStatus($product, $request->validated());
    //         return response()->json(['message' => 'Product status and/or shipping updated', 'product' => $product]);
    //     } catch (ValidationException $e) {
    //         return response()->json(['message' => 'Validation failed', 'errors' => $e->errors()], 422);
    //     } catch (\Exception $e) {
    //         \Log::error('Product status/shipping update failed: ' . $e->getMessage(), ['exception' => $e]);
    //         return response()->json(['message' => 'Product status/shipping update failed.', 'error' => $e->getMessage()], 500);
    //     }
    // }
    public function updateProductStatus(Request $request, ProductDetail $product)
    {
        $request->validate(['status' => 'required|string']);
        $product = $this->orderService->updateProductStatus($product, $request->status);
        return response()->json(['message' => 'Product status updated', 'product' => $product]);
    }

    /**
     * Assigns a vendor to products within an order.
     * If no product_ids are provided, assign all products in the order to the vendor.
     */
    public function assignVendor(AssignVendorRequest $request, Order $order)
    {
        $vendorId = $request->input('vendor_id');
        $status = $request->input('status', 'approved');

        // If product_ids is provided, assign vendor to those products, else assign to all products in the order
        $productIds = $request->input('product_ids', []);
        if (empty($productIds)) {
            // Assign all products in the order
            $productIds = $order->productDetails()->pluck('id')->toArray();
        }

        try {
            $updatedProducts = $this->orderService->assignVendorToProducts($order, $productIds, $vendorId, $status);

            return response()->json([
                'message' => 'Vendor assigned to products successfully!',
                'products' => $updatedProducts->load('vendor', 'courierCompany')
            ], 200);
        } catch (\Exception $e) {
            \Log::error('Failed to assign vendor to products: ' . $e->getMessage(), ['exception' => $e]);
            return response()->json(['message' => 'Failed to assign vendor to products.', 'error' => $e->getMessage()], 500);
        }
    }

    public function updatePaymentStatus(Request $request, Order $order)
    {
        $request->validate(['payment_status' => 'required|string']);
        $order->payment_status = $request->payment_status;
        $order->save();

        return response()->json([
            'message' => 'Payment status updated',
            'order' => $order
        ]);
    }

    public function ordersByStatus(Request $request, $status)
    {
        $perPage = $request->input('per_page', 10);
        $orders = Order::with('customer', 'productDetails')
            ->where('order_status', $status)
            ->latest()
            ->paginate($perPage);


        return response()->json($orders);
    }

    public function destroy(Order $order)
    {
        $order->delete();
        return response()->json(['message' => 'Order soft deleted successfully.']);
    }
}