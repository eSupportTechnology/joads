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
        $endDate   = $request->query('end_date');

        // Consider a range ONLY when BOTH dates are provided
        $hasDateRange = $startDate && $endDate;

        $countries = Country::select('countries.id', 'countries.name')->get();

        foreach ($countries as $country) {
            // All job IDs in this country
            $jobIds = DB::table('job_postings')
                ->where('country_id', $country->id)
                ->pluck('id');

            if ($hasDateRange) {
                // --- TOTAL VIEWS within range (from job_views) ---
                $country->total_view_count = DB::table('job_views')
                    ->whereIn('job_posting_id', $jobIds)
                    ->where('view_count', '>', 0)
                    ->whereBetween(DB::raw('DATE(view_date)'), [$startDate, $endDate])
                    ->sum('view_count');

                // --- BREAKDOWN by date within range ---
                $country->views_by_date = DB::table('job_views')
                    ->selectRaw('DATE(view_date) as d, SUM(view_count) as total')
                    ->whereIn('job_posting_id', $jobIds)
                    ->where('view_count', '>', 0)
                    ->whereBetween(DB::raw('DATE(view_date)'), [$startDate, $endDate])
                    ->groupBy('d')
                    ->orderBy('d')
                    ->get();
            } else {
                // --- TOTAL VIEWS all-time (from job_postings) ---
                $country->total_view_count = DB::table('job_postings')
                    ->whereIn('id', $jobIds)
                    ->sum('view_count');

                // --- TODAY'S VIEWS (single line breakdown) ---
                $today = \Carbon\Carbon::today()->toDateString();
                $todayCount = DB::table('job_views')
                    ->whereIn('job_posting_id', $jobIds)
                    ->whereDate('view_date', $today)
                    ->where('view_count', '>', 0)
                    ->sum('view_count');

                $country->views_by_date = collect([
                    (object)['d' => $today, 'total' => $todayCount],
                ]);
            }
        }

        return view('Admin.country.index', compact('countries', 'startDate', 'endDate', 'hasDateRange'));
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
