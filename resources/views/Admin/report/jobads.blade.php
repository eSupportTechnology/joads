@extends('layouts.admin.master')
@section('title', 'Job Ads Report')

@section('css')
    <link rel="stylesheet" type="text/css" href="{{ asset('assets/css/vendors/datatables.css') }}">
    <link rel="stylesheet" type="text/css" href="{{ asset('assets/css/vendors/datatable-extension.css') }}">
@endsection

@section('style')
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
            text-align: left;
            padding: 15px;
        }

        /* Highlight rows on hover */
        #daily-table tbody tr:hover {
            background-color: #e9ecef;
            cursor: pointer;
        }

        /* Responsive table container */
        .table-responsive {
            overflow-x: auto;
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

        <!-- Detailed Reports: Daily -->
        <div class="col-12">
            <div class="card shadow mb-4">
                <div class="card-header py-3 d-flex justify-content-between align-items-center">
                    <h6 class="m-0 font-weight-bold text-primary">Detailed Daily Reports</h6>
                    <button onclick="printTable()" class="btn btn-primary">Print Table</button>
                </div>
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="display" id="daily-table">
                            <thead>
                                <tr>
                                    <th>No.</th>
                                    <th>Date</th>
                                    <th>Count</th>
                                    <th>Title</th>
                                    <th>Company</th>
                                    <th>Approved By</th>
                                    <th>Views</th>
                                    <th>Amount (LKR)</th>
                                </tr>
                            </thead>
                            <tbody>
                                @php $serialNumber = 1; @endphp
                                @foreach ($dailyCount as $daily)
                                    @if ($daily->jobs->isEmpty())
                                        <tr>
                                            <td>{{ $serialNumber++ }}</td>
                                            <td>{{ $daily->date }}</td>
                                            <td>{{ $daily->count }}</td>
                                            <td>-</td>
                                            <td>-</td>
                                            <td>-</td>
                                            <td>0</td>
                                            <td style="text-align: right">{{ number_format($daily->earnings, 2) }}</td>
                                        </tr>
                                    @else
                                        @foreach ($daily->jobs as $index => $job)
                                            <tr>
                                                @if ($index == 0)
                                                    <td rowspan="{{ count($daily->jobs) }}">{{ $serialNumber++ }}</td>
                                                    <td rowspan="{{ count($daily->jobs) }}">{{ $daily->date }}</td>
                                                    <td rowspan="{{ count($daily->jobs) }}">{{ $daily->count }}</td>
                                                @endif
                                                <td>{{ $job->title }}</td>
                                                <td>{{ $job->company_name }}</td>
                                                <td>{{ $job->approved_by }}</td>
                                                <td>{{ $job->views_count }}</td>
                                                @if ($index == 0)
                                                    <td rowspan="{{ count($daily->jobs) }}" style="text-align: right">{{ number_format($daily->earnings, 2) }}</td>
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
    <script src="{{ asset('assets/js/datatables/jquery.dataTables.min.js') }}"></script>
    <script src="{{ asset('assets/js/datatables/dataTables.bootstrap4.min.js') }}"></script>
    <script>
        $(document).ready(function() {
            $('#daily-table').DataTable({
                responsive: true,
                paging: true,
                searching: true,
                ordering: true,
                info: true
            });
        });

        function printTable() {
            // Get the table element
            const table = document.getElementById('daily-table');

            // Create a new window for printing
            const printWindow = window.open('', '_blank');
            printWindow.document.write(`
                <html>
                    <head>
                        <title>Job Ads Report</title>
                        <style>
                            body { font-family: Arial, sans-serif; margin: 20px; }
                            table { width: 100%; border-collapse: collapse; }
                            th, td { border: 1px solid #ddd; padding: 8px; text-align: left; }
                            th { background-color: #c6d9ee9f; font-weight: bold; text-align: center; }
                            tr:nth-child(even) { background-color: #f8f9fa; }
                            tr:hover { background-color: #e9ecef; }
                            h3 { text-align: center; color: #333; }
                        </style>
                    </head>
                    <body>
                        <h3>Job Ads Report</h3>
                        ${table.outerHTML}
                    </body>
                </html>
            `);
            printWindow.document.close();
            printWindow.focus();
            printWindow.print();
            printWindow.close();
        }
    </script>
@endsection