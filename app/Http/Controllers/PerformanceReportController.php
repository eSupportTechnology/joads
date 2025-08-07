<?php

namespace App\Http\Controllers;

use Carbon\Carbon;
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
    $startDate = $request->input('start_date');
    $endDate = $request->input('end_date');

    if ($startDate && $endDate) {
        // ✅ Case 1: Date range selected — filter job_views and sum views
        $results = DB::table('job_postings')
            ->join('employers', 'job_postings.employer_id', '=', 'employers.id')
            ->join('job_views', 'job_postings.id', '=', 'job_views.job_posting_id')
            ->whereBetween('job_views.view_date', [
                Carbon::parse($startDate)->toDateString(),
                Carbon::parse($endDate)->toDateString()
            ])
            ->select(
                'employers.company_name',
                'job_postings.title',
                DB::raw('SUM(job_views.view_count) as total_daily_count')
            )
            ->groupBy('job_postings.id', 'employers.company_name', 'job_postings.title')
            ->havingRaw('SUM(job_views.view_count) > 0')
            ->get();
    } else {
        // ✅ Case 2: No date range — show all job_postings with their view_count
        $results = DB::table('job_postings')
            ->join('employers', 'job_postings.employer_id', '=', 'employers.id')
            // ->where('job_postings.view_count', '>', 0)
            ->select(
                'employers.company_name',
                'job_postings.title',
                'job_postings.view_count as total_daily_count'
            )
            ->get();
    }

    return view('Admin.report.performance', compact('results', 'startDate', 'endDate'));
}

}
