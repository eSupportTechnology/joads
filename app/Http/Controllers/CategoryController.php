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
    $endDate   = $request->query('end_date');

    // Treat as a date range only when BOTH are present
    $hasDateRange = $startDate && $endDate;

    $categories = Category::with(['subcategories', 'jobPostings'])->get();

    foreach ($categories as $category) {

        // Base query: approved jobs in this category
        $jobQuery = DB::table('job_postings')
            ->where('status', 'approved')
            ->where('category_id', $category->id);

        // Only apply created_at + active filter when a FULL range is provided
        if ($hasDateRange) {
            $jobQuery->whereDate('created_at', '>=', $startDate)
                     ->whereDate('created_at', '<=', $endDate)
                     ->where('closing_date', '>=', \Carbon\Carbon::now());
        }

        $jobIds = $jobQuery->pluck('id');
        $category->approved_job_postings_count = $jobIds->count();

        // --- TOTAL VIEWS ---
        if ($hasDateRange) {
            // Sum from job_views within the range
            $category->approved_view_count = DB::table('job_views')
                ->join('job_postings', 'job_views.job_posting_id', '=', 'job_postings.id')
                ->where('job_postings.status', 'approved')
                ->where('job_postings.category_id', $category->id)
                ->where('job_views.view_count', '>', 0)
                ->whereBetween(DB::raw('DATE(job_views.view_date)'), [$startDate, $endDate])
                ->sum('job_views.view_count');
        } else {
            // All-time from job_postings
            $category->approved_view_count = DB::table('job_postings')
                ->where('status', 'approved')
                ->where('category_id', $category->id)
                ->sum('view_count');
        }

        // --- DAILY VIEWS (breakdown) ---
        if ($hasDateRange) {
            $category->daily_views = DB::table('job_views')
                ->join('job_postings', 'job_views.job_posting_id', '=', 'job_postings.id')
                ->selectRaw('DATE(job_views.view_date) as d, SUM(job_views.view_count) as total')
                ->where('job_postings.status', 'approved')
                ->where('job_postings.category_id', $category->id)
                ->where('job_views.view_count', '>', 0)
                ->whereBetween(DB::raw('DATE(job_views.view_date)'), [$startDate, $endDate])
                ->groupBy('d')
                ->orderBy('d')
                ->get();
        } else {
            $today = \Carbon\Carbon::today()->toDateString();
            $todayCount = DB::table('job_views')
                ->join('job_postings', 'job_views.job_posting_id', '=', 'job_postings.id')
                ->where('job_postings.status', 'approved')
                ->where('job_postings.category_id', $category->id)
                ->whereDate('job_views.view_date', $today)
                ->where('job_views.view_count', '>', 0)
                ->sum('job_views.view_count');

            $category->daily_views = collect([(object) ['d' => $today, 'total' => $todayCount]]);
        }
    }

    return view('Admin.categoryview', compact('categories', 'startDate', 'endDate', 'hasDateRange'));
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
