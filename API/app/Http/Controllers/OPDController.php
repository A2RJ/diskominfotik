<?php

namespace App\Http\Controllers;

use App\Http\Requests\OPDRequest;
use App\Models\OPD;
use Illuminate\Http\Request;

class OPDController extends Controller
{
    public function index()
    {
        return OPD::with(['users', 'assets'])->paginate();
    }

    public function store(OPDRequest $request)
    {
        $opd = OPD::create($request->validated());
        return response()->json($opd, 201);
    }

    public function show(OPD $opd)
    {
        return $opd->load(['users', 'assets']);
    }

    public function update(OPDRequest $request, OPD $opd)
    {
        $opd->update($request->validated());
        $opd->refresh();
        return $opd;
    }

    public function destroy(OPD $opd)
    {
        $opd->delete();
        return response()->json(true, 204);
    }
}
