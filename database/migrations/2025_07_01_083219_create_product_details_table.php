<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('product_details', function (Blueprint $table) {
            $table->increments('id');
            $table->unsignedInteger('order_id');
            $table->string('image_path');
            $table->decimal('customer_price', 10, 2)->nullable();
            $table->decimal('vendor_purchase_amount', 10, 2)->nullable();
            $table->decimal('shipping_price', 10, 2)->nullable();
            $table->string('status', 50)->default('pending')->index();
            $table->string('last_status', 50)->nullable();
            $table->unsignedInteger('vendor_id')->nullable()->index();
            $table->string('shiprocket_order_id')->nullable();
            $table->string('shiprocket_shipment_id')->nullable();
            $table->string('shiprocket_status', 50)->nullable();
            $table->string('awb_number', 255)->nullable()->index();
            $table->unsignedInteger('courier_company_id')->nullable();
            $table->date('approved_date')->nullable();
            $table->date('shipment_date')->nullable();
            $table->date('delivery_date')->nullable();
            $table->string('return_type', 50)->nullable();
            $table->boolean('is_deleted')->default(false);
            $table->timestamps();

            $table->foreign('order_id')->references('id')->on('orders')->onDelete('cascade');
            $table->foreign('vendor_id')->references('id')->on('vendors')->onDelete('set null');
            $table->foreign('courier_company_id')->references('id')->on('courier_companies')->onDelete('set null');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('product_details');
    }
};
