<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Vendor extends Model
{
    use HasFactory;

    protected $fillable = [
        'name', 'company_name', 'email', 'phone',
        'gst_number', 'pan_number', 'address',
        'bank_account_number', 'ifsc_code', 'is_active'
    ];

    public function products()
    {
        return $this->hasMany(ProductDetail::class);
    }

    /**
     * Get the user that owns the vendor.
     */
    public function user()
    {
        return $this->belongsTo(User::class);
    }

    /**
     * Get the vendor ledger entries for the vendor.
     */
    public function vendorLedgers()
    {
        return $this->hasMany(VendorLedger::class);
    }

    /**
     * Get the vendor payments for the vendor.
     */
    public function vendorPayments()
    {
        return $this->hasMany(VendorPayment::class);
    }

    /**
     * Get the courier company preferred by the vendor.
     */
    public function preferredCourier()
    {
        return $this->belongsTo(CourierCompany::class, 'preferred_courier_id');
    }
}
