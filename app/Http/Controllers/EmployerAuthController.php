<?php

namespace App\Http\Controllers;

use App\Models\Application;
use App\Models\Banner;
use App\Models\Employer;
use App\Models\JobPosting;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Validation\Rule;
use Carbon\Carbon;
use Illuminate\Support\Facades\DB;


class EmployerAuthController extends Controller
{
    public function list()
    {
        $employers = Employer::all(); // Fetch all employers
        return view('Admin.employerlist', compact('employers')); // Pass to view
    }
    public function listedit($id)
    {
        $employer = Employer::findOrFail($id); // Find employer by ID
        return view('Admin.employerlistedit', compact('employer')); // Pass to view
    }
    public function listupdate(Request $request, $id)
    {
        $employer = Employer::findOrFail($id);

        // Validate the incoming request
        $request->validate([
            'company_name' => 'required|string|max:255',
            'email' => 'required|email',
            'contact_details' => 'nullable|string|max:255',
            'business_info' => 'nullable|string|max:1000',
            'job_posting_settings' => 'nullable|string',
            'is_active' => 'required|boolean',
            'logo' => 'nullable|image|mimes:jpeg,png,jpg,gif,svg|max:2048',
        ]);

        // Handle file upload
        if ($request->hasFile('logo')) {
            $logoName = time() . '_' . $request->file('logo')->getClientOriginalName();
            $request->file('logo')->move(public_path('uploads/logos'), $logoName);
            $employer->logo = $logoName;
        }

        // Update other fields
        $employer->company_name = $request->company_name;
        $employer->email = $request->email;
        $employer->contact_details = $request->contact_details;
        $employer->business_info = $request->business_info;
        $employer->job_posting_settings = $request->job_posting_settings;
        $employer->is_active = $request->is_active;

        $employer->save();

        return redirect()->route('employer.list')->with('success', 'Employer updated successfully!');
    }
    public function listdelete($id)
    {
        $employer = Employer::findOrFail($id);
        $employer->delete();
        return redirect()->route('employer.list')->with('success', 'Employer deleted successfully!'); // Redirect with success message
    }

    // Show the login form
    public function showLoginForm()
    {
        return view('employer.login'); // Ensure you have a view at resources/views/employer/login.blade.php
    }

    // Handle login
    public function login(Request $request)
    {
        $request->validate([
            'email' => 'required|email',
            'password' => 'required|string|min:6',
        ]);

        $credentials = $request->only('email', 'password');

        if (Auth::guard('employer')->attempt($credentials)) {
            return redirect()->route('employer.dashboard');
        }

        return back()->withErrors(['email' => 'Invalid credentials']);
    }




