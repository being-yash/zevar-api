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

    public function updateProductStatus(Request $request, ProductDetail $product)
    {
        try {
            $request->validate([
                'status' => 'sometimes|required|string|in:pending,approved,shipped,delivered,returned,refunded,cancelled',
                'awb_number' => 'nullable|string|max:255',
                'courier_company_id' => 'nullable|exists:courier_companies,id',
                'shipment_date' => 'nullable|date',
                'delivery_date' => 'nullable|date',
                'shiprocket_order_id' => 'nullable|string|max:255', // Assuming string as per schema
                'shiprocket_shipment_id' => 'nullable|string|max:255', // Assuming string as per schema
                'shiprocket_status' => 'nullable|string|max:50',
                'last_status' => 'nullable|string|max:50', // Allow updating last_status
            ]);

            // Pass all validated data to the service
            $product = $this->orderService->updateProductStatus($product, $request->validated());
            return response()->json(['message' => 'Product status and/or shipping updated', 'product' => $product]);
        } catch (ValidationException $e) {
            return response()->json(['message' => 'Validation failed', 'errors' => $e->errors()], 422);
        } catch (\Exception $e) {
            \Log::error('Product status/shipping update failed: ' . $e->getMessage(), ['exception' => $e]);
            return response()->json(['message' => 'Product status/shipping update failed.', 'error' => $e->getMessage()], 500);
        }
    }

    /**
     * Assigns a vendor to specific products within an order.
     *
     * @param  \App\Http\Requests\AssignVendorRequest  $request
     * @param  \App\Models\Order  $order
     * @return \Illuminate\Http\JsonResponse
     */
    public function assignVendor(AssignVendorRequest $request, Order $order, ProductDetail $product)
    {
        $productIds = $request->input('product_ids');
        $vendorId = $request->input('vendor_id');
        $status = $request->input('status', 'approved'); // Default status to 'approved' if not provided

        try {
            $updatedProducts = $this->orderService->assignVendorToProducts($order, $productIds, $vendorId, $status);

            return response()->json([
                'message' => 'Vendor assigned to products successfully!',
                'products' => $updatedProducts->load('vendor', 'courierCompany') // Eager load vendor/courier for response
            ], 200);
        } catch (\Exception $e) {
            \Log::error('Failed to assign vendor to products: ' . $e->getMessage(), ['exception' => $e]);
            return response()->json(['message' => 'Failed to assign vendor to products.', 'error' => $e->getMessage()], 500);
        }
    }
}