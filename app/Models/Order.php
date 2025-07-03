<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Order extends Model
{
    use HasFactory;

    protected $fillable = [
        'customer_id', 'order_number', 'total_amount',
        'paid_amount', 'cod_amount', 'cod_status',
        'payment_status', 'payment_method', 'payment_screenshot',
        'order_source', 'order_status', 'remark', 'is_deleted',
    ];

    public function customer()
    {
        return $this->belongsTo(Customer::class);
    }

    public function productDetails()
    {
        return $this->hasMany(ProductDetail::class);
    }
}
