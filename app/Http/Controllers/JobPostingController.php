<?php

namespace App\Http\Controllers;

use App\Mail\JobApprovedMail;
use App\Models\Application;
use App\Models\Banner;
use App\Models\Category;
use App\Models\ContactUs;
use App\Models\Country;
use App\Models\Employer;
use App\Models\JobPosting;
use App\Models\Package;
use App\Models\ContactList;
use App\Models\EmailTemplate;
use App\Models\Subcategory;
use App\Models\User;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\Log;


class JobPostingController extends Controller
{
    public function index()
    {
        $today = Carbon::today();

        // 1. Approved and active jobs that have NOT expired
        $jobPostings = JobPosting::with(['category', 'subcategory', 'employer', 'package.duration'])
            ->where('status', 'approved')
            ->where('is_active', true)
            ->whereDate('closing_date', '>=', $today)
            ->get();

        // 2. Pending jobs (regardless of closing date)
        $pendingJobs = JobPosting::with(['category', 'subcategory', 'employer'])
            ->where('status', 'pending')
            ->where('is_active', true)
            ->get();

        // 3. Rejected jobs (regardless of closing date)
        $rejectedJobs = JobPosting::with(['category', 'subcategory', 'employer'])
            ->where('status', 'reject')
            ->where('is_active', true)
            ->get();

        // 4. Expired jobs = approved + active + closing_date < today
        $expireddJobs = JobPosting::with(['category', 'subcategory', 'employer'])
            ->where('status', 'approved')
            ->where('is_active', true)
            ->whereDate('closing_date', '<', $today)
            ->get();

        return view('Admin.jobview', compact('jobPostings', 'pendingJobs', 'rejectedJobs', 'expireddJobs'));
    }



    public function topEmployers()
    {
        $contacts = ContactUs::all();
        // Fetch top 28 employers based on job postings count and filter those with a logo
        $topEmployers = Employer::withCount('jobPostings') // Assuming 'jobPostings' is the relationship

            ->orderBy('job_postings_count', 'desc') // Sort by the number of job postings
            ->take(8) // Limit to top 28
            ->get();

        // Pass data to the view
        return view('User.topemployees', compact('topEmployers', 'contacts'));
    }
    public function showtopemployerJobs($employerId)
    {
        // Fetch the employer
        $employer = Employer::findOrFail($employerId);
        $contacts = ContactUs::all();

        // Fetch jobs posted by this employer
        $jobs = JobPosting::where('employer_id', $employer->id)
            ->where('status', 'approved') // Optional: only show approved jobs
            ->get();

        // Return a view with the employer and their jobs
        return view('User.topemployerjob', compact('employer', 'jobs', 'contacts'));
    }

