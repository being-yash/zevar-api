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
        $query = OrderTransaction::query()->with('order', 'customer');

        if ($request->filled('from_date')) {
            $query->where('trans_date', '>=', $request->from_date);
        }

        if ($request->filled('to_date')) {
            $query->where('trans_date', '<=', $request->to_date);
        }

        if ($request->filled('customer_id')) {
            $query->where('customer_id', $request->customer_id);
        }

        if ($request->filled('mode')) {
            $query->where('mode', $request->mode);
        }

        return response()->json([
            'transactions' => $query->latest()->get()
        ]);
    }

}
