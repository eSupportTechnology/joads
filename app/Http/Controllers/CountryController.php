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
    $hasDateRange = $startDate && $endDate;

    $countries = Country::select('countries.id', 'countries.name')->get();

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

    foreach ($countries as $country) {
        $jobIds = DB::table('job_postings')
            ->where('country_id', $country->id)
            ->pluck('id');

        if ($hasDateRange) {
            $viewsByDate = DB::table('job_views')
                ->selectRaw('DATE(view_date) as d, SUM(view_count) as total')
                ->whereIn('job_posting_id', $jobIds)
                ->where('view_count', '>', 0)
                ->whereBetween(DB::raw('DATE(view_date)'), [$startDate, $endDate])
                ->groupBy('d')
                ->pluck('total', 'd');

            $country->total_view_count = $viewsByDate->sum();

            $tempViews = [];
            foreach ($dateRange as $d) {
                $tempViews[$d] = $viewsByDate[$d] ?? 0;
            }
            $country->views_by_date = $tempViews;
        } else {
            $country->total_view_count = DB::table('job_postings')
                ->whereIn('id', $jobIds)
                ->sum('view_count');

            $today = \Carbon\Carbon::today()->toDateString();
            $todayCount = DB::table('job_views')
                ->whereIn('job_posting_id', $jobIds)
                ->whereDate('view_date', $today)
                ->where('view_count', '>', 0)
                ->sum('view_count');

            $country->views_by_date = [$today => $todayCount];
            $dateRange = [$today];
        }
    }

    // ✅ FILTER OUT all-zero dates
    if ($hasDateRange) {
        $filteredDates = [];
        foreach ($dateRange as $d) {
            $sumForDate = 0;
            foreach ($countries as $country) {
                $sumForDate += $country->views_by_date[$d] ?? 0;
            }
            if ($sumForDate > 0) {
                $filteredDates[] = $d;
            }
        }
        $dateRange = $filteredDates;
    }

    return view('Admin.country.index', compact('countries', 'startDate', 'endDate', 'hasDateRange', 'dateRange'));
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
