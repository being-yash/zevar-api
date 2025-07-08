<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class BankTransaction extends Model
{
    protected $fillable = [
        'amount', 'type', 'mode', 'reference', 'remark',
        'order_transaction_id', 'vendor_payment_id', 'status', 'txn_date'
    ];

    public function orderTransaction()
    {
        return $this->belongsTo(OrderTransaction::class);
    }

    // future: add vendorPayment() if needed
}
// 
