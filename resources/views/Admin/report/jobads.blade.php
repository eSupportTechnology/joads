@extends('layouts.admin.master')
@section('title', 'Job Ads Report')

@section('css')
@endsection

@section('style')
    <link rel="stylesheet" type="text/css" href="{{ asset('assets/css/vendors/datatables.css') }}">
    <link rel="stylesheet" type="text/css" href="{{ asset('assets/css/vendors/datatable-extension.css') }}">
    <style>
        /* Style the table headers */
        #daily-table thead th {
            background-color: #c6d9ee9f;
            color: #000000;
            text-align: center;
            font-weight: bold;
            padding: 15px;
        }

        /* Style table rows */
        #daily-table tbody tr {
            border-bottom: 1px solid #dee2e6;
            cursor: default;
        }

        /* Alternate row colors */
        #daily-table tbody tr:nth-child(even) {
            background-color: #f8f9fa;
        }

        /* Table data alignment */
        #daily-table tbody td {
            vertical-align: middle;
            text-align: center;
            padding: 15px;
        }

        /* Highlight rows on hover */
        #daily-table tbody tr:hover {
            background-color: #e9ecef;
            cursor: pointer;
        }

        /* Card header styles */
        .card-header {
            background-color: #f8f9fa;
            border-bottom: 1px solid #e3e6f0;
        }

        /* Print button styles */
        .btn-secondary {
            background-color: #6c757d;
            border-color: #6c757d;
        }

        .btn-secondary:hover {
            background-color: #5a6268;
            border-color: #545b62;
        }

        /* Responsive table container */
        .table-responsive {
            overflow-x: auto;
        }

        /* Adjust for smaller screens */
        @media (max-width: 768px) {
            #daily-table tbody td {
                font-size: 0.875rem;
                padding: 10px;
            }
        }
    </style>
@endsection

@section('breadcrumb-title')
    <h3>Job Ads Report</h3>
@endsection

@section('breadcrumb-items')
    <li class="breadcrumb-item active">Job Ads</li>
@endsection

@section('content')
<div class="container-fluid">
    <div class="row">
        <!-- Summary Cards -->
        <div class="col-xl-3 col-md-6 mb-4">
            <div class="card border-left-primary shadow h-100 py-2">
                <div class="card-body">
                    <div class="row no-gutters align-items-center">
                        <div class="col mr-2">
                            <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">Today's Ads</div>
                            <div class="h5 mb-0 font-weight-bold text-gray-800">
                                {{ $dailyTotal }}
                            </div>
                        </div>
                        <div class="col-auto">
                            <i class="fas fa-calendar fa-2x text-gray-300"></i>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-xl-3 col-md-6 mb-4">
            <div class="card border-left-success shadow h-100 py-2">
                <div class="card-body">
                    <div class="row no-gutters align-items-center">
                        <div class="col mr-2">
                            <div class="text-xs font-weight-bold text-success text-uppercase mb-1">This Week's Ads</div>
                            <div class="h5 mb-0 font-weight-bold text-gray-800">
                                {{ $weeklyTotal }}
                            </div>
                        </div>
                        <div class="col-auto">
                            <i class="fas fa-chart-bar fa-2x text-gray-300"></i>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Date Range Report -->
        <div class="col-12 mb-4">
            <div class="card shadow">
                <div class="card-header py-3">
                    <h6 class="m-0 font-weight-bold text-primary">Date Range Report</h6>
                </div>
                <div class="card-body">
                    <form action="{{ route('admin.job.report.daterange') }}" method="GET" class="mb-4">
                        <div class="row">
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>Start Date</label>
                                    <input type="date" name="start_date" class="form-control" required>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>End Date</label>
                                    <input type="date" name="end_date" class="form-control" required>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label> </label>
                                    <button type="submit" class="btn btn-primary btn-block mt-4">Generate Report</button>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <!-- Detailed Reports: Daily -->
        <div class="col-12">
            <div class="card shadow mb-4">
                <div class="card-header py-3 d-flex justify-content-between align-items-center">
                    <h6 class="m-0 font-weight-bold text-primary">Detailed Daily Reports</h6>
                    <button class="btn btn-secondary btn-sm" onclick="printTable()">Print</button>
                </div>
                <div class="card-body">
                    <div class="table-responsive" id="table-container">
                        <table class="display" id="daily-table">
                            <thead>
                                <tr>
                                    <th>Date</th>
                                    <th>Count</th>
                                    <th>Title</th>
                                    <th>Company</th>
                                    <th>Approved By</th>
                                    <th>Earnings (LKR)</th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach ($dailyCount as $daily)
                                    @if ($daily->jobs->isEmpty())
                                        <tr>
                                            <td>{{ $daily->date }}</td>
                                            <td>{{ $daily->count }}</td>
                                            <td>-</td>
                                            <td>-</td>
                                            <td>-</td>
                                            <td>{{ number_format($daily->earnings, 2) }}</td>
                                        </tr>
                                    @else
                                        @foreach ($daily->jobs as $index => $job)
                                            <tr>
                                                @if ($index == 0)
                                                    <td rowspan="{{ count($daily->jobs) }}">{{ $daily->date }}</td>
                                                    <td rowspan="{{ count($daily->jobs) }}">{{ $daily->count }}</td>
                                                @endif
                                                <td>{{ $job->title }}</td>
                                                <td>{{ $job->company_name }}</td>
                                                <td>{{ $job->approved_by }}</td>
                                                @if ($index == 0)
                                                    <td rowspan="{{ count($daily->jobs) }}">{{ number_format($daily->earnings, 2) }}</td>
                                                @endif
                                            </tr>
                                        @endforeach
                                    @endif
                                @endforeach
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>

    </div>
</div>
@endsection

@section('script')
    <script>
        function printTable() {
            const printContent = document.getElementById('table-container').innerHTML;
            const style = `
                <style>
                    table { width: 100%; border-collapse: collapse; font-family: Arial, sans-serif; font-size: 1rem; }
                    table, th, td { border: 1px solid black; text-align: center; padding: 15px; }
                    th { background-color: #007bff; color: white; text-transform: uppercase; }
                    td { background-color: #f9f9f9; }
                    tr:nth-child(even) td { background-color: #f8f9fa; }
                    tr:hover td { background-color: #e9ecef; cursor: default; }
                </style>
            `;
            const printWindow = window.open('', '_blank');
            printWindow.document.write('<html><head><title>Print Job Ads Report</title>' + style + '</head><body>' + printContent + '</body></html>');
            printWindow.document.close();
            printWindow.focus();
            printWindow.print();
            printWindow.close();
        }
    </script>
@endsection
