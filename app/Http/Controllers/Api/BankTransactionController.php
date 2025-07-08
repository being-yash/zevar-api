<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\{Customer, Order, ProductDetail, BankTransaction};
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\DB;

class BankTransactionController extends Controller
{
    public function store(Request $request)
    {
        $request->validate([
            'amount' => 'required|numeric',
            'type' => 'required|in:credit,debit',
            'mode' => 'nullable|string',
            'reference' => 'nullable|string',
            'remark' => 'nullable|string',
            'order_transaction_id' => 'nullable|exists:order_transactions,id',
            'vendor_payment_id' => 'nullable|integer',
            'txn_date' => 'required|date'
        ]);

        $transaction = BankTransaction::create($request->all());

        // Auto-confirm order if mapping a customer order
        if ($transaction->order_transaction_id) {
            $orderTrans = \App\Models\OrderTransaction::find($transaction->order_transaction_id);
            $orderTrans->update(['payment_status' => 'confirmed']);
        }

        return response()->json([
            'message' => 'Bank transaction logged successfully.',
            'transaction' => $transaction
        ]);
    }

    public function report(Request $request)
    {
        $query = BankTransaction::query();

        if ($request->filled('from_date')) {
            $query->whereDate('txn_date', '>=', $request->from_date);
        }

        if ($request->filled('to_date')) {
            $query->whereDate('txn_date', '<=', $request->to_date);
        }

        if ($request->filled('type')) {
            $query->where('type', $request->type); // credit or debit
        }

        if ($request->filled('mode')) {
            $query->where('mode', $request->mode);
        }

        $transactions = $query->orderBy('txn_date', 'asc')->get();

        // 🧮 Recalculate running balance
        $runningBalance = 0;
        $transactions = $transactions->map(function ($txn) use (&$runningBalance) {
            $runningBalance = $txn->type === 'credit'
                ? $runningBalance + $txn->amount
                : $runningBalance - $txn->amount;

            $txn->running_balance = $runningBalance;
            return $txn;
        });

        return response()->json([
            'transactions' => $transactions
        ]);
    }

    public function update(Request $request, $id)
    {
        $txn = BankTransaction::findOrFail($id);

        $request->validate([
            'order_transaction_id' => 'nullable|exists:order_transactions,id',
            'vendor_payment_id' => 'nullable|integer',
            'remark' => 'nullable|string'
        ]);

        $txn->update($request->only(['order_transaction_id', 'vendor_payment_id', 'remark']));

        // ✅ Auto-confirm linked order_transaction
        if ($request->filled('order_transaction_id')) {
            $orderTxn = \App\Models\OrderTransaction::find($request->order_transaction_id);

            if ($orderTxn) {
                // 1. Mark order_transaction as confirmed
                $orderTxn->update(['payment_status' => 'confirmed']);

                // 2. Also mark the parent order as confirmed
                if ($orderTxn->order) {
                    $orderTxn->order->update(['payment_status' => 'confirmed']);
                }
            }
        }

        return response()->json([
            'message' => 'Bank transaction updated and order payment confirmed.',
            'transaction' => $txn
        ]);
    }




}
