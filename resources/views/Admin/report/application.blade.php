@extends('layouts.admin.master')
@section('title', 'Applications & Users Report')

@section('css')
@endsection

@section('style')
    <!-- Include additional styles for DataTable -->
    <link rel="stylesheet" type="text/css" href="{{ asset('assets/css/vendors/datatables.css') }}">
    <link rel="stylesheet" type="text/css" href="{{ asset('assets/css/vendors/datatable-extension.css') }}">
    <style>
        /* General Table Styling */
        .styled-table {
            width: 100%;
            border-collapse: collapse;
            margin: 25px 0;
            font-size: 1rem;
            font-family: 'Arial', sans-serif;
            text-align: left;
            color: #333;
        }
        .styled-table th,
        .styled-table td {
            border: 1px solid #ddd;
            padding: 15px;
        }
        .styled-table th {
            background-color: #b6cbe200;
            color: #000000;
            text-transform: uppercase;
        }
        .styled-table td {
            background-color: #f9f9f9;
        }
        .styled-table tr:nth-child(even) td {
            background-color: #f1f1f1;
        }
        .styled-table tr:hover td {
            background-color: #f2f2f2;
        }
    </style>
@endsection

@section('breadcrumb-title')
    <h3>Applications & Users Report</h3>
@endsection

@section('breadcrumb-items')
    <li class="breadcrumb-item active">Applications & Users</li>
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
                            <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">Today's Applications</div>
                            <div class="h5 mb-0 font-weight-bold text-gray-800">{{ $dailyApplications }}</div>
                        </div>
                        <div class="col-auto">
                            <i class="fas fa-file-alt fa-2x text-gray-300"></i>
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
                            <div class="text-xs font-weight-bold text-success text-uppercase mb-1">Today's New Users</div>
                            <div class="h5 mb-0 font-weight-bold text-gray-800">{{ $dailyUsers }}</div>
                        </div>
                        <div class="col-auto">
                            <i class="fas fa-users fa-2x text-gray-300"></i>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Applications Report -->
        <div class="col-12">
            <div class="card shadow mb-4">
                <div class="card-header py-3 d-flex justify-content-between">
                    <h6 class="m-0 font-weight-bold text-primary">Applications Report</h6>
                    <button class="btn btn-primary btn-sm" onclick="printTable('daily-apps-table')">Print Table</button>
                </div>
                <div class="card-body">
                    <div class="table-responsive mt-3">
                        <table class="display styled-table" id="daily-apps-table">
                            <thead>
                                <tr>
                                    <th class="text-center">No.</th> 
                                    <th class="text-center">Date</th>
                                    <th class="text-center">Applications Count</th>
                                    <th class="text-center">User Name</th>
                                    <th class="text-center">User Email</th>
                                    <th class="text-center">Job Title</th>
                                </tr>
                            </thead>
                            <tbody>
                                @php $serialNumber = 1; @endphp <!-- Initialize serial number -->
                                @foreach ($dailyApplicationsData as $daily)
                                    @php
                                        $rowSpan = count($daily['applications'] ?? []) ?: 1;
                                    @endphp
                                    <tr>
                                        <td rowspan="{{ $rowSpan }}">{{ $serialNumber }}</td> <!-- Add serial number -->
                                        <td rowspan="{{ $rowSpan }}">{{ $daily['date'] }}</td>
                                        <td rowspan="{{ $rowSpan }}">{{ $daily['count'] }}</td>
                                        @if (!empty($daily['applications']))
                                            <td>{{ $daily['applications'][0]['user_name'] ?? 'N/A' }}</td>
                                            <td>{{ $daily['applications'][0]['user_email'] ?? 'N/A' }}</td>
                                            <td>{{ $daily['applications'][0]['job_title'] ?? 'N/A' }}</td>
                                        @else
                                            <td colspan="3">No Applications</td>
                                        @endif
                                    </tr>
                                    @php $serialNumber++; @endphp <!-- Increment for next main row -->
                                    @foreach ($daily['applications'] ?? [] as $index => $application)
                                        @if ($index > 0)
                                            <tr>
                                                <td>{{ $application['user_name'] ?? 'N/A' }}</td>
                                                <td>{{ $application['user_email'] ?? 'N/A' }}</td>
                                                <td>{{ $application['job_title'] ?? 'N/A' }}</td>
                                            </tr>
                                        @endif
                                    @endforeach
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
    function printTable(tableId) {
        const table = document.getElementById(tableId).outerHTML;
        const style = `
            <style>
                table { width: 100%; border-collapse: collapse; font-family: Arial, sans-serif; font-size: 1rem; }
                table, th, td { border: 1px solid black; text-align: left; padding: 10px; }
                th { background-color: #007bff; color: white; text-transform: uppercase; }
                td { background-color: #f9f9f9; }
                tr:nth-child(even) td { background-color: #f1f1f1; }
                tr:hover td { background-color: #f2f2f2; }
            </style>`;
        const printWindow = window.open('', '_blank');
        printWindow.document.write('<html><head><title>Print Table</title>' + style + '</head><body>' + table + '</body></html>');
        printWindow.document.close();
        printWindow.print();
    }
</script>
@endsection
