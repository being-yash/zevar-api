<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\Order;
use App\Models\Customer;
use App\Models\ProductDetail;
use Illuminate\Support\Str;

class OrderWithProductDetailsSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        // Create a customer
        $customer = Customer::firstOrCreate([
            'mobile_number' => '9999999999',
        ], [
            'name' => 'Test Customer',
            'email' => 'customer@example.com',
        ]);

        for ($i = 15; $i <= 30; $i++) {
            $order = Order::create([
                'customer_id'      => $customer->id,
                'order_number'     => 'ZEV' . str_pad($i, 5, '0', STR_PAD_LEFT),
                'total_amount'     => 2000 + $i * 100,
                'paid_amount'      => 0,
                'cod_amount'       => 0,
                'cod_status'       => false,
                'payment_status'   => 'unpaid',
                'payment_method'   => null,
                'payment_screenshot' => null,
                'order_source'     => 'website',
                'order_status'     => 'pending',
                'remark'           => null,
                'is_deleted'       => false,
            ]);

            for ($j = 1; $j <= 2; $j++) {
                ProductDetail::create([
                    'order_id'               => $order->id,
                    'image_path'             => 'products/sample.jpg',
                    'customer_price'         => 500 + $j * 50,
                    'vendor_purchase_amount' => 400 + $j * 40,
                    'shipping_price'         => 50,
                    'status'                 => 'pending',
                    'last_status'            => null,
                    'vendor_id'              => null,
                    'shiprocket_order_id'    => null,
                    'shiprocket_shipment_id' => null,
                    'shiprocket_status'      => null,
                    'awb_number'             => null,
                    'courier_company_id'     => null,
                    'approved_date'          => null,
                    'shipment_date'          => null,
                    'delivery_date'          => null,
                    'return_type'            => null,
                    'is_deleted'             => false,
                    'created_at'             => now(),
                    'updated_at'             => now(),
                ]);
            }
        }
    }
}