    public function generateJobAdsReport(Request $request)
{
    $hasDateFilter = $request->filled('start_date') && $request->filled('end_date');

    if ($hasDateFilter) {
        $startDate = Carbon::parse($request->start_date)->startOfDay();
        $endDate = Carbon::parse($request->end_date)->endOfDay();
    } else {
        // No filter - default to last 30 days
        $startDate = Carbon::now()->subDays(30)->startOfDay();
        $endDate = Carbon::now()->endOfDay();
    }

    // Base query for daily counts and earnings
    $dailyCountQuery = DB::table('job_postings')
        ->leftJoin('packages', 'job_postings.package_id', '=', 'packages.id')
        ->where('job_postings.status', 'approved')
        ->whereBetween('job_postings.created_at', [$startDate, $endDate]);

    $dailyCount = $dailyCountQuery->select(
            DB::raw('DATE(job_postings.created_at) as date'),
            DB::raw('COUNT(*) as count'),
            DB::raw('SUM(COALESCE(packages.lkr_price, 0)) as earnings')
        )
        ->groupBy('date')
        ->orderBy('date', 'desc')
        ->get();

    // Base query for job details per date (include package price)
    $jobDetailsQuery = DB::table('job_postings')
        ->join('employers', 'job_postings.employer_id', '=', 'employers.id')
        ->leftJoin('admins', 'job_postings.admin_id', '=', 'admins.id')
        ->leftJoin('packages', 'job_postings.package_id', '=', 'packages.id')
        ->where('job_postings.status', 'approved')
        ->whereBetween('job_postings.created_at', [$startDate, $endDate]);

    $jobDetailsByDate = $jobDetailsQuery->select(
            DB::raw('DATE(job_postings.created_at) as date'),
            'job_postings.title',
            'employers.company_name',
            DB::raw('COALESCE(job_postings.view_count, 0) as views_count'),
            DB::raw('COALESCE(admins.name, "N/A") as approved_by'),
            DB::raw('COALESCE(packages.lkr_price, 0) as lkr_price')
        )
        ->orderBy('job_postings.created_at', 'desc')
        ->get()
        ->groupBy('date');

    // Attach jobs to each daily summary record
    $dailyCount = $dailyCount->map(function ($item) use ($jobDetailsByDate) {
        $item->jobs = $jobDetailsByDate->get($item->date) ?? collect();
        return $item;
    });

    $today = Carbon::today();
    $includeToday = $startDate <= $today && $endDate >= $today;
    if ($includeToday) {
        $dailyTotalData = DB::table('job_postings')
            ->leftJoin('packages', 'job_postings.package_id', '=', 'packages.id')
            ->where('job_postings.status', 'approved')
            ->whereDate('job_postings.created_at', $today)
            ->select(
                DB::raw('COUNT(*) as count'),
                DB::raw('SUM(COALESCE(packages.lkr_price, 0)) as earnings')
            )
            ->first();
    } else {
        $dailyTotalData = (object) ['count' => 0, 'earnings' => 0];
    }

    $startOfWeek = Carbon::now()->startOfWeek();
    $now = Carbon::now();
    $includeWeek = $startDate <= $now && $endDate >= $startOfWeek;

    if ($includeWeek) {
        $weeklyTotalData = DB::table('job_postings')
            ->leftJoin('packages', 'job_postings.package_id', '=', 'packages.id')
            ->where('job_postings.status', 'approved')
            ->whereBetween('job_postings.created_at', [$startOfWeek, $now])
            ->select(
                DB::raw('COUNT(*) as count'),
                DB::raw('SUM(COALESCE(packages.lkr_price, 0)) as earnings')
            )
            ->first();

        // Prepare variables for filtered date range if requested
        $totalJobs = 0;
        $totalEarnings = 0;
        $jobsInRange = collect();

        if ($request->filled('start_date') && $request->filled('end_date')) {
            $startDate = Carbon::parse($request->start_date)->startOfDay();
            $endDate = Carbon::parse($request->end_date)->endOfDay();

            // Total jobs and earnings in range
            $totals = DB::table('job_postings')
                ->leftJoin('packages', 'job_postings.package_id', '=', 'packages.id')
                ->where('job_postings.status', 'approved')
                ->whereBetween('job_postings.created_at', [$startDate, $endDate])
                ->select(
                    DB::raw('COUNT(*) as count'),
                    DB::raw('SUM(COALESCE(packages.lkr_price, 0)) as earnings')
                )
                ->first();

            $totalJobs = $totals->count ?? 0;
            $totalEarnings = $totals->earnings ?? 0;

            // Get jobs details in range with views count
            $jobsInRange = DB::table('job_postings')
                ->join('employers', 'job_postings.employer_id', '=', 'employers.id')
                ->leftJoin('admins', 'job_postings.admin_id', '=', 'admins.id')
                ->leftJoin('packages', 'job_postings.package_id', '=', 'packages.id')
                ->where('job_postings.status', 'approved')
                ->whereBetween('job_postings.created_at', [$startDate, $endDate])
                ->select(
                    'job_postings.created_at',
                    'job_postings.title',
                    'employers.company_name',
                    DB::raw('COALESCE(job_postings.views, 0) as views_count'),
                    DB::raw('COALESCE(packages.lkr_price, 0) as lkr_price'),
                    'job_postings.payment_method',
                    DB::raw('COALESCE(admins.name, "N/A") as approved_by')
                )
                ->orderBy('job_postings.created_at', 'desc')
                ->get();
        } else {
            $weeklyTotalData = (object) ['count' => 0, 'earnings' => 0];
        }

        $totalJobs = $dailyCount->sum('count');
        $totalEarnings = $dailyCount->sum('earnings');

        return view('Admin.report.jobads', [
            'dailyCount' => $dailyCount,
            'dailyTotal' => $dailyTotalData->count ?? 0,
            'weeklyTotal' => $weeklyTotalData->count ?? 0,
            'totalJobs' => $totalJobs,
            'totalEarnings' => $totalEarnings,
            'startDate' => $startDate,
            'endDate' => $endDate,
        ]);
    }

}



