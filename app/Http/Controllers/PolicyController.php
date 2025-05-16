<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\ContactUs;
use App\Models\Policy;

class PolicyController extends Controller
{
    // Display the list of all terms and conditions
    public function index()
    {
        $policy = Policy::all(); // Assuming only one record exists for terms and conditions

        return view('Admin.policy.index', compact('policy'));
    }

    public function indexhome()
    {
        $policy= Policy::all();

        $contacts = ContactUs::all();

        return view('User.SideComponent.privacy', compact('policy', 'contacts'));
    }    
    // Show the form for creating a new terms and condition
    public function create()
    {
        return view('Admin.policy.create');
    }

    // Store a newly created terms and condition
    public function store(Request $request)
    {
        $request->validate([
            'title' => 'required|string|max:65535',
            'content' => 'required|string|max:65535',
        ]);

        Policy ::create([
            'title' => $request->title,
            'content' => $request->content,
        ]);

        return redirect()->route('admin.policy.index')->with('success', 'policy added successfully');
    }

    // Show the form for editing the specified terms and condition
    public function edit(Policy $policy)
    {
        return view('Admin.policy.edit', compact('policy'));
    }

    // Update the specified terms and condition
    public function update(Request $request, Policy $policy)
    {
        $request->validate([
            'title' => 'required|string|max:65535',
            'content' => 'required|string|max:65535',
        ]);

        $policy->update([
            'title' => $request->title,
            'content' => $request->content,
        ]);

        return redirect()->route('admin.policy.index')->with('success', 'policy updated successfully');
    }

    // Remove the specified terms and condition
    public function destroy(Policy  $policy)
    {
        $policy->delete();
        return redirect()->route('admin.policy.index')->with('success', 'policy deleted successfully');
    }
}