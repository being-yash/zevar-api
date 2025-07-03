<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class StoreOrderRequest extends FormRequest
{
    public function authorize(): bool
    {
        return true;
    }

    public function rules(): array
    {
        return [
            'customer.name' => 'required|string|max:255',
            'customer.mobile_number' => 'required|string|max:15',
            'customer.email' => 'nullable|email',
            'customer.whatsapp_number' => 'nullable|string|max:15',
            'customer.address' => 'nullable|string',
            'customer.pincode' => 'nullable|string|max:10',
            'customer.city' => 'nullable|string',
            'customer.state' => 'nullable|string',
            'order_number' => 'required|string|unique:orders,order_number',
            'total_amount' => 'required|numeric',
            'paid_amount' => 'nullable|numeric',
            'cod_amount' => 'nullable|numeric',
            'cod_status' => 'boolean',
            'payment_status' => 'required|string',
            'payment_method' => 'nullable|string',
            'payment_screenshot' => 'nullable|string',
            'order_source' => 'required|string',
            'order_status' => 'required|string',
            'remark' => 'nullable|string',
            'products' => 'required|array|min:1',
            'products.*.image_path' => 'required|string',
            'products.*.customer_price' => 'required|numeric',
            'products.*.vendor_purchase_amount' => 'nullable|numeric',
            'products.*.shipping_price' => 'nullable|numeric',
            'products.*.status' => 'nullable|string',
            'products.*.vendor_id' => 'nullable|integer',
            'products.*.courier_company_id' => 'nullable|integer',
            'products.*.last_status' => 'nullable|string',
            'products.*.awb_number' => 'nullable|string',
            'products.*.shiprocket_order_id' => 'nullable|string',
            'products.*.shiprocket_shipment_id' => 'nullable|string',
            'products.*.shiprocket_status' => 'nullable|string',
            'products.*.approved_date' => 'nullable|date',
            'products.*.shipment_date' => 'nullable|date',
            'products.*.delivery_date' => 'nullable|date',
            'products.*.return_type' => 'nullable|string',
        ];
    }
}