<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Vendor;
use App\Models\User; // To link a user to a vendor
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Validation\ValidationException;
use Illuminate\Support\Facades\DB; // For transactions

class VendorController extends Controller
{
    /**
     * Display a listing of the vendors.
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function index()
    {
        // Eager load the associated user and preferred courier for efficiency
        $vendors = Vendor::with(['user', 'preferredCourier'])
                ->withCount(['products as order_count'])
                ->orderByDesc('order_count')
                ->latest()->paginate(20);
        return response()->json($vendors);
    }

    /**
     * Store a newly created vendor in storage.
     * This will also create an associated user account for the vendor.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function store(Request $request)
    {
        return DB::transaction(function () use ($request) {
            try {
                // 1. Validate incoming request data for both user and vendor
                $request->validate([
                    // User details for vendor's login
                    'user.name' => 'required|string|max:255',
                    'user.email' => 'required|string|email|max:255|unique:users,email',
                    'user.password' => 'required|string|min:6', // Password for the vendor's user account
                    // 'user.username' => 'nullable|string|max:255|unique:users,username', // If you use username for login

                    // Vendor specific details
                    'name' => 'required|string|max:200',
                    'phone_number' => 'nullable|string|max:20',
                    'whatsapp_number' => 'nullable|string|max:20',
                    'shop_name' => 'nullable|string|max:200',
                    'address' => 'nullable|string',
                    'pincode' => 'nullable|string|max:10',
                    'account_holder_name' => 'nullable|string|max:200',
                    'account_number' => 'nullable|string|max:20',
                    'bank_ifsc' => 'nullable|string|max:20',
                    'upi_id' => 'nullable|string|max:255',
                    'paytm_number' => 'nullable|string|max:20',
                    'phonepe_number' => 'nullable|string|max:20',
                    'gpay_number' => 'nullable|string|max:20',
                    'pickup_address_name' => 'nullable|string|max:150',
                    'pickup_address' => 'nullable|string',
                    'calling_number' => 'nullable|string|max:20',
                    'contact_person_name' => 'nullable|string|max:255',
                    'city' => 'nullable|string|max:100',
                    'gst_number' => 'nullable|string|max:50',
                    'pickup_time' => 'nullable|date_format:H:i:s', // e.g., 14:30:00
                    'preferred_courier_id' => 'nullable|exists:courier_companies,id',
                    'is_deleted' => 'boolean',
                ]);

                // 2. Create the User account for the vendor
                $user = User::create([
                    'name' => $request->input('user.name'),
                    'email' => $request->input('user.email'),
                    'password' => Hash::make($request->input('user.password')),
                    'role' => 'vendor', // Assign 'vendor' role automatically
                    // 'username' => $request->input('user.username'), // Uncomment if using username
                ]);

                // 3. Create the Vendor record and link it to the new user
                $vendor = Vendor::create([
                    'user_id' => $user->id,
                    'name' => $request->input('name'),
                    'phone_number' => $request->input('phone_number'),
                    'whatsapp_number' => $request->input('whatsapp_number'),
                    'shop_name' => $request->input('shop_name'),
                    'address' => $request->input('address'),
                    'pincode' => $request->input('pincode'),
                    'account_holder_name' => $request->input('account_holder_name'),
                    'account_number' => $request->input('account_number'),
                    'bank_ifsc' => $request->input('bank_ifsc'),
                    'upi_id' => $request->input('upi_id'),
                    'paytm_number' => $request->input('paytm_number'),
                    'phonepe_number' => $request->input('phonepe_number'),
                    'gpay_number' => $request->input('gpay_number'),
                    'pickup_address_name' => $request->input('pickup_address_name'),
                    'pickup_address' => $request->input('pickup_address'),
                    'calling_number' => $request->input('calling_number'),
                    'contact_person_name' => $request->input('contact_person_name'),
                    'city' => $request->input('city'),
                    'gst_number' => $request->input('gst_number'),
                    'pickup_time' => $request->input('pickup_time'),
                    'preferred_courier_id' => $request->input('preferred_courier_id'),
                    'is_deleted' => $request->input('is_deleted', false),
                ]);

                // 4. Update the user's vendor_id field
                $user->vendor_id = $vendor->id;
                $user->save();

                return response()->json([
                    'message' => 'Vendor and associated user created successfully!',
                    'vendor' => $vendor->load(['user', 'preferredCourier']) // Load relationships for response
                ], 201);

            } catch (ValidationException $e) {
                return response()->json(['message' => 'Validation failed', 'errors' => $e->errors()], 422);
            } catch (\Exception $e) {
                \Log::error('Vendor creation failed: ' . $e->getMessage(), ['exception' => $e]);
                return response()->json(['message' => 'Vendor creation failed', 'error' => $e->getMessage()], 500);
            }
        });
    }

    /**
     * Display the specified vendor.
     *
     * @param  \App\Models\Vendor  $vendor
     * @return \Illuminate\Http\JsonResponse
     */
    public function show(Vendor $vendor)
    {
        // Eager load the associated user and preferred courier
        return response()->json($vendor->load(['user', 'preferredCourier']));
    }

