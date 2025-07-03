<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class ProductDetail extends Model
{
    use HasFactory;

    protected $table = 'product_details';

    protected $fillable = [
        'order_id', 'image_path', 'customer_price', 'vendor_purchase_amount',
        'shipping_price', 'status', 'last_status', 'vendor_id',
        'shiprocket_order_id', 'shiprocket_shipment_id', 'shiprocket_status',
        'awb_number', 'courier_company_id', 'approved_date',
        'shipment_date', 'delivery_date', 'return_type', 'is_deleted'
    ];

    public function order()
    {
        return $this->belongsTo(Order::class);
    }

    public function vendor()
    {
        return $this->belongsTo(Vendor::class);
    }

    public function courierCompany()
    {
        return $this->belongsTo(CourierCompany::class);
    }
}
