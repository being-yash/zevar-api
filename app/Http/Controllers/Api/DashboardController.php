<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Order;
use App\Models\ProductDetail;
use App\Models\Vendor;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;

class DashboardController extends Controller
{
    public function index(Request $request)
    {
        $today = now()->format('Y-m-d');

        $totalOrders = Order::count();
        $todayOrders = Order::whereDate('created_at', $today)->count();
        $totalRevenue = Order::sum('paid_amount');
        $pendingPayment = Order::where('payment_status', '!=', 'paid')->count();
        $approvedOrders = Order::where('order_status', 'approved')->count();

        $topVendors = Vendor::select('id', 'name')
            ->withCount(['products as order_count'])
            ->orderByDesc('order_count')
            ->limit(5)
            ->get();

        $topCities = Order::select('city', DB::raw('COUNT(*) as orders'))
            ->join('customers', 'orders.customer_id', '=', 'customers.id')
            ->groupBy('customers.city')
            ->orderByDesc('orders')
            ->limit(5)
            ->get();

        $latestOrders = Order::with('customer')
            ->latest()
            ->take(10)
            ->get()
            ->map(function ($order) {
                return [
                    'id' => $order->id,
                    'order_number' => $order->order_number,
                    'customer_name' => $order->customer->name ?? 'N/A',
                    'total_amount' => $order->total_amount,
                    'payment_status' => $order->payment_status,
                    'created_at' => $order->created_at->format('Y-m-d H:i:s'),
                ];
            });

        return response()->json([
            'total_orders' => $totalOrders,
            'today_orders' => $todayOrders,
            'total_revenue' => $totalRevenue,
            'pending_payment_orders' => $pendingPayment,
            'approved_orders' => $approvedOrders,
            'top_vendors' => $topVendors,
            'top_cities' => $topCities,
            'latest_orders' => $latestOrders,
        ]);
    }
}
