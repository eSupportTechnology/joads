@extends('layouts.admin.master')

@section('title', 'Employer Registration Report')

@section('css')
    <link rel="stylesheet" type="text/css" href="{{ asset('assets/css/vendors/datatables.css') }}">
    <link rel="stylesheet" type="text/css" href="{{ asset('assets/css/vendors/datatable-extension.css') }}">
@endsection

@section('breadcrumb-title')
    <h3>Employer Registration Report</h3>
@endsection


@section('content')
    <div class="container mt-5">
        <div class="container mt-5">
            <div class="row mb-4">
                <!-- Daily Employers -->
                <div class="col-xl-3 col-md-6 mb-4">
                    <div class="card border-left-primary shadow h-100 py-2">
                        <div class="card-body">
                            <div class="row no-gutters align-items-center">
                                <div class="col mr-2">
                                    <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">Today's Employers</div>
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
                                    <div class="text-xs font-weight-bold text-success text-uppercase mb-1">This Week's Employers</div>
                                    <div class="h5 mb-0 font-weight-bold text-gray-800">{{ $weeklyEmployerCount }}</div>
                                </div>
                                <div class="col-auto">
                                    <i class="fas fa-calendar-week fa-2x text-gray-300"></i>
                                </div>
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
                <input type="date" name="start_date" id="start_date" value="{{ old('start_date', $startDate ?? '') }}" class="form-control" />
            </div>

            <div class="col-auto">
                <label for="end_date" class="col-form-label">End Date:</label>
            </div>
            <div class="col-auto">
                <input type="date" name="end_date" id="end_date" value="{{ old('end_date', $endDate ?? '') }}" class="form-control" />
            </div>

            <div class="col-auto">
                <button type="submit" class="btn btn-primary">Generate Report</button>
            </div>
        </form>

        <table id="job-postings-table" class="table table-bordered" style="width:100%">
            <thead>
                <tr>
                    <th class="text-center">No.</th>
                    <th class="text-center">Post Date</th>
                    <th class="text-center">Approved Date</th>
                    <th class="text-center">Company</th>
                    <th class="text-center">Post</th>
                    <th class="text-center">Total Views</th>
                    <th class="text-center">Paid Amount (LKR)</th>
                    <th class="text-center">Daily Total Earnings (LKR)</th> <!-- New column -->
                </tr>
            </thead>
            <tbody>
                @php $lastDate = null; @endphp
                @forelse ($jobPostings as $key => $job)
                    @php
                        $currentDate = \Carbon\Carbon::parse($job->created_at)->format('Y-m-d');
                    @endphp
                    <tr>
                        <td class="text-left">{{ $key + 1 }}</td>
                        <td class="text-left">{{ $currentDate }}</td>
                        <td class="text-left">{{ $job->approved_date ? \Carbon\Carbon::parse($job->approved_date)->format('Y-m-d') : 'Not Approved' }}</td>
                        <td class="text-left">{{ $job->company_name ?? 'N/A' }}</td>
                        <td class="text-left">{{ $job->title }}</td>
                        <td class="text-left">{{ $job->view_count }}</td>
                        <td class="text-right" style="text-align: right">{{ number_format($job->lkr_price, 2) }}</td>
                        <td class="text-right" style="text-align: right">
                            @if ($lastDate !== $currentDate)
                                {{ number_format($dailyTotals->get($currentDate, 0), 2) }}
                            @endif
                        </td>
                    </tr>
                    @php $lastDate = $currentDate; @endphp
                @empty
                    <tr>
                        <td colspan="8" class="text-center">No job postings available.</td>
                    </tr>
                @endforelse
            </tbody>
            <tfoot>
                {{--  <tr>
                    <th colspan="6" style="text-align:right">Total Earnings (LKR):</th>
                    <th>{{ number_format($totalEarningsLkr, 2) }}</th>
                    <th></th>
                </tr>  --}}
            </tfoot>
        </table>
    </div>
@endsection

@section('script')
    <script src="{{ asset('assets/js/datatable/datatables/jquery.dataTables.min.js') }}"></script>
    <script src="{{ asset('assets/js/datatable/datatable-extension/dataTables.buttons.min.js') }}"></script>
    <script src="{{ asset('assets/js/datatable/datatable-extension/jszip.min.js') }}"></script>
    <script src="{{ asset('assets/js/datatable/datatable-extension/buttons.html5.min.js') }}"></script>
    <script src="{{ asset('assets/js/datatable/datatable-extension/buttons.print.min.js') }}"></script>

    <script>
        $(document).ready(function () {
            $('#job-postings-table').DataTable({
                dom: 'Bfrtip',
                buttons: ['copy', 'csv', 'excel', 'pdf', 'print'],
                pageLength: 50,
                ordering: true,
                responsive: true
            });
        });
    </script>
@endsection
