<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class CourierCompany extends Model
{
    use HasFactory;

    protected $fillable = [
        'name', 'tracking_url', 'contact'
    ];

    public function products()
    {
        return $this->hasMany(ProductDetail::class);
    }
}