    /**
     * Update the specified vendor in storage.
     * This can also update the associated user's name/email if provided.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Vendor  $vendor
     * @return \Illuminate\Http\JsonResponse
     */
    public function update(Request $request, Vendor $vendor)
    {
        return DB::transaction(function () use ($request, $vendor) {
            try {
                // 1. Validate incoming request data
                $request->validate([
                    // User details (optional for update)
                    'user.name' => 'sometimes|required|string|max:255',
                    'user.email' => 'sometimes|required|string|email|max:255|unique:users,email,' . $vendor->user_id,
                    'user.password' => 'nullable|string|min:6', // Password for the vendor's user account (optional)

                    // Vendor specific details
                    'name' => 'sometimes|required|string|max:200',
                    'phone_number' => 'nullable|string|max:20',
                    'whatsapp_number' => 'nullable|string|max:20',
                    'shop_name' => 'nullable|string|max:200',
                    'address' => 'nullable|string',
                    'pincode' => 'nullable|string|max:10',
                    'account_holder_name' => 'nullable|string|max:200',
                    'account_number' => 'nullable|string|max:20',
                    'bank_ifsc' => 'nullable|string|max:20',
                    'upi_id' => 'nullable|string|max:255',
                    'paytm_number' => 'nullable|string|max:20',
                    'phonepe_number' => 'nullable|string|max:20',
                    'gpay_number' => 'nullable|string|max:20',
                    'pickup_address_name' => 'nullable|string|max:150',
                    'pickup_address' => 'nullable|string',
                    'calling_number' => 'nullable|string|max:20',
                    'contact_person_name' => 'nullable|string|max:255',
                    'city' => 'nullable|string|max:100',
                    'gst_number' => 'nullable|string|max:50',
                    'pickup_time' => 'nullable|date_format:H:i:s',
                    'preferred_courier_id' => 'nullable|exists:courier_companies,id',
                    'is_deleted' => 'boolean',
                ]);

                // 2. Update associated User account if user data is provided
                if ($request->has('user')) {
                    $userData = $request->input('user');
                    $user = $vendor->user; // Get the associated user model
                    if ($user) {
                        if (isset($userData['name'])) {
                            $user->name = $userData['name'];
                        }
                        if (isset($userData['email'])) {
                            $user->email = $userData['email'];
                        }
                        if (isset($userData['password']) && !empty($userData['password'])) {
                            $user->password = Hash::make($userData['password']);
                        }
                        $user->save();
                    }
                }

                // 3. Update the Vendor record
                $vendor->update($request->except(['user'])); // Exclude 'user' data from vendor update

                return response()->json([
                    'message' => 'Vendor and associated user updated successfully!',
                    'vendor' => $vendor->load(['user', 'preferredCourier'])
                ]);

            } catch (ValidationException $e) {
                return response()->json(['message' => 'Validation failed', 'errors' => $e->errors()], 422);
            } catch (\Exception $e) {
                \Log::error('Vendor update failed: ' . $e->getMessage(), ['exception' => $e]);
                return response()->json(['message' => 'Vendor update failed', 'error' => $e->getMessage()], 500);
            }
        });
    }

    /**
     * Remove the specified vendor from storage (soft delete).
     * This will also soft delete the associated user account.
     *
     * @param  \App\Models\Vendor  $vendor
     * @return \Illuminate\Http\JsonResponse
     */
    public function destroy(Vendor $vendor)
    {
        return DB::transaction(function () use ($vendor) {
            try {
                // Soft delete the vendor
                $vendor->is_deleted = true;
                $vendor->save();

                // Soft delete the associated user
                $user = $vendor->user;
                if ($user) {
                    $user->is_deleted = true; // Assuming 'is_deleted' column in users table
                    $user->save();
                    // Or if using SoftDeletes trait on User model: $user->delete();
                }

                return response()->json(['message' => 'Vendor and associated user soft-deleted successfully']);
            } catch (\Exception $e) {
                \Log::error('Vendor deletion failed: ' . $e->getMessage(), ['exception' => $e]);
                return response()->json(['message' => 'Vendor deletion failed', 'error' => $e->getMessage()], 500);
            }
        });
    }
}
