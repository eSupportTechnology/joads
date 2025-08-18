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
        // ✅ Case 2: Date range selected — daily breakdown
        $results = DB::table('job_postings')
            ->join('employers', 'job_postings.employer_id', '=', 'employers.id')
            ->join('job_views', 'job_postings.id', '=', 'job_views.job_posting_id')
            ->whereBetween('job_views.view_date', [
                Carbon::parse($startDate)->toDateString(),
                Carbon::parse($endDate)->toDateString()
            ])
            ->select(
                'job_postings.id as job_id',
                'employers.company_name',
                'job_postings.title',
                'job_views.view_date',
                DB::raw('SUM(job_views.view_count) as daily_view'),
                DB::raw('(SELECT SUM(jv.view_count)
                          FROM job_views jv
                          WHERE jv.job_posting_id = job_postings.id
                          AND jv.view_date BETWEEN "'.Carbon::parse($startDate)->toDateString().'"
                          AND "'.Carbon::parse($endDate)->toDateString().'") as total_view')
            )
            ->groupBy('job_postings.id', 'employers.company_name', 'job_postings.title', 'job_views.view_date')
            ->orderBy('job_postings.id')
            ->orderBy('job_views.view_date')
            ->get();
    } else {
        // ✅ Case 1: No date range — from job_postings table
        $results = DB::table('job_postings')
            ->join('employers', 'job_postings.employer_id', '=', 'employers.id')
            ->select(
                'job_postings.id as job_id',
                'employers.company_name',
                'job_postings.title',
                'job_postings.update_count as daily_view',
                'job_postings.view_count as total_view'
            )
            ->orderBy('job_postings.id')
            ->get();
    }

    return view('Admin.report.performance', compact('results', 'startDate', 'endDate'));
}


}
