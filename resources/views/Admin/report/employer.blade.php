@extends('layouts.admin.master')

@section('title', 'Employer Registration Report')

@section('css')
    <link rel="stylesheet" type="text/css" href="{{ asset('assets/css/vendors/datatables.css') }}">
    <link rel="stylesheet" type="text/css" href="{{ asset('assets/css/vendors/datatable-extension.css') }}">
    <style>
        /* Optional: style for buttons container */
        .export-buttons {
            margin-bottom: 15px;
        }

        .export-buttons button {
            margin-right: 8px;
        }
    </style>
@endsection

@section('breadcrumb-title')
    <h3>Employer Registration Report</h3>
@endsection

@section('content')
    <div class="container mt-5">
        <div class="row mb-4">
            <!-- Daily Employers -->
            <div class="col-xl-3 col-md-6 mb-4">
                <div class="card border-left-primary shadow h-100 py-2">
                    <div class="card-body">
                        <div class="row no-gutters align-items-center">
                            <div class="col mr-2">
                                <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">Today's Employers
                                </div>
                                <div class="h5 mb-0 font-weight-bold text-gray-800">{{ $dailyEmployerCount }}</div>
                            </div>
                            <div class="col-auto">
                                <i class="fas fa-building fa-2x text-gray-300"></i>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Weekly Employers -->
            <div class="col-xl-3 col-md-6 mb-4">
                <div class="card border-left-success shadow h-100 py-2">
                    <div class="card-body">
                        <div class="row no-gutters align-items-center">
                            <div class="col mr-2">
                                <div class="text-xs font-weight-bold text-success text-uppercase mb-1">This Week's Employers
                                </div>
                                <div class="h5 mb-0 font-weight-bold text-gray-800">{{ $weeklyEmployerCount }}</div>
                            </div>
                            <div class="col-auto">
                                <i class="fas fa-calendar-week fa-2x text-gray-300"></i>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Weekly Employers -->
            <div class="col-xl-3 col-md-6 mb-4">
                <div class="card border-left-success shadow h-100 py-2">
                    <div class="card-body">
                        <div class="row no-gutters align-items-center">
                            <div class="col mr-2">
                                <div class="text-xs font-weight-bold text-success text-uppercase mb-1">Total Views</div>
                                <div class="h5 mb-0 font-weight-bold text-gray-800">{{ $todayUpdateCount }}</div>
                            </div>
                            <div class="col-auto">
                                <i class="fas fa-calendar-week fa-2x text-gray-300"></i>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Weekly Employers -->
            <div class="col-xl-3 col-md-6 mb-4">
                <div class="card border-left-success shadow h-100 py-2">
                    <div class="card-body">
                        <div class="row no-gutters align-items-center">
                            <div class="col mr-2">
                                <div class="text-xs font-weight-bold text-success text-uppercase mb-1">Today Views</div>
                                <div class="h5 mb-0 font-weight-bold text-gray-800">{{ $todayViewCount }}</div>
                            </div>
                            <div class="col-auto">
                                <i class="fas fa-calendar-week fa-2x text-gray-300"></i>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <form method="GET" action="{{ url()->current() }}" class="mb-4 row g-3 align-items-center">
            <div class="col-auto">
                <label for="start_date" class="col-form-label">Start Date:</label>
            </div>
            <div class="col-auto">
                <input type="date" name="start_date" id="start_date" value="{{ old('start_date', $startDate ?? '') }}"
                    class="form-control" />
            </div>

            <div class="col-auto">
                <label for="end_date" class="col-form-label">End Date:</label>
            </div>
            <div class="col-auto">
                <input type="date" name="end_date" id="end_date" value="{{ old('end_date', $endDate ?? '') }}"
                    class="form-control" />
            </div>

            <div class="col-auto">
                <button type="submit" class="btn btn-primary">Filter</button>
            </div>
        </form>

        <!-- Export Buttons -->
        <div class="export-buttons pb-5">
            <button id="btnPrint" class="btn btn-secondary">Print</button>
            <button id="btnExportExcel" class="btn btn-success">Excel</button>
            <button id="btnExportPdf" class="btn btn-danger">PDF</button>
        </div>

        <table id="job-postings-table" class="table table-bordered" style="width:100%">
    <thead>
        <tr>
            <th class="text-center">No.</th>
            <th class="text-center">Post Date</th>
            <th class="text-center">Approved Date</th>
            <th class="text-center">Company</th>
            <th class="text-center">Job Post</th>
            <th class="text-center">Total Views</th>
            <th class="text-center">Today's Views</th>
            <th class="text-center">Paid Amount (LKR)</th>
            <th class="text-center">Daily Total Earnings (LKR)</th>
        </tr>
    </thead>

    <tbody>
        @php
            $totalViews = 0;
            $totalTodaysViews = 0;
            $totalPaidAmount = 0;
            $totalDailyEarnings = 0;
            $serialNumber = 1;
        @endphp

        {{-- ✅ Case 1: Date range selected --}}
        @if ($startDate && $endDate)
            @foreach ($jobPostings->groupBy('id') as $jobId => $jobGroup)
                @php
                    $job = $jobGroup->first();
                    $jobTotalViews = $jobGroup->sum('daily_view');
                    $jobTotalEarnings = $jobGroup->sum('daily_earnings');

                    $totalViews += $jobTotalViews;
                    $totalTodaysViews += $jobGroup->sum('daily_view');
                    $totalPaidAmount += $job->package_price;
                    $totalDailyEarnings += $jobTotalEarnings;
                @endphp

                @foreach ($jobGroup as $index => $row)
                    <tr>
                        @if ($index == 0)
                            <td rowspan="{{ $jobGroup->count() }}">{{ $serialNumber++ }}</td>
                            <td rowspan="{{ $jobGroup->count() }}">{{ \Carbon\Carbon::parse($job->created_at)->format('Y-m-d') }}</td>
                            <td rowspan="{{ $jobGroup->count() }}">{{ $job->approved_date ? \Carbon\Carbon::parse($job->approved_date)->format('Y-m-d') : 'Not Approved' }}</td>
                            <td rowspan="{{ $jobGroup->count() }}">{{ $job->company_name }}</td>
                            <td rowspan="{{ $jobGroup->count() }}">{{ $job->title }}</td>
                            <td rowspan="{{ $jobGroup->count() }}">{{ $jobTotalViews }}</td>
                        @endif

                        {{-- Daily views --}}
                        <td>{{ $row->view_date }} - ({{ $row->daily_view }})</td>

                        @if ($index == 0)
                            <td rowspan="{{ $jobGroup->count() }}">{{ number_format($job->package_price, 2) }}</td>
                            <td rowspan="{{ $jobGroup->count() }}">{{ number_format($jobTotalEarnings, 2) }}</td>
                        @endif
                    </tr>
                @endforeach
            @endforeach

            {{-- Totals Row --}}
            <tr>
                <td colspan="5" class="text-right"><strong>Totals:</strong></td>
                <td><strong>{{ $totalViews }}</strong></td>
                <td><strong>{{ $totalTodaysViews }}</strong></td>
                <td><strong>{{ number_format($totalPaidAmount, 2) }}</strong></td>
                <td><strong>{{ number_format($totalDailyEarnings, 2) }}</strong></td>
            </tr>

        {{-- ✅ Case 2: No date range --}}
        @else
            @php
                $jobsByDate = [];
                foreach ($jobPostings as $job) {
                    $date = \Carbon\Carbon::parse($job->created_at)->format('Y-m-d');
                    $jobsByDate[$date][] = $job;
                }
            @endphp

            @forelse ($jobsByDate as $date => $jobs)
                @php $firstJob = true; @endphp
                @foreach ($jobs as $job)
                    @php
                        $totalViews += $job->view_count;
                        $totalTodaysViews += $job->update_count;
                    @endphp
                    <tr>
                        <td>{{ $serialNumber++ }}</td>
                        <td>{{ $date }}</td>
                        <td>{{ $job->approved_date ? \Carbon\Carbon::parse($job->approved_date)->format('Y-m-d') : 'Not Approved' }}</td>
                        <td>{{ $job->company_name ?? 'N/A' }}</td>
                        <td>{{ $job->title }}</td>
                        <td>{{ $job->view_count }}</td>
                        <td>{{ $job->update_count }}</td>
                        <td class="text-right">{{ number_format($job->package_price, 2) }}</td>

                        @if ($firstJob)
                            <td class="text-right" rowspan="{{ count($jobs) }}">
                                {{ number_format($dailyTotals->get($date, 0), 2) }}
                            </td>
                            @php $firstJob = false; @endphp
                        @endif
                    </tr>
                @endforeach
            @empty
                <tr>
                    <td colspan="9" class="text-center">No job postings available.</td>
                </tr>
            @endforelse

            {{-- Totals row --}}
            <tr>
                <td colspan="5" class="text-right"><strong>Totals:</strong></td>
                <td><strong>{{ $totalViews }}</strong></td>
                <td><strong>{{ $totalTodaysViews }}</strong></td>
                <td></td>
                <td><strong>{{ number_format($dailyTotals->sum(), 2) }}</strong></td>
            </tr>
        @endif
    </tbody>
