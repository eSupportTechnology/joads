<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Models\PressRelease;

class PressReleaseController extends Controller
{
    public function index()
    {
        $pressReleases = PressRelease::all();
        return view('press-releases.index', compact('pressReleases'));
    }

    public function create()
    {
        return view('press-releases.create');
    }

    public function store(Request $request)
    {
        $request->validate([
            'title' => 'required|string|max:255',
            'description' => 'required',
            'image' => 'required|image|mimes:jpeg,png,jpg,gif|max:2048',
            'link' => 'nullable|url',
        ]);

        $imagePath = $request->file('image')->store('press-releases', 'public');

        PressRelease::create([
            'title' => $request->title,
            'description' => $request->description,
            'image' => $imagePath,
            'link' => $request->link,
        ]);

        return redirect()->route('press-releases.index')->with('success', 'Press release created successfully!');
    }

    public function show(PressRelease $pressRelease)
    {
        return view('press-releases.show', compact('pressRelease'));
    }

    public function edit(PressRelease $pressRelease)
    {
        return view('press-releases.edit', compact('pressRelease'));
    }

    public function update(Request $request, PressRelease $pressRelease)
    {
        $request->validate([
            'title' => 'required|string|max:255',
            'description' => 'required',
            'image' => 'nullable|image|mimes:jpeg,png,jpg,gif|max:2048',
            'link' => 'nullable|url',
        ]);

        if ($request->hasFile('image')) {
            Storage::delete('public/' . $pressRelease->image);
            $imagePath = $request->file('image')->store('press-releases', 'public');
            $pressRelease->image = $imagePath;
        }

        $pressRelease->update([
            'title' => $request->title,
            'description' => $request->description,
            'link' => $request->link,
        ]);

        return redirect()->route('press-releases.index')->with('success', 'Press release updated successfully!');
    }

    public function destroy(PressRelease $pressRelease)
    {
        Storage::delete('public/' . $pressRelease->image);
        $pressRelease->delete();

        return redirect()->route('press-releases.index')->with('success', 'Press release deleted successfully!');
    }

    public function storeMultiple(Request $request)
{
    $request->validate([
        'press_releases' => 'required|array',
        'press_releases.*.title' => 'required|string|max:255',
        'press_releases.*.description' => 'required|string',
        'press_releases.*.image' => 'required|image|mimes:jpeg,png,jpg,gif|max:2048',
        'press_releases.*.link' => 'nullable|url',
    ]);

    foreach ($request->press_releases as $pressReleaseData) {
        $imagePath = $pressReleaseData['image']->store('press-releases', 'public');

        PressRelease::create([
            'title' => $pressReleaseData['title'],
            'description' => $pressReleaseData['description'],
            'image' => $imagePath,
            'link' => $pressReleaseData['link'],
        ]);
    }

    return redirect()->route('press-releases.index')->with('success', 'Multiple press releases created successfully!');
}

public function frontendIndex()
{
    $pressReleases = PressRelease::latest()->get(); // Fetch all press releases ordered by latest
    return view('press-releases.frontend', compact('pressReleases'));
}
}
