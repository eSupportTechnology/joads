@extends('layouts.admin.master')
@section('title', 'Applications & Users Report')

@section('css')
    <link rel="stylesheet" type="text/css" href="{{ asset('assets/css/vendors/datatables.css') }}">
    <link rel="stylesheet" type="text/css" href="{{ asset('assets/css/vendors/datatable-extension.css') }}">
    <!-- DataTables Buttons CSS -->
    <link rel="stylesheet" href="https://cdn.datatables.net/buttons/2.4.1/css/buttons.dataTables.min.css" />
@endsection

@section('style')
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
          text-align: left
    }
    .styled-table th {
        background-color: #b6cbe200;
        color: #000000;
     
    }
    .styled-table td {
        background-color: #f9f9f9;
        text-align: left
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
                            <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">Applications (Filtered)</div>
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
                            <div class="text-xs font-weight-bold text-success text-uppercase mb-1">New Users (Filtered)</div>
                            <div class="h5 mb-0 font-weight-bold text-gray-800">{{ $dailyUsers }}</div>
                        </div>
                        <div class="col-auto">
                            <i class="fas fa-users fa-2x text-gray-300"></i>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Date Range Filter Form -->
        <div class="col-12 mb-3">
            <form method="GET" action="{{ route('reports.customers') }}" class="row g-3 align-items-end">
                <div class="col-auto">
                    <label for="start_date" class="form-label">Start Date</label>
                    <input type="date" id="start_date" name="start_date" value="{{ request('start_date', $startDate ?? '') }}" class="form-control">
                </div>
                <div class="col-auto">
                    <label for="end_date" class="form-label">End Date</label>
                    <input type="date" id="end_date" name="end_date" value="{{ request('end_date', $endDate ?? '') }}" class="form-control">
                </div>
                <div class="col-auto">
                    <button type="submit" class="btn btn-primary">Filter</button>
                    <a href="{{ route('reports.customers') }}" class="btn btn-secondary">Reset</a>
                </div>
            </form>
        </div>

        <!-- Applications Report Table -->
        <div class="col-12">
            <div class="card shadow mb-4">
                <div class="card-header py-3 d-flex justify-content-between align-items-center">
                    <h6 class="m-0 font-weight-bold text-primary">Applications Report</h6>
                    {{-- Buttons will be injected here by DataTables --}}
                </div>
                <div class="card-body">
                    <div class="table-responsive mt-3">
                        <table class="display styled-table" id="daily-apps-table" style="width:100%">
                            <thead>
                                <tr>
                                    <th class="text-center">S.No.</th> 
                                    <th class="text-center" style="width: 120px">Date</th>
                                    <th class="text-center">User Name</th>
                                    <th class="text-center">User Email</th>
                                    <th class="text-center">Job Title</th>
                                </tr>
                            </thead>
                            <tbody>
                                @php $serialNumber = 1; @endphp
                                @foreach ($dailyApplicationsData as $daily)
                                    @php
                                        $applications = $daily['applications'] ?? [];
                                        $date = $daily['date'];
                                    @endphp

                                    @if (!empty($applications))
                                        @foreach ($applications as $application)
                                            <tr>
                                                <td class="text-left">{{ $serialNumber }}</td>
                                                <td class="text-left">{{ $date }}</td>
                                                <td class="text-left">{{ $application['user_name'] ?? 'N/A' }}</td>
                                                <td class="text-left">{{ $application['user_email'] ?? 'N/A' }}</td>
                                                <td class="text-left">{{ $application['job_title'] ?? 'N/A' }}</td>
                                            </tr>
                                            @php $serialNumber++; @endphp
                                        @endforeach
                                    @else
                                        <tr>
                                            <td class="text-left">{{ $serialNumber }}</td>
                                            <td class="text-left">{{ $date }}</td>
                                            <td colspan="3" class="text-center">No Applications</td>
                                        </tr>
                                        @php $serialNumber++; @endphp
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
    <!-- jQuery (required for DataTables) -->
    <script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
    <!-- DataTables JS -->
    <script src="https://cdn.datatables.net/1.13.4/js/jquery.dataTables.min.js"></script>
    <!-- DataTables Buttons -->
    <script src="https://cdn.datatables.net/buttons/2.4.1/js/dataTables.buttons.min.js"></script>
    <script src="https://cdn.datatables.net/buttons/2.4.1/js/buttons.html5.min.js"></script>
    <script src="https://cdn.datatables.net/buttons/2.4.1/js/buttons.print.min.js"></script>
    <!-- JSZip for Excel export -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.10.1/jszip.min.js"></script>
    <!-- pdfmake for PDF export -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.2.7/pdfmake.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.2.7/vfs_fonts.js"></script>

    <script>
        $(document).ready(function() {
            $('#daily-apps-table').DataTable({
                dom: 'Bfrtip', // Show buttons on top
                buttons: [
                    'print',
                    {
                        extend: 'pdfHtml5',
                        title: 'Applications Report',
                        exportOptions: {
                            columns: ':visible'
                        }
                    },
                    {
                        extend: 'excelHtml5',
                        title: 'Applications Report',
                        exportOptions: {
                            columns: ':visible'
                        }
                    }
                ],
                order: [[1, 'desc']], // order by date desc
                pageLength: 100
            });
        });
    </script>
@endsection
