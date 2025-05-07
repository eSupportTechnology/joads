<?php

namespace App\Http\Controllers;

use App\Models\VissionMission;
use Illuminate\Http\Request;

class VissionMissionController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $vissionMissions = VissionMission::all();
        return view('Admin.vissionmission.index', compact('vissionMissions'));
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        return view('Admin.vissionmission.create');
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $request->validate([
            'vission' => 'required|string',
            'mission' => 'required|string',
        ]);

        VissionMission::create($request->all());

        return redirect()->route('admin.vissionmission.index')->with('success', ' created successfully.');
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit($id)
    {
        $vissionMission = VissionMission::findOrFail($id);
        return view('Admin.vissionmission.edit', compact('vissionMission'));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, $id)
    {
        $request->validate([
            'vission' => 'required|string',
            'mission' => 'required|string',
        ]);

        $vissionMission = VissionMission::findOrFail($id);
        $vissionMission->update($request->all());

        return redirect()->route('admin.vissionmission.index')->with('success', ' updated successfully.');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy($id)
    {
        $vissionMission = VissionMission::findOrFail($id);
        $vissionMission->delete();

        return redirect()->route('admin.vissionmission.index')->with('success', 'deleted successfully.');
    }
}
