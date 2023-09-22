<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;

class AuthController extends Controller
{
    public function login(Request $request)
    {
        try {
            $request->validate([
                'email' => 'required|email',
                'password' => 'required',
            ]);

            $user = User::where('email', $request->email)->first();

            if (!$user || !Hash::check($request->password, $user->password)) return response()->json(
                ['error' => 'The provided credentials are incorrect.'],
                401
            );

            $user->tokens()->delete();

            return [
                'type' => 'Bearer',
                'access_token' => $user->createToken($request->email, [$user->role])->plainTextToken,
            ];
        } catch (\Throwable $th) {
            throw $th;
        }
    }
}