    public function home(Request $request)
    {
        $today = Carbon::today();

        // Handle category selection and session management
        $categoryId = $request->input('category_id');
        if ($categoryId && $categoryId !== 'all') {
            session(['selected_category_id' => $categoryId]);
        } elseif ($categoryId === 'all') {
            session()->forget('selected_category_id');
            $categoryId = null; // Reset category ID to null for "All"
        } else {
            $categoryId = session('selected_category_id');
        }

        // Check if no filters are applied, and reset the session
        if (
            !$request->has('search') &&
            !$request->has('location') &&
            !$request->has('country') &&
            (!$request->has('category_id') || $request->input('category_id') === '')
        ) {
            session()->forget('selected_category_id');
        }

        // Input filters
        $search = $request->input('search');
        $location = $request->input('location');
        $countryId = $request->input('country');

        // Total count of jobs matching filters
        $totalCount = JobPosting::where('status', 'approved')
            ->where('is_active', true)
            ->whereDate('closing_date', '>=', $today) // Add this line
            ->when($search, function ($query, $search) {
                $query->where(function ($query) use ($search) {
                    $query->where('title', 'like', "%{$search}%")
                        ->orWhere('description', 'like', "%{$search}%")
                        ->orWhereHas('employer', function ($q) use ($search) {
                            $q->where('company_name', 'like', "%{$search}%");
                        });
                });
            })
            ->when($location, fn($query, $location) => $query->where('location', 'like', "%{$location}%"))
            ->when($countryId, fn($query, $countryId) => $query->where('country_id', $countryId))
            ->when($categoryId && $categoryId != 45, fn($query) => $query->where('category_id', $categoryId))
            ->count();


        // Paginated job listings with filters
        $jobs = JobPosting::with(['category', 'subcategory', 'country', 'package.duration', 'employer'])
            ->where('status', 'approved')
            ->where('is_active', true)
            ->whereDate('closing_date', '>=', $today) // Add this line
            ->when($search, function ($query, $search) {
                $query->where(function ($query) use ($search) {
                    $query->where('title', 'like', "%{$search}%")
                        ->orWhere('description', 'like', "%{$search}%")
                        ->orWhereHas('employer', function ($q) use ($search) {
                            $q->where('company_name', 'like', "%{$search}%");
                        });
                });
            })
            ->when($location, fn($query, $location) => $query->where('location', 'like', "%{$location}%"))
            ->when($countryId, fn($query, $countryId) => $query->where('country_id', $countryId))
            ->when($categoryId && $categoryId != 45, fn($query) => $query->where('category_id', $categoryId))
            ->orderBy('approved_date', 'desc')
            ->paginate($categoryId && $categoryId != 45 ? 50 : 250);



        // Additional data for the view
        $categories = Category::with('subcategories')->orderBy('name', 'asc')->get();
        $contacts = ContactUs::all();
        $countries = Country::all();

        $banners = Banner::join('banner_packages', 'banners.package_id', '=', 'banner_packages.id')
            ->join('duration', 'banner_packages.duration_id', '=', 'duration.id')
            ->where('banners.status', 'published')
            ->where('banners.placement', 'banner')
            ->where(function ($query) use ($today) {
                $query->where('duration.duration', 0)
                    ->orWhereRaw('DATE_ADD(banners.updated_at, INTERVAL duration.duration DAY) >= ?', [$today]);
            })
            ->select('banners.*', 'duration.duration')
            ->get();
        return view('home.home', compact('categories', 'totalCount', 'jobs', 'contacts', 'countries', 'banners'))
            ->with('selected_category_id', session('selected_category_id'));
    }



    public function toggleActiveStatus($id)
    {
        // Find the job posting by ID and ensure it belongs to the authenticated employer
        $job = JobPosting::where('id', $id)
            ->where('employer_id', auth('employer')->id()) // Ensure the job belongs to the current employer
            ->firstOrFail();

        // Toggle the is_active status
        $job->is_active = !$job->is_active;
        $job->save();

        $status = $job->is_active ? 'active' : 'inactive';

        return redirect()->back()->with('success', "Job posting has been marked as $status.");
    }

    public function show($id)

    {
        $job = JobPosting::with(['category', 'employer', 'package.duration'])->findOrFail($id);
        $categories = Category::all();
        $sub_categories = Subcategory::all();
        $emailTemplates = EmailTemplate::all();
        $packages = Package::with('duration')->get();

        return view('Admin.showonejob', compact('job', 'categories', 'packages', 'sub_categories', 'emailTemplates'));
    }




    public function showjob($id)
    {
        $contacts = ContactUs::all();

        // Retrieve job posting with relations
        $job = JobPosting::with(['category', 'employer'])->findOrFail($id);

        // Increment view_count and update_count only once, in a single query
        $jobPosting = JobPosting::findOrFail($job->id);

        // Increment view_count and update_count
        $jobPosting->view_count += 1;
        $jobPosting->update_count += 1;
        $jobPosting->updated_at = now();
        $jobPosting->save();


        // Save the changes

        $now = Carbon::now();

        $banners = Banner::join('banner_packages', 'banners.package_id', '=', 'banner_packages.id')
            ->join('duration', 'banner_packages.duration_id', '=', 'duration.id')
            ->where('banners.status', 'published')
            ->where('banners.placement', 'category_page')
            ->where(function ($query) use ($now) {
                $query->where('duration.duration', 0)
                    ->orWhereRaw('DATE_ADD(banners.updated_at, INTERVAL duration.duration DAY) >= ?', [$now]);
            })
            ->select('banners.*', 'duration.duration')
            ->get();

        return view('home.jobs.show', compact('job', 'contacts', 'banners'));
    }




