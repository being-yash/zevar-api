<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class ProductDetailRequest extends FormRequest
{
    public function authorize(): bool
    {
        return true; // Add Gate check if needed
    }

    public function rules(): array
    {
        return [
            'status'    => 'nullable|string',
            'vendor_id' => 'nullable|exists:vendors,id',
        ];
    }
}
