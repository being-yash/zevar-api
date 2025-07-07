<?php
namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class OrderTransaction extends Model
{
    protected $fillable = [
        'order_id',
        'customer_id',
        'trans_amount',
        'trans_id',
        'remark',
        'trans_type',
        'mode',
        'payment_status',
        'trans_date',
        'balance'
    ];

    public function order()
    {
        return $this->belongsTo(Order::class);
    }

    public function customer()
    {
        return $this->belongsTo(Customer::class);
    }
}