</table>


    </div>
@endsection

@section('script')
    {{-- Load dependencies from CDN for Excel and PDF exports --}}
    <script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.18.5/xlsx.full.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.5.1/jspdf.umd.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf-autotable/3.5.28/jspdf.plugin.autotable.min.js"></script>

    <script>
        // Print function
        document.getElementById('btnPrint').addEventListener('click', function() {
            var divToPrint = document.getElementById('job-postings-table');
            var newWin = window.open('', 'Print-Window');
            newWin.document.open();
            newWin.document.write(`
                <html>
                <head>
                    <title>Print</title>
                    <style>
                        table, th, td { border: 1px solid black; border-collapse: collapse; padding: 5px; }
                        th, td { text-align: left; }
                    </style>
                </head>
                <body onload="window.print()">
                    ${divToPrint.outerHTML}
                </body>
                </html>
            `);
            newWin.document.close();
            setTimeout(function() {
                newWin.close();
            }, 10);
        });

        // Export to Excel function
        document.getElementById('btnExportExcel').addEventListener('click', function() {
            var table = document.getElementById('job-postings-table');
            var wb = XLSX.utils.book_new();
            var ws = XLSX.utils.table_to_sheet(table);
            XLSX.utils.book_append_sheet(wb, ws, 'Report');
            XLSX.writeFile(wb, 'Employer_Registration_Report.xlsx');
        });

        // Export to PDF function
        document.getElementById('btnExportPdf').addEventListener('click', function() {
            const {
                jsPDF
            } = window.jspdf;
            var doc = new jsPDF();

            doc.autoTable({
                html: '#job-postings-table',
                startY: 10
            });

            doc.save('Employer_Registration_Report.pdf');
        });
    </script>
@endsection