    public function updateStatus(Request $request, $id)
    {
        $request->validate([
            'status' => 'required|in:pending,approved,reject',
            'rejection_reason' => 'nullable|string|max:255',
            'email_template_id' => 'nullable|exists:email_templates,id',
        ]);

        $job = JobPosting::findOrFail($id);
        $previousStatus = $job->status;
        $job->status = $request->input('status');

        if ($job->status === 'approved') {
            $job->approved_date = now();
            $job->rejection_reason = null;
        } elseif ($job->status === 'reject') {
            $job->rejected_date = now();
            $job->rejection_reason = $request->input('rejection_reason');
        }

        $job->admin_id = auth('admin')->id();
        $job->save();

        // Send email if status changed to approved
        if ($previousStatus !== 'approved' && $job->status === 'approved') {
            $templateId = $request->input('email_template_id');
            if ($templateId) {
                $template = EmailTemplate::find($templateId);
                if ($template) {
                    Mail::to($job->employer->email)->send(new JobApprovedMail($job, $template));
                }
            }
        }

        return redirect()->route('job_postings.index')->with('success', 'Job status updated successfully.');
    }


    public function getJobsByCategory($categoryId)
    {
        $today = Carbon::today();
        // Fetch jobs belonging to the specified category
        $jobs = JobPosting::where('category_id', $categoryId)
            ->where('status', 'approved')
            ->where('is_active', true)
            ->whereDate('closing_date', '>=', now())
            ->whereHas('package.duration', function ($query) use ($today) {
                $query->whereRaw("DATE_ADD(job_postings.approved_date, INTERVAL duration.duration DAY) >= ?", [$today]);
            })
            ->with(['employer', 'package.duration'])
            ->get();

        return response()->json($jobs);
    }

public function generateCustomerReport(Request $request)
    {
        $startDate = $request->input('start_date');
        $endDate = $request->input('end_date');

        // Default date range: last 1 month if not provided
        if (!$startDate) {
            $startDate = now()->subMonth()->format('Y-m-d');
        }
        if (!$endDate) {
            $endDate = now()->format('Y-m-d');
        }

        // Daily statistics counts within date range
        $dailyApplications = Application::whereBetween('created_at', [$startDate . ' 00:00:00', $endDate . ' 23:59:59'])->count();
        $dailyUsers = User::whereBetween('created_at', [$startDate . ' 00:00:00', $endDate . ' 23:59:59'])->count();

        // Daily Applications Data
        $dailyApplicationsData = Application::with(['user', 'job'])
            ->select(DB::raw('DATE(created_at) as date'), DB::raw('COUNT(*) as count'))
            ->whereBetween('created_at', [$startDate . ' 00:00:00', $endDate . ' 23:59:59'])
            ->groupBy('date')
            ->orderBy('date', 'desc')
            ->limit(30)
            ->get()
            ->map(function ($day) {
                $applications = Application::with(['user', 'job'])
                    ->whereDate('created_at', $day->date)
                    ->select('name', 'email', 'job_posting_id', 'created_at')
                    ->limit(5)
                    ->get()
                    ->map(function ($app) {
                        return [
                            'user_name' => optional($app->user)->name ?? 'Unknown User',
                            'user_email' => optional($app->user)->email ?? 'Unknown Email',
                            'job_title' => optional($app->job)->title ?? 'Unknown Job',
                        ];
                    });

                return [
                    'date' => $day->date,
                    'count' => $day->count,
                    'applications' => $applications,
                ];
            });

        // Weekly Applications Data
        $weeklyApplicationsData = Application::select(
            DB::raw('YEARWEEK(created_at) as yearweek'),
            DB::raw('MIN(created_at) as start_date'),
            DB::raw('MAX(created_at) as end_date'),
            DB::raw('COUNT(*) as count')
        )
            ->groupBy('yearweek')
            ->orderBy('yearweek', 'desc')
            ->limit(12)
            ->get()
            ->map(function ($week) {
                $summary = Application::with(['user', 'job'])
                    ->whereBetween('created_at', [$week->start_date, $week->end_date])
                    ->limit(5)
                    ->get()
                    ->map(function ($app) {
                        $userName = optional($app->user)->name ?? 'Unknown User';
                        $userEmail = optional($app->user)->email ?? 'Unknown Email';
                        $jobTitle = optional($app->job)->title ?? 'Unknown Job';

                        return "$userName ($userEmail) applied for $jobTitle";
                    });

                return [
                    'week' => Carbon::parse($week->start_date)->format('W'),
                    'start_date' => Carbon::parse($week->start_date)->format('Y-m-d'),
                    'end_date' => Carbon::parse($week->end_date)->format('Y-m-d'),
                    'count' => $week->count,
                    'summary' => $summary,
                ];
            });

        // Monthly Applications Data
        $monthlyApplicationsData = Application::select(
            DB::raw('DATE_FORMAT(created_at, "%Y-%m") as month'),
            DB::raw('COUNT(*) as count')
        )
            ->groupBy('month')
            ->orderBy('month', 'desc')
            ->limit(12)
            ->get()
            ->map(function ($month) {
                $summary = Application::with(['user', 'job'])
                    ->whereRaw('DATE_FORMAT(created_at, "%Y-%m") = ?', [$month->month])
                    ->limit(5)
                    ->get()
                    ->map(function ($app) {
                        $userName = optional($app->user)->name ?? 'Unknown User';
                        $userEmail = optional($app->user)->email ?? 'Unknown Email';
                        $jobTitle = optional($app->job)->title ?? 'Unknown Job';

                        return "$userName ($userEmail) - $jobTitle";
                    });

                return [
                    'month' => Carbon::parse($month->month . '-01')->format('F Y'),
                    'count' => $month->count,
                    'summary' => $summary,
                ];
            });

        // Daily Users Data (New Registrations)
        $dailyUsersData = User::select(DB::raw('DATE(created_at) as date'), DB::raw('COUNT(*) as count'))
            ->groupBy('date')
            ->orderBy('date', 'desc')
            ->limit(30)
            ->get()
            ->map(function ($day) {
                $users = User::whereDate('created_at', $day->date)
                    ->select('name', 'email', 'created_at')
                    ->limit(5)
                    ->get();

                return [
                    'date' => $day->date,
                    'count' => $day->count,
                    'users' => $users,
                ];
            });

        // Weekly Users Data
        $weeklyUsersData = User::select(
            DB::raw('YEARWEEK(created_at) as yearweek'),
            DB::raw('MIN(created_at) as start_date'),
            DB::raw('MAX(created_at) as end_date'),
            DB::raw('COUNT(*) as count')
        )
            ->groupBy('yearweek')
            ->orderBy('yearweek', 'desc')
            ->limit(12)
            ->get()
            ->map(function ($week) {
                $users = User::whereBetween('created_at', [$week->start_date, $week->end_date])
                    ->select('name', 'email', 'created_at')
                    ->limit(5)
                    ->get();

                return [
                    'week' => Carbon::parse($week->start_date)->format('W'),
                    'start_date' => Carbon::parse($week->start_date)->format('Y-m-d'),
                    'end_date' => Carbon::parse($week->end_date)->format('Y-m-d'),
                    'count' => $week->count,
                    'users' => $users,
                ];
            });

        // Monthly Users Data
        $monthlyUsersData = User::select(
            DB::raw('DATE_FORMAT(created_at, "%Y-%m") as month'),
            DB::raw('COUNT(*) as count')
        )
            ->groupBy('month')
            ->orderBy('month', 'desc')
            ->limit(12)
            ->get()
            ->map(function ($month) {
                $summary = User::whereRaw('DATE_FORMAT(created_at, "%Y-%m") = ?', [$month->month])
                    ->select('name', 'email', 'created_at')
                    ->limit(5)
                    ->get()
                    ->map(function ($user) {
                        return "{$user->name} ({$user->email})";
                    });

                return [
                    'month' => Carbon::parse($month->month . '-01')->format('F Y'),
                    'count' => $month->count,
                    'summary' => $summary,
                ];
            });
        // You can similarly filter weeklyApplicationsData, monthlyApplicationsData, dailyUsersData, etc.
        // For brevity, here we just pass empty arrays for them.
        $weeklyApplicationsData = [];
        $monthlyApplicationsData = [];
        $dailyUsersData = [];
        $weeklyUsersData = [];
        $monthlyUsersData = [];

        return view('Admin.report.application', compact(
            'dailyApplications',
            'dailyUsers',
            'dailyApplicationsData',
            'weeklyApplicationsData',
            'monthlyApplicationsData',
            'dailyUsersData',
            'weeklyUsersData',
            'monthlyUsersData',
            'startDate',
            'endDate'
        ));
    }


public function create()
    {
        $categories = Category::all();
        $subcategories = Subcategory::all();
        $employerId = auth('employer')->user()->id;
        $packages = Package::where('package_type', 'Standard')->get();
        $jobPostings = [
        [
            'title' => '',
            'description' => '',
            'category_ids' => [],
            'subcategory_ids' => [],
            'location' => '',
            'country_id' => '',
            'salary_range' => '',
            'requirements' => '',
            'closing_date' => '',
            'status' => 'pending',
            'custom_price' => '',
            'image' => null,
        ]
    ];
        $countries = Country::all(); // Add this line

        return view('employer.jobcreate', compact('jobPostings', 'categories', 'subcategories', 'employerId', 'packages', 'countries'));
    }
    public function employerJobs()
    {
        $employerId = auth('employer')->id();

        $jobPostings = JobPosting::where('employer_id', $employerId)
            ->with(['category', 'subcategory', 'admin'])
            ->paginate(100);

        return view('employer.jobview', compact('jobPostings'));
    }

