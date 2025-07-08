<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Api\OrderController;
use App\Http\Controllers\Api\AuthController;
use App\Http\Controllers\Api\VendorController;
use App\Http\Controllers\Api\ProductDetailController;
use App\Http\Controllers\Api\OrderTransactionController;
use App\Http\Controllers\Api\BankTransactionController;
use Illuminate\Http\Request;
use App\Http\Controllers\Api\DashboardController;


Route::post('/register', [AuthController::class, 'register']);
Route::post('/login',    [AuthController::class, 'login']);

Route::middleware('auth:api')->post('/logout', [AuthController::class, 'logout']);

Route::middleware('auth:api')->group(function () {
    Route::get('/user', function (Request $request) {
        return response()->json(['user' => $request->user()]);
    });

    //order routes
    Route::post('/orders', [OrderController::class, 'store']);
    Route::get('/orders', [OrderController::class, 'index']);
    Route::get('/orders/{order}', [OrderController::class, 'show']);
    Route::patch('/orders/{order}/status', [OrderController::class, 'updateStatus']);
    Route::patch('/orders/{order}/payment-status', [OrderController::class, 'updatePaymentStatus']);
    Route::post('/orders/{order}/assign-vendor', [OrderController::class, 'assignVendor']);
    Route::get('/orders-by-status/{status}', [OrderController::class, 'ordersByStatus']);
    Route::delete('/orders/{order}', [OrderController::class, 'destroy']);

    Route::patch('/product-details/{product}/status', [ProductDetailController::class, 'updateStatus']);
    Route::post('/product-details/{product}/assign-vendor', [ProductDetailController::class, 'assignVendor']);
    Route::get('/product-details/{product}/track', [ProductDetailController::class, 'track']);
    Route::delete('/product-details/{product}', [ProductDetailController::class, 'destroy']);
    Route::post('/products/update-shipping', [ProductDetailController::class, 'updateShipping']);
    Route::patch('/product-details/{product}/pricing', [ProductDetailController::class, 'updatePricing']);
    Route::post('/product-details/deliver', [ProductDetailController::class, 'markDelivered']);


    //order transaction routes
    Route::get('/order-transactions/report', [OrderTransactionController::class, 'report']);

    //bank transaction routes
    Route::post('/bank-transactions', [BankTransactionController::class, 'store']);
    Route::get('/bank-transactions/report', [BankTransactionController::class, 'report']);
    Route::patch('/bank-transactions/{id}', [BankTransactionController::class, 'update']);



    //dashboard routes
    Route::get('/dashboard', [DashboardController::class, 'index']);

    
    //vendor routes
    Route::apiResource('/vendors', VendorController::class);
});
