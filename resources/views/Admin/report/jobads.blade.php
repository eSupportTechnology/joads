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

        /* Align amount column right */
        #daily-table tbody td.amount-col {
            text-align: right;
            vertical-align: bottom;

        }

        /* Export buttons styling */
        .export-buttons {
            margin-bottom: 1rem;
        }

        .export-buttons button {
            margin-right: 10px;
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

            {{-- Date filter form --}}
            <form method="GET" action="{{ route('reports.job-ads') }}" class="mb-4 row g-3 align-items-center">
                <div class="col-auto">
                    <label for="start_date" class="col-form-label">Start Date:</label>
                </div>
                <div class="col-auto">
                    <input type="date" id="start_date" name="start_date" class="form-control"
                        value="{{ old('start_date', $startDate) }}">
                </div>
                <div class="col-auto">
                    <label for="end_date" class="col-form-label">End Date:</label>
                </div>
                <div class="col-auto">
                    <input type="date" id="end_date" name="end_date" class="form-control"
                        value="{{ old('end_date', $endDate) }}">
                </div>
                <div class="col-auto">
                    <button type="submit" class="btn btn-primary">Filter</button>
                    <a href="{{ route('reports.job-ads') }}" class="btn btn-secondary">Reset</a>
                </div>
            </form>

            <!-- Export buttons -->
            <div class="col-12 export-buttons">
                <button class="btn btn-success" onclick="exportTableToExcel()">Excel</button>
                <button class="btn btn-danger" onclick="exportTableToPDF()">PDF</button>
                <button class="btn btn-primary" onclick="printTable()">Print</button>
            </div>

            <!-- Detailed Reports: Daily -->
            <div class="col-12">
                <div class="card shadow mb-4">
                    <div class="card-header py-3 d-flex justify-content-between align-items-center">
                        <h6 class="m-0 font-weight-bold text-primary">Detailed Daily Reports</h6>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="display" id="daily-table" style="width:100%">
                                <thead>
                                    <tr>
                                        <th>No</th>
                                        <th style="width: 120px">Date</th>
                                        <th>Title</th>
                                        <th>Company</th>
                                        <th>Approved By</th>
                                        <th>Total Views</th>
                                        <th>Total Amount (LKR)</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @php $serialNumber = 1; @endphp
                                    @foreach ($dailyCount as $daily)
                                        @if ($daily->jobs->isEmpty())
                                            <tr>
                                                <td>{{ $serialNumber++ }}</td>
                                                <td>{{ $daily->date }}</td>
                                                <td>-</td>
                                                <td>-</td>
                                                <td>-</td>
                                                <td>0</td>
                                                <td class="amount-col">{{ number_format($daily->earnings, 2) }}</td>
                                            </tr>
                                        @else
                                            @php $firstJob = true; @endphp
                                            @foreach ($daily->jobs as $job)
                                                <tr>
                                                    <td>{{ $serialNumber++ }}</td>
                                                    @if ($firstJob)
                                                        <td rowspan="{{ $daily->jobs->count() }}">{{ $daily->date }}</td>
                                                    @endif
                                                    <td>{{ $job->title }}</td>
                                                    <td>{{ $job->company_name }}</td>
                                                    <td>{{ $job->approved_by }}</td>
                                                    <td>{{ $job->views_count }}</td>
                                                    @if ($firstJob)
                                                        <td class="amount-col" rowspan="{{ $daily->jobs->count() }}">
                                                            {{ number_format($daily->earnings, 2) }}
                                                        </td>
                                                        @php $firstJob = false; @endphp
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
    <!-- DataTables -->
    <script src="{{ asset('assets/js/datatables/jquery.dataTables.min.js') }}"></script>
    <script src="{{ asset('assets/js/datatables/dataTables.bootstrap4.min.js') }}"></script>

    <!-- SheetJS for Excel export -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.18.5/xlsx.full.min.js"></script>

    <!-- jsPDF and jsPDF-AutoTable for PDF export -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.5.1/jspdf.umd.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf-autotable/3.5.25/jspdf.plugin.autotable.min.js"></script>

    <script>
        $(document).ready(function() {
            $('#daily-table').DataTable({
                responsive: true,
                paging: true,
                searching: true,
                ordering: true,
                info: true,
                order: [
                    [1, 'desc']
                ] // Order by date descending by default
            });
        });

        function printTable() {
            const table = document.getElementById('daily-table');
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
                            td.amount-col { text-align: right;   vertical-align: bottom;}
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

        function exportTableToExcel(filename = 'job-ads-report.xlsx') {
            let table = document.getElementById('daily-table');
            let workbook = XLSX.utils.book_new();
            let worksheet = XLSX.utils.table_to_sheet(table);
            XLSX.utils.book_append_sheet(workbook, worksheet, "Job Ads");
            XLSX.writeFile(workbook, filename);
        }

        function exportTableToPDF(filename = 'job-ads-report.pdf') {
            const {
                jsPDF
            } = window.jspdf;
            const doc = new jsPDF('landscape', 'pt', 'A4');

            doc.setFontSize(18);
            doc.text("Job Ads Report", 40, 40);

            doc.autoTable({
                html: '#daily-table',
                startY: 60,
                styles: {
                    fontSize: 10
                },
                headStyles: {
                    fillColor: [198, 217, 238]
                },
                alternateRowStyles: {
                    fillColor: [248, 249, 250]
                },
                margin: {
                    left: 40,
                    right: 40
                },
            });

            doc.save(filename);
        }
    </script>
@endsection
