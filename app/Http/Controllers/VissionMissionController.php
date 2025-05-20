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
            'vission' => 'required|string|max:65535', // Max for TEXT or LONGTEXT
            'mission' => 'required|string|max:65535',
        ]);

        VissionMission::create([
            'vission' => $request->input('vission'),
            'mission' => $request->input('mission'),
        ]);

        return redirect()->route('admin.vissionmission.index')
            ->with('success', 'Vission and Mission created successfully.');
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit($id)
    {
        $vissionMission = VissionMission::findOrFail($id);
        return view('admin.vissionmission.edit', compact('vissionMission'));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, $id)
    {
        $request->validate([
            'vission' => 'required|string|max:65535',
            'mission' => 'required|string|max:65535',
        ]);

        $vissionMission = VissionMission::findOrFail($id);
        $vissionMission->update([
            'vission' => $request->input('vission'),
            'mission' => $request->input('mission'),
        ]);

        return redirect()->route('admin.vissionmission.index')
            ->with('success', 'Vission and Mission updated successfully.');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy($id)
    {
        $vissionMission = VissionMission::findOrFail($id);
        $vissionMission->delete();

        return redirect()->route('admin.vissionmission.index')
            ->with('success', 'Vission and Mission deleted successfully.');
    }
}
