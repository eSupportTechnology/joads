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
        $endDate   = $request->input('end_date');

        if ($startDate && $endDate) {
            // ✅ Case 2: Date range selected — pivoted daily breakdown
            $rawResults = DB::table('job_postings')
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
                    'job_postings.approved_date',
                    'job_postings.job_id',
                    'job_views.view_date',
                    DB::raw('SUM(job_views.view_count) as daily_view')
                )
                ->groupBy('job_postings.id', 'employers.company_name', 'job_postings.title', 'job_postings.approved_date', 'job_postings.job_id', 'job_views.view_date')
                ->orderBy('job_postings.id')
                ->orderBy('job_views.view_date')
                ->get();

            // ✅ Collect unique dates
            $dates = $rawResults->pluck('view_date')->unique()->sort()->values();

            // ✅ Pivot results by job
            $results = $rawResults->groupBy('job_id')->map(function ($group) use ($dates) {
                $job = [
                    'approved_date' => $group->first()->approved_date
                        ? Carbon::parse($group->first()->approved_date)->format('Y-m-d')
                        : 'Not Approved',
                    'job_id'       => $group->first()->job_id,
                    'company_name' => $group->first()->company_name,
                    'title'        => $group->first()->title,
                    'views'        => [],
                    'total'        => 0,
                ];

                foreach ($dates as $date) {
                    $view = $group->firstWhere('view_date', $date);
                    $count = $view ? $view->daily_view : 0;
                    $job['views'][$date] = $count;
                    $job['total'] += $count;
                }

                return $job;
            });

            return view('Admin.report.performance', [
                'results'   => $results,
                'dates'     => $dates,
                'startDate' => $startDate,
                'endDate'   => $endDate,
            ]);
        } else {
            // ✅ Case 1: No date range — convert to array as well
            $results = DB::table('job_postings')
                ->join('employers', 'job_postings.employer_id', '=', 'employers.id')
                ->select(
                    'job_postings.id as job_id',
                    'employers.company_name',
                    'job_postings.title',
                    'job_postings.update_count as daily_view',
                    'job_postings.view_count as total_view',
                    'job_postings.approved_date',
                    'job_postings.job_id'
                )
                ->orderBy('job_postings.id')
                ->get()
                ->map(function ($row) {
                    return [
                        'approved_date' => $row->approved_date
                            ? Carbon::parse($row->approved_date)->format('Y-m-d')
                            : 'Not Approved',
                        'job_id'       => $row->job_id,
                        'company_name' => $row->company_name,
                        'title'        => $row->title,
                        'daily_view'   => $row->daily_view,
                        'total'        => $row->total_view,
                    ];
                });

            return view('Admin.report.performance', [
                'results'   => $results,
                'dates'     => [],
                'startDate' => $startDate,
                'endDate'   => $endDate,
            ]);
        }
    }
}
