<?php

namespace App\Http\Controllers;

use App\Http\Requests\UpdateUserRequest;
use App\Http\Requests\UserRequest;
use App\Models\OPD;
use App\Models\User;
use Illuminate\Support\Facades\Hash;

class UserController extends Controller
{
    public function index()
    {
        $users = User::with('opd')->paginate();
        return view('user.index', compact('users'));
    }

    public function create()
    {
        $opds = OPD::get(['id', 'name']);
        return view('user.create', compact('opds'));
    }

    public function store(UserRequest $request)
    {
        $payload = $request->validated();
        $payload['password'] = Hash::make($request->password);
        $user = User::create($payload);

        return response()->json($user, 201);
    }

    public function show(User $user)
    {
        return $user->load('opd');
    }

    public function update(UpdateUserRequest $request, User $user)
    {
        $payload = $request->validated();
        if ($request->password) {
            $payload['password'] = Hash::make($request->password);
        }

        $user->update($payload);
        $user->refresh();
        return $user;
    }

    public function destroy(User $user)
    {
        $user->delete();
        return response()->json(true, 204);
    }

    public function updateRole()
    {
    }
}