    public function getFilteredJobPostings(Request $request)
    {
        $startDate = $request->start_date;
        $endDate = $request->end_date;

        // ✅ Case 1: Date range is selected — use job_views and filter out 0 views
        if ($startDate && $endDate) {
            $results = DB::table('job_postings')
                ->join('packages', 'job_postings.package_id', '=', 'packages.id')
                ->join('employers', 'job_postings.employer_id', '=', 'employers.id')
                ->join('job_views', 'job_postings.id', '=', 'job_views.job_posting_id')
                ->where('job_postings.status', 'approved')
                ->whereBetween('job_views.view_date', [
                    \Carbon\Carbon::parse($startDate)->toDateString(),
                    \Carbon\Carbon::parse($endDate)->toDateString()
                ])
                ->select(
                    'job_postings.id',
                    'job_postings.title',
                    'job_postings.approved_date',
                    'job_postings.created_at',
                    'employers.company_name',
                    'job_postings.update_count',
                    'packages.lkr_price',
                    'job_postings.package_price',
                    'job_views.view_date',
                    // ✅ daily views for that job on that date
                    DB::raw('SUM(job_views.view_count) as daily_view'),
                    //daily earnings
                    DB::raw("CASE WHEN DATE(job_postings.approved_date) = CURDATE()
              THEN job_postings.package_price ELSE 0 END as daily_earnings"),

                    // ✅ total views for that job in the range
                    DB::raw('(SELECT SUM(jv.view_count)
                  FROM job_views jv
                  WHERE jv.job_posting_id = job_postings.id
                  AND jv.view_date BETWEEN "' . \Carbon\Carbon::parse($startDate)->toDateString() . '"
                  AND "' . \Carbon\Carbon::parse($endDate)->toDateString() . '") as total_view')
                )
                ->groupBy(
                    'job_postings.id',
                    'job_postings.title',
                    'job_postings.approved_date',
                    'job_postings.created_at',
                    'employers.company_name',
                    'job_postings.update_count',
                    'packages.lkr_price',
                    'job_postings.package_price',
                    'job_views.view_date'
                )
                ->orderBy('job_postings.id')
                ->orderBy('job_views.view_date')
                ->get();

            $datesInRange = DB::table('job_views')
                ->when($startDate && $endDate, function ($q) use ($startDate, $endDate) {
                    return $q->whereBetween('view_date', [$startDate, $endDate]);
                })
                ->distinct()
                ->orderBy('view_date')
                ->pluck('view_date')
                ->map(fn($d) => \Carbon\Carbon::parse($d)->format('Y-m-d'))
                ->toArray();
        }

        // ✅ Case 2: No date range — show all approved job postings with job_postings.view_count
        else {
            $results = DB::table('job_postings')
                ->join('packages', 'job_postings.package_id', '=', 'packages.id')
                ->join('employers', 'job_postings.employer_id', '=', 'employers.id')
                ->where('job_postings.status', 'approved') // ✅ Filter by approved status
                ->select(
                    'job_postings.id',
                    'job_postings.title',
                    'job_postings.approved_date',
                    'job_postings.created_at',
                    'employers.company_name',
                    'job_postings.update_count',
                    'packages.lkr_price',
                    'job_postings.package_price',
                    DB::raw('NULL as view_date'),
        DB::raw('job_postings.view_count as daily_view'),
        DB::raw('0 as daily_earnings'),
        DB::raw('job_postings.view_count as total_view')
                )
                ->orderBy('job_postings.created_at', 'desc')
                ->get();

                $datesInRange = [];
        }

        // Totals
        $totalLkr = $results->sum('package_price');

        $dailyTotals = $results->groupBy(function ($item) {
            return \Carbon\Carbon::parse($item->created_at)->format('Y-m-d');
        })->map(fn($group) => $group->sum('package_price'));

        $dailyViews = DB::table('job_views')
            ->when($startDate && $endDate, function ($q) use ($startDate, $endDate) {
                return $q->whereBetween('view_date', [$startDate, $endDate]);
            })
            ->groupBy('view_date')
            ->select('view_date', DB::raw('SUM(view_count) as total'))
            ->pluck('total', 'view_date');

        // Stats
        $today = Carbon::today();
        $startOfWeek = $today->copy()->startOfWeek()->toDateString();
        $endOfWeek = $today->copy()->endOfWeek()->toDateString();

        $dailyEmployerCount = DB::table('job_postings')
            ->where('status', 'approved') // Only count approved
            ->select('employer_id')
            ->groupBy('employer_id')
            ->havingRaw('DATE(MIN(created_at)) = ?', [$today->toDateString()])
            ->count();

        $weeklyEmployerCount = DB::table('job_postings')
            ->where('status', 'approved') // Only count approved
            ->select('employer_id')
            ->groupBy('employer_id')
            ->havingRaw('DATE(MIN(created_at)) BETWEEN ? AND ?', [$startOfWeek, $endOfWeek])
            ->count();

        $todayViewCount = DB::table('job_views')
            ->where('view_date', $today->toDateString())
            ->sum('view_count');

        $todayUpdateCount = DB::table('job_postings')
            ->where('status', 'approved')
            ->sum('view_count');

        return view('Admin.report.employer', [
            'todayViewCount' => $todayViewCount,
            'todayUpdateCount' => $todayUpdateCount,
            'jobPostings' => $results,
            'totalEarningsLkr' => $totalLkr,
            'dailyTotals' => $dailyTotals,
            'dailyViews' => $dailyViews,
            'startDate' => $startDate,
            'endDate' => $endDate,
            'dailyEmployerCount' => $dailyEmployerCount,
            'weeklyEmployerCount' => $weeklyEmployerCount,
            'datesInRange' => $datesInRange ?? [],
        ]);
    }




    // Handle logout
    public function logout()
    {
        Auth::guard('employer')->logout();
        return redirect()->route('employer.login');
    }

    // Show the registration form
    public function showRegisterForm()
    {
        return view('employer.register'); // Ensure you have a view at resources/views/employer/register.blade.php
    }

    // Handle employer registration
    public function register(Request $request)
    {
        $request->validate([
            'company_name' => 'required|string|max:255',
            'email' => 'required|email|unique:employers,email',
            'password' => 'required|string|min:8|confirmed',
            'contact_details' => 'nullable|string|max:255',
            'business_info' => 'nullable|string',
        ]);

        Employer::create([
            'company_name' => $request->company_name,
            'email' => $request->email,
            'password' => Hash::make($request->password),
            'contact_details' => $request->contact_details,
            'business_info' => $request->business_info,
        ]);

        return redirect()->route('employer.login')->with('success', 'Employer registered successfully. You can now log in.');
    }
    public function extraregister(Request $request)
    {
        $request->validate([
            'company_name' => 'required|string|max:255',
            'email' => 'required|email|unique:employers,email',
            'password' => 'required|string|min:8|confirmed',
            'contact_details' => 'nullable|string|max:255',
            'business_info' => 'nullable|string',
        ]);

        Employer::create([
            'company_name' => $request->company_name,
            'email' => $request->email,
            'password' => Hash::make($request->password),
            'contact_details' => $request->contact_details,
            'business_info' => $request->business_info,
        ]);

        return redirect('/employer-register')->with('success', 'Employer registered successfully. You can now log in.');
    }
    // Dashboard

    public function dashboard()
    {
        $currentDate = now();

        // Fetch statistics for the current employer

        // Get the current employer's ID (assuming you have logged-in employer session data)
        $employerId = auth()->user()->id;

        // Fetch job and application statistics for the current employer
        $totalJobsPosted = JobPosting::where('employer_id', $employerId)->count();
        $totalApplications = Application::whereHas('job', function ($query) use ($employerId) {
            $query->where('employer_id', $employerId);
        })->count();
        $totalBannerPosted = Banner::where('employer_id', $employerId)->count();
        // Get recent applications for the employer (within the last 7 days)
        $recentApplications = Application::where('employer_id', $employerId)
            ->whereDate('created_at', '>=', $currentDate->copy()->subDays(7))
            ->latest()
            ->take(5)
            ->get();

        // Pass these statistics to the view
        return view('employer.dashboard', compact('totalBannerPosted', 'totalJobsPosted', 'totalApplications', 'recentApplications'));
    }

    // Show Employer Profile Form
    public function showProfileForm()
    {
        $employer = Auth::guard('employer')->user();
        return view('employer.profile', compact('employer')); // Ensure you have a view at resources/views/employer/profile.blade.php
    }
    public function search(Request $request)
    {
        $query = $request->input('query');
        $employers = Employer::where('company_name', 'LIKE', "%{$query}%")->get(['id', 'company_name']);
        return response()->json($employers);
    }

    // Handle Employer Profile Update
    public function updateProfile(Request $request)
    {
        $employer = Auth::guard('employer')->user();

        // Validate the incoming request
        $request->validate([
            'company_name' => 'required|string|max:255',
            'email' => [
                'required',
                'email',
                Rule::unique('employers', 'email')->ignore($employer->id),
            ],
            'contact_details' => 'nullable|string|max:255',
            'business_info' => 'nullable|string|max:1000',
            'current_password' => 'nullable|required_with:new_password',
            'new_password' => 'nullable|min:8|confirmed',
        ]);

        // Update company name, email, contact details, and business info
        $employer->company_name = $request->company_name;
        $employer->email = $request->email;
        $employer->contact_details = $request->contact_details;
        $employer->business_info = $request->business_info;

        // Handle password change if new password is provided
        if ($request->filled('new_password')) {
            // Verify current password
            if (!Hash::check($request->current_password, $employer->password)) {
                return back()->withErrors(['current_password' => 'Current password is incorrect']);
            }

            // Update to new password
            $employer->password = Hash::make($request->new_password);
        }

        // Save the updates
        $employer->save();

        // Redirect back with a success message
        return redirect()->route('employer.profile')
            ->with('success', 'Profile updated successfully.');
    }
    public function updateLogo(Request $request)
    {
        $employer = Auth::guard('employer')->user();

        // Validate the logo
        $request->validate([
            'logo' => 'nullable|image|mimes:jpeg,png,jpg,gif|max:2048', // Accept only images with a max size of 2MB
        ]);

        if ($request->hasFile('logo')) {
            // Delete the old logo if it exists
            if ($employer->logo) {
                \Storage::delete('public/' . $employer->logo);
            }

            // Store the new logo
            $logoPath = $request->file('logo')->store('logos', 'public'); // Save in 'public/logos'
            $employer->logo = $logoPath;
        }

        // Save the employer with the updated logo
        $employer->save();

        return redirect()->route('employer.profile')->with('success', 'Logo updated successfully.');
    }

    public function toggleStatus($id)
    {
        $employer = Employer::findOrFail($id);
        $employer->is_active = !$employer->is_active; // Toggle status
        $employer->save();

        return redirect()->route('employer.list')->with('success', 'Employer status updated successfully!');
    }
}
