<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\OrderTransaction;

class OrderTransactionController extends Controller
{
    /**
     * Generate a report of order transactions based on various filters.
     *
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function report(Request $request)
    {
        $query = OrderTransaction::query()
            ->join('orders', 'order_transactions.order_id', '=', 'orders.id')
            ->join('customers', 'order_transactions.customer_id', '=', 'customers.id')
            ->select(
                'order_transactions.*',
                'orders.order_number',
                'customers.name as customer_name'
            );

        if ($request->filled('from_date')) {
            $query->whereDate('trans_date', '>=', $request->from_date);
        }

        if ($request->filled('to_date')) {
            $query->whereDate('trans_date', '<=', $request->to_date);
        }

        if ($request->filled('customer_id')) {
            $query->where('order_transactions.customer_id', $request->customer_id);
        }

        if ($request->filled('mode')) {
            $query->where('order_transactions.mode', $request->mode);
        }

        $transactions = $query->orderBy('trans_date', 'desc')->get();

        return response()->json([
            'transactions' => $transactions
        ]);
    }

}
