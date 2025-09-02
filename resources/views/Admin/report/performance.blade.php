@extends('layouts.admin.master')
@section('title', 'Performance Report')

@section('css')
    <link rel="stylesheet" type="text/css" href="{{ asset('assets/css/vendors/datatables.css') }}">
    <link rel="stylesheet" type="text/css" href="{{ asset('assets/css/vendors/datatable-extension.css') }}">
    <link rel="stylesheet" type="text/css" href="{{ asset('assets/css/vendors/datepicker.css') }}">
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/buttons/2.3.6/css/buttons.dataTables.min.css">
@endsection
@section('breadcrumb-title')
    <h3>Performance Report</h3>
@endsection

@section('content')
    <div class="container-fluid">
        <div class="row">
            <div class="col-sm-12">
                <div class="card">
                    <div class="card-header">
                        <h5>Performance Report</h5>
                        <form action="{{ route('reports.performance') }}" method="GET" class="row g-3">
                            <div class="col-md-4">
                                <label for="start_date" class="form-label">Start Date</label>
                                <input type="date" class="form-control" id="start_date" name="start_date"
                                    value="{{ request('start_date') }}">
                            </div>
                            <div class="col-md-4">
                                <label for="end_date" class="form-label">End Date</label>
                                <input type="date" class="form-control" id="end_date" name="end_date"
                                    value="{{ request('end_date') }}">
                            </div>
                            <div class="col-md-4 align-self-end">
                                <button type="submit" class="btn btn-primary">Filter</button>
                            </div>
                        </form>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table table-bordered" id="performance-table">
                                <thead>
                                    <tr>
                                        <th>No</th>
                                        <th>App.Date</th>
                                        <th>Job ID</th>
                                        <th>Company</th>
                                        <th>Job Title</th>
                                        @if (!empty($dates))
                                            @foreach ($dates as $date)
                                                <th>{{ \Carbon\Carbon::parse($date)->format('Y-m-d') }}</th>
                                            @endforeach
                                        @else
                                            <th>Daily Views</th>
                                        @endif
                                        <th>Total Views</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @php $rowNo = 1; @endphp
                                    @if (!empty($dates))
                                        {{-- ✅ Case 2: Pivoted results --}}
                                        @foreach ($results as $job)
                                            <tr>
                                                <td>{{ $rowNo++ }}</td>
                                                <td>{{ $job['approved_date'] }}</td>
                                                <td>{{ $job['job_id'] }}</td>
                                                <td>{{ $job['company_name'] }}</td>
                                                <td>{{ $job['title'] }}</td>
                                                @foreach ($dates as $date)
                                                    <td>{{ $job['views'][$date] ?? 0 }}</td>
                                                @endforeach
                                                <td>{{ $job['total'] }}</td>
                                            </tr>
                                        @endforeach
                                    @else
                                        {{-- ✅ Case 1: No date range --}}
                                        @foreach ($results as $job)
                                            <tr>
                                                <td>{{ $rowNo++ }}</td>
                                                <td>{{ $job['approved_date'] }}</td>
                                                <td>{{ $job['job_id'] }}</td>
                                                <td>{{ $job['company_name'] }}</td>
                                                <td>{{ $job['title'] }}</td>
                                                <td>{{ $job['daily_view'] }}</td>
                                                <td>{{ $job['total'] }}</td>
                                            </tr>
                                        @endforeach
                                    @endif
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
    <script src="{{ asset('assets/js/datatable/datatables/jquery.dataTables.min.js') }}"></script>
    <script src="https://cdn.datatables.net/buttons/2.3.6/js/dataTables.buttons.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.10.1/jszip.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.36/pdfmake.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.36/vfs_fonts.js"></script>
    <script src="https://cdn.datatables.net/buttons/2.3.6/js/buttons.html5.min.js"></script>
    <script src="https://cdn.datatables.net/buttons/2.3.6/js/buttons.print.min.js"></script>

    <script>
        $('#performance-table').DataTable({
            dom: 'Bfrtip',
            pageLength: 100,
            order: [],
            buttons: [{
                    extend: 'copy',
                    className: 'btn btn-primary'
                },
                {
                    extend: 'csv',
                    className: 'btn btn-success'
                },
                {
                    extend: 'excel',
                    className: 'btn btn-info'
                },
                {
                    extend: 'pdf',
                    className: 'btn btn-danger'
                },
                {
                    extend: 'print',
                    className: 'btn btn-warning'
                }
            ],
            drawCallback: function(settings) {
                var api = this.api();
                api.column(0, {
                    page: 'current'
                }).nodes().each(function(cell, i) {
                    cell.innerHTML = i + 1 + api.page.info().start;
                });
            }
        });
    </script>
@endsection
