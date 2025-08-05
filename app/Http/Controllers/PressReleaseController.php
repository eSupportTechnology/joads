<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Models\PressRelease;
use Illuminate\Support\Facades\Storage;

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
            'image' => 'required|image|mimes:jpeg,png,jpg,gif|max:10048',
            'video' => 'nullable|file|mimes:mp4,avi,mov|max:200480',
            'link' => 'nullable|url',
        ]);

        try {
            $imagePath = $request->file('image')->store('press-releases', 'public');
            $videoPath = null;

            if ($request->hasFile('video')) {
                $videoPath = $request->file('video')->store('press-releases/videos', 'public');
            }

            PressRelease::create([
                'title' => $request->title,
                'description' => $request->description,
                'image' => $imagePath,
                'video' => $videoPath,
                'link' => $request->link,
            ]);

            return redirect()->route('press-releases.index')->with('success', 'Press release created successfully!');
        } catch (\Exception $e) {
            return back()->withErrors(['error' => 'Failed to upload files: ' . $e->getMessage()]);
        }
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
            'image' => 'nullable|image|mimes:jpeg,png,jpg,gif|max:10048',
            'video' => 'nullable|file|mimes:mp4,avi,mov|max:200480',
            'link' => 'nullable|url',
        ]);

        try {
            if ($request->hasFile('image')) {
                Storage::delete('public/' . $pressRelease->image);
                $imagePath = $request->file('image')->store('press-releases', 'public');
                $pressRelease->image = $imagePath;
            }

            if ($request->hasFile('video')) {
                Storage::delete('public/' . $pressRelease->video);
                $videoPath = $request->file('video')->store('press-releases/videos', 'public');
                $pressRelease->video = $videoPath;
            }

            $pressRelease->update([
                'title' => $request->title,
                'description' => $request->description,
                'link' => $request->link,
            ]);

            return redirect()->route('press-releases.index')->with('success', 'Press release updated successfully!');
        } catch (\Exception $e) {
            return back()->withErrors(['error' => 'Failed to update press release: ' . $e->getMessage()]);
        }
    }


    public function destroy(PressRelease $pressRelease)
    {
        Storage::delete('public/' . $pressRelease->image);
        if ($pressRelease->video) {
            Storage::delete('public/' . $pressRelease->video);
        }
        $pressRelease->delete();

        return redirect()->route('press-releases.index')->with('success', 'Press release deleted successfully!');
    }

    public function storeMultiple(Request $request)
    {
        $request->validate([
            'press_releases' => 'required|array',
            'press_releases.*.title' => 'required|string|max:255',
            'press_releases.*.description' => 'required|string',
            'press_releases.*.image' => 'required|image|mimes:jpeg,png,jpg,gif|max:10048',
            'press_releases.*.video' => 'nullable|file|mimes:mp4,avi,mov|max:200480',
            'press_releases.*.link' => 'nullable|url',
        ]);

        try {
            foreach ($request->press_releases as $pressReleaseData) {
                $imagePath = $pressReleaseData['image']->store('press-releases', 'public');

                $videoPath = null;
                if (isset($pressReleaseData['video']) && $pressReleaseData['video'] instanceof \Illuminate\Http\UploadedFile) {
                    $videoPath = $pressReleaseData['video']->store('press-releases/videos', 'public');
                }

                PressRelease::create([
                    'title' => $pressReleaseData['title'],
                    'description' => $pressReleaseData['description'],
                    'image' => $imagePath,
                    'video' => $videoPath,
                    'link' => $pressReleaseData['link'] ?? null,
                ]);
            }

            return redirect()->route('press-releases.index')->with('success', 'Multiple press releases created successfully!');
        } catch (\Exception $e) {
            return back()->withErrors(['error' => 'Failed to upload multiple press releases: ' . $e->getMessage()]);
        }
    }


    public function frontendIndex()
    {
        $pressReleases = PressRelease::latest()->get(); // Fetch all press releases ordered by latest
        return view('press-releases.frontend', compact('pressReleases'));
    }
}
