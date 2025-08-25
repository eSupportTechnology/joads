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

        $hasDateRange = $startDate && $endDate;

        // Get all categories (without undefined relationships)
        $categories = Category::with(['jobPostings'])->get();

        // Build date range array if date range is provided
        $dateRange = [];
        if ($hasDateRange) {
            $period = new \DatePeriod(
                new \DateTime($startDate),
                new \DateInterval('P1D'),
                (new \DateTime($endDate))->modify('+1 day') // inclusive
            );

            foreach ($period as $date) {
                $dateRange[] = $date->format('Y-m-d');
            }
        }

        foreach ($categories as $category) {
            // Base query: approved jobs in this category
            $jobQuery = DB::table('job_postings')
                ->where('status', 'approved')
                ->where('category_id', $category->id);

            if ($hasDateRange) {
                $jobQuery->whereDate('created_at', '>=', $startDate)
                    ->whereDate('created_at', '<=', $endDate)
                    ->where('closing_date', '>=', \Carbon\Carbon::now());
            }

            $jobIds = $jobQuery->pluck('id');
            $category->approved_job_postings_count = $jobIds->count();

            // --- TOTAL VIEWS ---
            if ($hasDateRange) {
                $viewsByDate = DB::table('job_views')
                    ->whereIn('job_posting_id', $jobIds)
                    ->where('view_count', '>', 0)
                    ->whereBetween(DB::raw('DATE(view_date)'), [$startDate, $endDate])
                    ->selectRaw('DATE(view_date) as d, SUM(view_count) as total')
                    ->groupBy('d')
                    ->pluck('total', 'd');


                $category->approved_view_count = $viewsByDate->sum();

                // Map daily views to each date, fill 0 if no data
                $dailyViews = [];
                foreach ($dateRange as $d) {
                    $dailyViews[$d] = $viewsByDate[$d] ?? 0;
                }
                $category->daily_views = $dailyViews;
            } else {
                $today = \Carbon\Carbon::today()->toDateString();
                $totalCount = DB::table('job_postings')
                    ->whereIn('id', $jobIds)
                    ->where('view_count', '>', 0)
                    ->sum('view_count');
                $todayCount = DB::table('job_postings')
                    ->whereIn('id', $jobIds)
                    // ->whereDate('view_date', $today)
                    ->where('update_count', '>', 0)
                    ->sum('view_count');

                $category->approved_view_count = $totalCount;
                $category->daily_views = [$today => $todayCount];
                $dateRange = [$today];
            }
        }

        // --- REMOVE ALL-ZERO DATES ---
        if ($hasDateRange) {
            $filteredDates = [];
            foreach ($dateRange as $d) {
                $sumForDate = 0;
                foreach ($categories as $category) {
                    $sumForDate += $category->daily_views[$d] ?? 0;
                }
                if ($sumForDate > 0) {
                    $filteredDates[] = $d;
                }
            }
            $dateRange = $filteredDates;
        }

        return view('Admin.categoryview', compact('categories', 'startDate', 'endDate', 'hasDateRange', 'dateRange'));
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