    public function store(Request $request)
{
    try {
        $request->validate([
            'package_id' => 'required|exists:packages,id',
            'payment_method' => 'required|in:contact_contributor,online',
        ]);

        $employerId = auth('employer')->id();
        $packageId = $request->input('package_id');
        $jobPostings = $request->input('job_postings', []);
        $paymentMethod = $request->input('payment_method');

        if (!is_array($jobPostings) || empty($jobPostings)) {
            return redirect()->back()->withErrors(['job_postings' => 'No job postings provided.'])->withInput();
        }

        $package = \App\Models\Package::findOrFail($packageId);

        DB::beginTransaction();

        foreach ($jobPostings as $index => $jobData) {
            $request->validate([
                "job_postings.{$index}.title" => 'required|string|max:255',
                "job_postings.{$index}.description" => 'nullable|string',
                "job_postings.{$index}.category_ids" => 'required|array|min:1',
                "job_postings.{$index}.category_ids.*" => 'exists:categories,id',
                "job_postings.{$index}.subcategory_ids" => 'required|array|min:1',
                "job_postings.{$index}.subcategory_ids.*" => 'exists:subcategories,id',
                "job_postings.{$index}.location" => 'required|string|max:255',
                "job_postings.{$index}.country_id" => 'required|exists:countries,id',
                "job_postings.{$index}.salary_range" => 'nullable|string',
                "job_postings.{$index}.requirements" => 'nullable|string',
                "job_postings.{$index}.closing_date" => 'required|date',
                "job_postings.{$index}.status" => 'required|in:pending,reject,approved',
                "job_postings.{$index}.image" => 'nullable|file|mimes:jpeg,png,jpg,gif|max:4048',
                "job_postings.{$index}.custom_price" => 'nullable|numeric|min:0',
            ]);

            $categoryIds = $jobData['category_ids'];
            $subcategoryIds = $jobData['subcategory_ids'];

            foreach ($categoryIds as $catId) {
                foreach ($subcategoryIds as $subId) {
                    // Generate unique job_id
                    $latestJob = JobPosting::where('job_id', 'like', 'J%')
                        ->lockForUpdate()
                        ->orderByRaw('CAST(SUBSTRING(job_id, 2) AS UNSIGNED) DESC')
                        ->first();

                    $jobId = $latestJob
                        ? 'J' . str_pad((int) substr($latestJob->job_id, 1) + 1, 6, '0', STR_PAD_LEFT)
                        : 'J000001';

                    // Use custom price if set, otherwise default
                    $finalPrice = isset($jobData['custom_price']) && $jobData['custom_price'] !== ''
                        ? floatval($jobData['custom_price'])
                        : $package->lkr_price;

                    $jobPostingData = [
                        'job_id' => $jobId,
                        'employer_id' => $employerId,
                        'package_id' => $packageId,
                        'package_price' => $finalPrice,
                        'title' => $jobData['title'],
                        'description' => $jobData['description'] ?? 'No Description',
                        'category_id' => $catId,
                        'subcategory_id' => $subId,
                        'location' => $jobData['location'],
                        'country_id' => $jobData['country_id'],
                        'salary_range' => $jobData['salary_range'] ?? null,
                        'requirements' => $jobData['requirements'],
                        'closing_date' => $jobData['closing_date'],
                        'status' => $jobData['status'],
                        'payment_method' => $paymentMethod,
                    ];

                    $posting = JobPosting::create($jobPostingData);

                    if ($request->hasFile("job_postings.{$index}.image")) {
                        $imagePath = $request->file("job_postings.{$index}.image")->store('job_images', 'public');
                        $posting->image = $imagePath;
                        $posting->save();
                    }
                }
            }
        }

        DB::commit();

        return $paymentMethod === 'contact_contributor'
            ? redirect()->route('employer.job_postings.post.create')->with('success', 'Job postings created successfully!')
            : response()->json(['success' => true]);

    } catch (\Exception $e) {
        DB::rollBack();
        if ($request->expectsJson()) {
            return response()->json(['success' => false, 'message' => $e->getMessage()], 500);
        }
        return redirect()->back()->withErrors(['error' => $e->getMessage()])->withInput();
    }
}


