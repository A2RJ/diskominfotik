<?php

namespace App\Http\Controllers;

use App\Http\Requests\AssetRequest;
use App\Http\Requests\UpdateAssetRequest;
use App\Models\Asset;

class AssetController extends Controller
{
    public function index()
    {
        return Asset::with('opd')->paginate();
    }

    public function store(AssetRequest $request)
    {
        $asset = Asset::create($request->validated());
        return response()->json($asset, 201);
    }

    public function show(Asset $asset)
    {
        return $asset->load('opd');
    }

    public function update(UpdateAssetRequest $request, Asset $asset)
    {
        $asset->update($request->validated());
        $asset->refresh();
        return $asset;
    }

    public function destroy(Asset $asset)
    {
        $asset->delete();
        return response()->json(true, 204);
    }
}
