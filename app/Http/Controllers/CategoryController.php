<?php

namespace App\Http\Controllers;

use App\Models\Category;
use App\Models\Subcategory;
use Illuminate\Http\Request;
use App\Models\Application;
use App\Models\User;
use Carbon\Carbon;
use Illuminate\Support\Facades\DB;

class CategoryController extends Controller
{
    // Display a listing of categories

public function index(Request $request)
{
    $startDate = $request->query('start_date');
    $endDate = $request->query('end_date');
    $today = Carbon::today()->toDateString();

    $categories = Category::with('subcategories')
        ->withCount([
            'jobPostings as approved_job_postings_count' => function ($query) {
                $query->where('status', 'approved');
            }
        ])
        ->withSum([
            'jobPostings as approved_view_count' => function ($query) {
                $query->where('status', 'approved');
            }
        ], 'view_count')
        ->get()
        ->map(function ($category) use ($today, $startDate, $endDate) {
            $query = DB::table('job_postings')
                ->where('status', 'approved')
                ->where('category_id', $category->id);

            if ($startDate) {
                $query->whereDate('updated_at', '>=', $startDate);
            }
            if ($endDate) {
                $query->whereDate('updated_at', '<=', $endDate);
            }

            $category->today_views = $query->sum('update_count');

            return $category;
        });

    return view('Admin.categoryview', compact('categories'));
}


    // Show the form for creating a new category
    public function create()
    {
        return view('Admin.categoryform');
    }

    // Store a newly created category
    public function store(Request $request)
    {
        // Validate the form input
        $request->validate([
            'name' => 'required|string|max:255|unique:categories,name',
            'status' => 'required|in:active,inactive',
            'subcategories' => 'nullable|array',
            'subcategories.*' => 'string|max:255',
        ]);

        // Create the main category
        $category = Category::create([
            'name' => $request->name,
            'status' => $request->status,
        ]);

        // Add subcategories to the 'subcategories' table
        if ($request->has('subcategories')) {
            foreach ($request->subcategories as $subcategoryName) {
                if (!empty($subcategoryName)) {
                    Subcategory::create([
                        'name' => $subcategoryName,
                        'category_id' => $category->id,
                        'status' => 'active', // Default status
                    ]);
                }
            }
        }

        // Redirect back with success message
        return redirect()->route('admin.categories.index')->with('success', 'Category and subcategories created successfully!');
    }

    // Show the form for editing the specified category
    public function edit($id)
    {
        $category = Category::with('subcategories')->findOrFail($id);
        return view('Admin.editcategory', compact('category'));
    }

    // Update the specified category
    public function update(Request $request, $id)
{
    $category = Category::findOrFail($id);

    $request->validate([
        'name' => 'required|string|max:255|unique:categories,name,' . $id,
        'status' => 'required|in:active,inactive',
        'subcategories' => 'nullable|array',
        'subcategories.*' => 'string|max:255',
    ]);

    $category->update([
        'name' => $request->name,
        'status' => $request->status,
    ]);

    $existingSubcategories = $category->subcategories->pluck('name')->toArray();

    $submittedSubcategories = $request->subcategories ?? [];

    foreach ($category->subcategories as $subcategory) {
        if (!in_array($subcategory->name, $submittedSubcategories)) {
            $subcategory->delete();
        }
    }
    foreach ($submittedSubcategories as $subcategoryName) {
        $subcategoryName = trim($subcategoryName);
        if (!empty($subcategoryName) && !in_array($subcategoryName, $existingSubcategories)) {
            Subcategory::create([
                'name' => $subcategoryName,
                'category_id' => $category->id,
                'status' => 'active',
            ]);
        }
    }

    return redirect()->route('admin.categories.index')->with('success', 'Category updated successfully.');
}



    // Remove the specified category
    public function destroy($id)
    {
        $category = Category::findOrFail($id);

        // Delete associated subcategories first
        $category->subcategories()->delete();

        // Then delete the category
        $category->delete();

        return redirect()->route('admin.categories.index')->with('success', 'Category deleted successfully.');
    }
}