    public function storeForAdmin(Request $request)
    {
        $validatedData = $request->validate([
            'package_id' => 'required|exists:packages,id',
            'payment_method' => 'required|in:contact_contributor,online',
            'job_postings.*.title' => 'required|string|max:255',
            'job_postings.*.description' => 'nullable|string',
            'job_postings.*.category_ids' => 'required|array|min:1',
            'job_postings.*.category_ids.*' => 'exists:categories,id',
            'job_postings.*.subcategory_ids' => 'required|array|min:1',
            'job_postings.*.subcategory_ids.*' => 'exists:subcategories,id',
            'job_postings.*.location' => 'required|string|max:255',
            'job_postings.*.country_id' => 'required|exists:countries,id',
            'job_postings.*.salary_range' => 'nullable|string|max:255',
            'job_postings.*.image' => 'nullable|file|mimes:jpeg,png,jpg,gif|max:4048',
            'job_postings.*.requirements' => 'nullable|string',
            'job_postings.*.closing_date' => 'required|date',
            'job_postings.*.status' => 'required|in:pending,reject,approved',
            'job_postings.*.employer_id' => 'required|exists:employers,id',
        ]);

        $adminId = auth('admin')->id();
        $packageId = $request->input('package_id');
        $jobPostings = $request->input('job_postings', []);
        $paymentMethod = $request->input('payment_method');

        DB::beginTransaction();
        $package = \App\Models\Package::findOrFail($packageId); // Get current package details

        try {
            $storedPostings = [];
            foreach ($jobPostings as $index => $jobData) {
                $categoryIds = $jobData['category_ids'] ?? [];
                $subcategoryIds = $jobData['subcategory_ids'] ?? [];

                if (empty($categoryIds) || empty($subcategoryIds)) {
                    continue;
                }

                // Fetch subcategories with their category_id
                $subcategories = \App\Models\Subcategory::whereIn('id', $subcategoryIds)->get();

                foreach ($subcategories as $subcategory) {
                    if (!in_array($subcategory->category_id, $categoryIds)) {
                        continue; // Skip if subcategory doesn't belong to selected categories
                    }

                    // Generate new job ID
                    $latestJob = JobPosting::where('job_id', 'like', 'J%')
                        ->lockForUpdate()
                        ->orderByRaw('CAST(SUBSTRING(job_id, 2, 6) AS UNSIGNED) DESC')
                        ->first();

                    $latestId = $latestJob ? (int) substr($latestJob->job_id, 1) : 0;
                    $jobId = 'J' . str_pad($latestId + 1, 6, '0', STR_PAD_LEFT);

                    $jobPostingData = [
                        'job_id' => $jobId,
                        'creator_id' => $adminId,
                        'admin_id' => $adminId,
                        'package_id' => $packageId,
                        'employer_id' => $jobData['employer_id'],
                        'title' => $jobData['title'],
                        'description' => $jobData['description'] ?? 'No Description',
                        'category_id' => $subcategory->category_id,
                        'subcategory_id' => $subcategory->id,
                        'location' => $jobData['location'],
                        'country_id' => $jobData['country_id'],
                        'salary_range' => $jobData['salary_range'] ?? null,
                        'requirements' => $jobData['requirements'],
                        'closing_date' => $jobData['closing_date'],
                        'status' => $jobData['status'],
                        'payment_method' => $paymentMethod,
                        'is_active' => true,
                        'package_price' => $package->lkr_price,
                    ];

                    if ($request->hasFile("job_postings.$index.image")) {
                        $jobPostingData['image'] = $request->file("job_postings.$index.image")
                            ->store('job_images', 'public');
                    }

                    $storedPostings[] = JobPosting::create($jobPostingData);
                }
            }


            DB::commit();

            if ($paymentMethod === 'online') {
                session(['pending_job_postings' => collect($storedPostings)->pluck('id')]);
                return redirect()->route('admin.payment.checkout');
            }

            return redirect()->route('job_postings.index')
                ->with('success', 'Job postings created successfully!');
        } catch (\Exception $e) {
            DB::rollBack();
            return redirect()->back()
                ->withErrors(['error' => 'An error occurred while creating job postings: ' . $e->getMessage()])
                ->withInput();
        }
    }


