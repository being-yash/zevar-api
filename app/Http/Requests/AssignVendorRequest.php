<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Validation\Rule;

class AssignVendorRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     */
    public function authorize(): bool
    {
        // Only allow 'admin' or 'staff' roles to assign vendors
        // You might need to adjust this based on your exact role names and authorization logic.
        //return $this->user() && ($this->user()->role === 'admin' || $this->user()->role === 'staff');
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, \Illuminate\Contracts\Validation\ValidationRule|array<mixed>|string>
     */
    public function rules(): array
    {
        return [
            'product_ids' => 'required|array|min:1',
            'product_ids.*' => [
                'required',
                'integer',
                'exists:product_details,id',
                // Ensure the product belongs to the order being updated
                Rule::exists('product_details', 'id')->where(function ($query) {
                    $query->where('order_id', $this->route('order')->id);
                }),
            ],
            'vendor_id' => 'required|integer|exists:vendors,id',
            'status' => 'nullable|string|in:pending,approved,shipped,delivered,returned,refunded,cancelled',
        ];
    }

    /**
     * Get the error messages for the defined validation rules.
     *
     * @return array<string, string>
     */
    public function messages(): array
    {
        return [
            'product_ids.required' => 'At least one product ID is required.',
            'product_ids.array' => 'Product IDs must be an array.',
            'product_ids.*.exists' => 'One or more product IDs are invalid.',
            'product_ids.*.integer' => 'Product IDs must be integers.',
            'product_ids.*.exists' => 'One or more selected products do not belong to this order or do not exist.',
            'vendor_id.required' => 'A vendor ID is required.',
            'vendor_id.exists' => 'The selected vendor does not exist.',
        ];
    }
}
