<?php

namespace App\Http\Controllers;

use App\Models\Duration;
use Illuminate\Http\Request;

class DurationController extends Controller
{
    public function index()
    {
        $durations = Duration::all();
        return view('Admin.duration.index', compact('durations'));
    }

    public function create()
    {
        return view('Admin.duration.create');
    }

    public function store(Request $request)
    {
        $validated = $request->validate([
            'type' => 'required|string|max:255',
            'duration' => 'required|string|max:255',
        ]);

        Duration::create($validated);

        return redirect()->route('durations.index')->with('success', 'Duration created successfully');
    }



    public function edit(Duration $duration)
    {
        return view('Admin.duration.edit', compact('duration'));
    }

    public function update(Request $request, Duration $duration)
    {
        $validated = $request->validate([
            'type' => 'required|string|max:255',
            'duration' => 'required|string|max:255',
        ]);

        $duration->update($validated);

        return redirect()->route('durations.index')->with('success', 'Duration updated successfully');
    }


}
