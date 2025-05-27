<?php

namespace App\Http\Controllers;

use App\Models\Service;
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
}
