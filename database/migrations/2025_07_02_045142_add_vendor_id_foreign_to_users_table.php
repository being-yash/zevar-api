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
        Schema::table('users', function (Blueprint $table) {
            // Check if vendor_id column already exists before adding it
            // This handles cases where the users table might have been created with it already
            if (!Schema::hasColumn('users', 'vendor_id')) {
                // Add vendor_id as nullable unsigned BIGINT after the 'role' column
                // (Assuming 'role' exists and is before where vendor_id should be)
                $table->unsignedBigInteger('vendor_id')->nullable()->after('remember_token');
            }

            // Add foreign key constraint to the 'vendors' table
            // Ensure the foreign key doesn't already exist to prevent errors on re-run
            // $table->foreign('vendor_id')
            //       ->references('id')
            //       ->on('vendors')
            //       ->onDelete('set null');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('users', function (Blueprint $table) {
            // Drop the foreign key first, checking if it exists
            $foreignKeys = Schema::getConnection()->getDoctrineSchemaManager()->listTableForeignKeys('users');
            foreach ($foreignKeys as $foreignKey) {
                if ($foreignKey->getColumns() == ['vendor_id']) {
                    $table->dropForeign(['vendor_id']);
                    break;
                }
            }
            // Then drop the column, checking if it exists
            if (Schema::hasColumn('users', 'vendor_id')) {
                $table->dropColumn('vendor_id');
            }
        });
    }
};
