<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class PerformanceReportController extends Controller
{   
    public function dailyPostCount($startDate, $endDate)
    {
        // Ensure the dates include full day (00:00:00 to 23:59:59)
        $startDateTime = \Carbon\Carbon::parse($startDate)->startOfDay()->toDateTimeString();
        $endDateTime = \Carbon\Carbon::parse($endDate)->endOfDay()->toDateTimeString();

        $results = DB::table('post_histories')
            ->join('job_postings', 'post_histories.post_id', '=', 'job_postings.id')
            ->join('employers', 'job_postings.employer_id', '=', 'employers.id')
            ->select(
                'employers.company_name',
                'job_postings.title',
                DB::raw('SUM(post_histories.daily_count) as total_daily_count')
            )
            ->whereBetween('post_histories.created_at', [$startDateTime, $endDateTime])
            ->groupBy('employers.company_name', 'job_postings.title')
            ->get();

        return $results;
    }


    public function index(Request $request)
    {
        // Get date range from query params or set default range (last 7 days)
        $startDate = $request->input('start_date', now()->subDays(7)->startOfDay()->toDateTimeString());
        $endDate = $request->input('end_date', now()->endOfDay()->toDateTimeString());

        // Call dailyPostCount with date range
        $results = $this->dailyPostCount($startDate, $endDate);

        // Pass data and dates to the view
        return view('Admin.report.performance', compact('results', 'startDate', 'endDate'));
    }
}
