<?php

namespace App\Http\Controllers;

use App\Models\Service;
use App\Models\ServiceGallary;
use Illuminate\Http\Request;

class ServiceController extends Controller
{
    public function index()
    {
        $services = Service::all();
        return view('Admin.Services.index', compact('services'));
    }

    public function create()
    {
        return view('Admin.Services.create');
    }

    public function store(Request $request)
    {
        $request->validate([
            'title' => 'required|string',
            'features' => 'required|array',
        ]);

        Service::create($request->only('title', 'highlight') + [
            'features' => $request->features
        ]);

        return redirect()->route('admin.services.index')->with('success', 'Service created successfully.');
    }

    public function edit(Service $service)
    {
        return view('Admin.Services.edit', compact('service'));
    }

    public function update(Request $request, Service $service)
    {
        $request->validate([
            'title' => 'required|string',
            'features' => 'required|array',
        ]);

        $service->update($request->only('title', 'highlight') + [
            'features' => $request->features
        ]);

        return redirect()->route('admin.services.index')->with('success', 'Service updated successfully.');
    }

    public function destroy(Service $service)
    {
        $service->delete();
        return redirect()->route('admin.services.index')->with('success', 'Service deleted successfully.');
    }

    public function indexgallary()
    {
        $services = ServiceGallary::all();
        return view('Admin.Services.indexgallary', compact('services'));
    }
    public function creategallary()
    {
        return view('Admin.Services.creategallary');
    }

    public function storegallary(Request $request)
    {
        $request->validate([
            'image' => 'nullable|image|mimes:jpeg,png,jpg,gif|max:2048',
            'video' => 'nullable|mimes:mp4,avi,mov|max:20480',
        ]);

        $image = $request->file('image');
        $video = $request->file('video');
        $data = [];
        if ($image) {
            $data['image'] = $image->store('service_images', 'public');
        }
        if ($video) {
            $data['video'] = $video->store('service_videos', 'public');
        }
        ServiceGallary::create($data);
        return redirect()->route('admin.service-gallery.index')->with('success', 'Service gallery item created successfully.');
    }
    public function editgallary($id)
    {
        $serviceGallary = ServiceGallary::findOrFail($id);
        return view('Admin.Services.editgallary', compact('serviceGallary'));
    }
    public function updategallary(Request $request, $id)
    {
        $request->validate([
            'image' => 'nullable|image|mimes:jpeg,png,jpg,gif|max:2048',
            'video' => 'nullable|mimes:mp4,avi,mov|max:20480',
        ]);

        $data = [];
        if ($request->hasFile('image')) {
            $data['image'] = $request->file('image')->store('service_images', 'public');
        }
        if ($request->hasFile('video')) {
            $data['video'] = $request->file('video')->store('service_videos', 'public');
        }

        $gallery = ServiceGallary::findOrFail($id);
        $gallery->update($data);
        return redirect()->route('admin.service-gallery.index')->with('success', 'Service gallery item updated successfully.');
    }
    public function destroygallary($id)
    {
        $serviceGallary = ServiceGallary::findOrFail($id);
        $serviceGallary->delete();
        return redirect()->route('admin.service-gallery.index')->with('success', 'Service gallery item deleted successfully.');
    }
}
