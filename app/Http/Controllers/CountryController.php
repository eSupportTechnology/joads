<?php

namespace App\Http\Controllers;

use App\Models\Country;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class CountryController extends Controller
{

    public function index(Request $request)
{
    $startDate = $request->query('start_date');
    $endDate = $request->query('end_date');
    $hasDateRange = $startDate || $endDate;

    $countries = Country::select('countries.id', 'countries.name')->get();

    foreach ($countries as $country) {
        // Get all job IDs in this country
        $jobIds = DB::table('job_postings')
            ->where('country_id', $country->id)
            ->pluck('id');

        // --- TOTAL VIEWS ---
        if ($hasDateRange) {
            $viewQuery = DB::table('job_views')
                ->whereIn('job_posting_id', $jobIds)
                ->where('view_count', '>', 0); // exclude zero views

            if ($startDate) {
                $viewQuery->whereDate('view_date', '>=', $startDate);
            }
            if ($endDate) {
                $viewQuery->whereDate('view_date', '<=', $endDate);
            }

            $country->total_view_count = $viewQuery->sum('view_count');
        } else {
            // No date filter: get from job_postings table
            $country->total_view_count = DB::table('job_postings')
                ->whereIn('id', $jobIds)
                ->sum('view_count');
        }

        // --- TODAY'S VIEWS ---
        $country->total_update_count = DB::table('job_views')
            ->whereIn('job_posting_id', $jobIds)
            ->whereDate('view_date', Carbon::today())
            ->where('view_count', '>', 0)
            ->sum('view_count');
    }

    return view('Admin.country.index', compact('countries', 'startDate', 'endDate'));
}



    public function create()
    {
        return view('Admin.country.Create');
    }

    public function store(Request $request)
    {
        $validated = $request->validate([
            'name' => 'required|string|max:255|unique:countries',
        ]);

        Country::create($validated);

        return redirect()
            ->route('countries.index')
            ->with('success', 'Country created successfully');
    }

    public function edit(Country $country)
    {
        return view('Admin.country.edit', compact('country'));
    }

    public function update(Request $request, Country $country)
    {
        $validated = $request->validate([
            'name' => 'required|string|max:255|unique:countries,name,' . $country->id,
        ]);

        $country->update($validated);

        return redirect()
            ->route('countries.index')
            ->with('success', 'Country updated successfully');
    }

    public function destroy(Country $country)
    {
        $country->delete();

        return redirect()
            ->route('countries.index')
            ->with('success', 'Country deleted successfully');
    }
}
