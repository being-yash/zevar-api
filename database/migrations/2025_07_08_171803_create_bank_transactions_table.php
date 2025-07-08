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
    Schema::create('bank_transactions', function (Blueprint $table) {
        $table->id();
        $table->decimal('amount', 10, 2);
        $table->enum('type', ['credit', 'debit']);
        $table->string('mode')->nullable(); // UPI, cash, bank etc.
        $table->string('reference')->nullable(); // UPI ref / TXN ID
        $table->text('remark')->nullable(); // Notes / info
        $table->unsignedBigInteger('order_transaction_id')->nullable();
        $table->unsignedBigInteger('vendor_payment_id')->nullable();
        $table->enum('status', ['pending', 'confirmed'])->default('pending');
        $table->date('txn_date');
        $table->timestamps();

        //$table->foreign('order_transaction_id')->references('id')->on('order_transactions')->onDelete('set null');
        // vendor_payment_id foreign key only if vendor_payment table exists
    });
}


    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('bank_transactions');
    }
};
