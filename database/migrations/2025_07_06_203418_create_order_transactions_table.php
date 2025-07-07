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
        Schema::create('order_transactions', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('order_id');
            $table->unsignedBigInteger('customer_id');
            $table->decimal('trans_amount', 10, 2);
            $table->string('trans_id')->nullable(); // Razorpay or UPI ref
            $table->string('remark')->nullable();
            $table->enum('trans_type', ['credit'])->default('credit');
            $table->string('mode')->nullable(); // upi, bank, cash
            $table->enum('payment_status', ['pending', 'confirmed'])->default('pending');
            $table->date('trans_date');
            $table->decimal('balance', 10, 2)->default(0);
            $table->timestamps();

            //$table->foreign('order_id')->references('id')->on('orders')->onDelete('cascade');
            //$table->foreign('customer_id')->references('id')->on('customers')->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('order_transactions');
    }
};