    public function getSubcategories($categoryId)
    {
        $subcategories = Subcategory::where('category_id', $categoryId)->get();
        return response()->json($subcategories);
    }

    public function edit(JobPosting $jobPosting)
    {
        $categories = Category::all(); // Assuming you have a Category model
        $countries = Country::all();
        $packages = Package::all();
        $subcategories = Subcategory::where('category_id', $jobPosting->category_id)->get(); // Assuming you have a Subcategory model
        return view('employer.jobupdate', compact('packages', 'countries', 'jobPosting', 'categories', 'subcategories'));
    }


    public function createForAdmin()
    {
        $categories = Category::all(); // Fetch all categories
        $subcategories = Subcategory::all(); // Fetch all subcategories
        $employers = Employer::all(); // Fetch all employers
        $packages = Package::all(); // Fetch all packages
        $countries = Country::all();

        return view('Admin.jobcreate', compact('categories', 'subcategories', 'employers', 'packages', 'countries'));
    }

    public function updatepost(Request $request, $id)
    {
        $request->validate([
            'title' => 'required|string|max:255',
            'category_id' => 'required|exists:categories,id',
            'subcategory_id' => 'required|exists:subcategories,id',
            'description' => 'required|string',
            'location' => 'required|string|max:255',
            'salary_range' => 'nullable|string',
            'requirements' => 'nullable|string',
            'closing_date' => 'required|date',
            'package_id' => 'required|exists:packages,id',
        ]);

        $job = JobPosting::findOrFail($id);

        // Update basic fields
        $job->title = $request->title;
        $job->category_id = $request->category_id;
        $job->subcategory_id = $request->subcategory_id;
        $job->description = $request->description;
        $job->location = $request->location;
        $job->salary_range = $request->salary_range;
        $job->requirements = $request->requirements;
        $job->closing_date = $request->closing_date;

        // Check if package has changed
        if ($job->package_id != $request->package_id) {
            $package = \App\Models\Package::findOrFail($request->package_id);
            $job->package_id = $package->id;
            $job->package_price = $package->lkr_price; // Update to new price
        }

        $job->save();

        return redirect()->route('job_postings.show', $job->id)
            ->with('success', 'Job updated successfully.');
    }


    public function update(Request $request, JobPosting $jobPosting)
{
    try {
        // Validate inputs including package_id and optional custom_price
        $validated = $request->validate([
            'package_id' => 'required|exists:packages,id',
            'custom_price' => 'nullable|numeric|min:0',
            'title' => 'required|string|max:255',
            'description' => 'required',
            'category_id' => 'required|exists:categories,id',
            'subcategory_id' => 'required|exists:subcategories,id',
            'location' => 'required|string|max:255',
            'country_id' => 'required|exists:countries,id',
            'salary_range' => 'nullable|string',
            'image' => 'nullable|image|max:2048',
            'requirements' => 'required',
            'closing_date' => 'required|date',
            'status' => 'nullable|in:pending,reject,approved',
        ]);

        // Get package to retrieve default price
        $package = \App\Models\Package::findOrFail($validated['package_id']);

        // Decide final price: use custom_price if present, otherwise package's price
        $finalPrice = isset($validated['custom_price']) && $validated['custom_price'] !== ''
            ? $validated['custom_price']
            : $package->lkr_price;

        // Handle image upload
        if ($request->hasFile('image')) {
            $validated['image'] = $request->file('image')->store('job_images', 'public');
        }

        // Update fields explicitly, including package_id and package_price
        $jobPosting->update([
            'package_id' => $validated['package_id'],
            'package_price' => $finalPrice,
            'title' => $validated['title'],
            'description' => $validated['description'],
            'category_id' => $validated['category_id'],
            'subcategory_id' => $validated['subcategory_id'],
            'location' => $validated['location'],
            'country_id' => $validated['country_id'],
            'salary_range' => $validated['salary_range'] ?? null,
            'image' => $validated['image'] ?? $jobPosting->image,
            'requirements' => $validated['requirements'],
            'closing_date' => $validated['closing_date'],
            'status' => $validated['status'] ?? $jobPosting->status,
        ]);

        return redirect()->route('employer.job_postings.employer.jobs')
            ->with('success', 'Job Posting updated successfully.');

    } catch (\Exception $e) {
        return back()->withInput()
            ->with('error', 'An error occurred while updating the job posting: ' . $e->getMessage());
    }
}

    public function generateJobAdsReportByDateRange(Request $request)
    {
        $startDate = $request->start_date;
        $endDate = $request->end_date;

        // Get jobs within date range
        $jobsInRange = DB::table('job_postings')
            ->join('employers', 'job_postings.employer_id', '=', 'employers.id')
            ->leftJoin('packages', 'job_postings.package_id', '=', 'packages.id')
            ->leftJoin('admins', 'job_postings.admin_id', '=', 'admins.id')
            ->whereBetween('job_postings.created_at', [$startDate, $endDate])
            ->where('job_postings.status', 'approved')
            ->select(
                'job_postings.*',
                'employers.company_name',
                'packages.lkr_price',
                'admins.name as admin_name'
            )
            ->get();

        // Calculate statistics
        $totalJobs = $jobsInRange->count();
        $totalEarnings = $jobsInRange->sum('lkr_price');

        // Payment method distribution
        $paymentDetails = $jobsInRange->groupBy('payment_method')
            ->map(function ($group) {
                return $group->count();
            });

        // Posted by distribution
        $postedBy = $jobsInRange->groupBy(function ($job) {
            return $job->creator_id ? 'Admin: ' . $job->admin_name : 'Employer: ' . $job->company_name;
        })->map(function ($group) {
            return $group->count();
        });

        // Repeated employers
        $repeatedEmployers = $jobsInRange->groupBy('employer_id')
            ->map(function ($group) {
                return [
                    'company_name' => $group->first()->company_name,
                    'post_count' => $group->count(),
                ];
            })
            ->filter(function ($employer) {
                return $employer['post_count'] > 1;
            });

        return view('Admin.report.jobads-daterange', compact(
            'jobsInRange',
            'totalJobs',
            'totalEarnings',
            'paymentDetails',
            'postedBy',
            'repeatedEmployers',
            'startDate',
            'endDate'
        ));
    }

    public function destroy(JobPosting $jobPosting)
    {
        $jobPosting->delete();
        return redirect()->route('employer.job_postings.employer.jobs')->with('success', 'Job Posting deleted successfully.');
    }
}
