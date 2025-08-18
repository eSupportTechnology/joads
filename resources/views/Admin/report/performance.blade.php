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
                                        <th>Company Name</th>
                                        <th>Job Title</th>
                                        @if ($startDate && $endDate)
                                            <th>Date</th>
                                        @endif
                                        <th>Daily View</th>
                                        <th>Total View</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @php $rowNo = 1; @endphp
                                    @foreach ($results->groupBy('job_id') as $jobId => $jobGroup)
                                        @foreach ($jobGroup as $index => $result)
                                            <tr>
                                                @if ($index == 0)
                                                    <td rowspan="{{ $jobGroup->count() }}">{{ $rowNo++ }}</td>
                                                    <td rowspan="{{ $jobGroup->count() }}">{{ $result->company_name }}</td>
                                                    <td rowspan="{{ $jobGroup->count() }}">{{ $result->title }}</td>
                                                @endif

                                                @if ($startDate && $endDate)
                                                    <td>{{ \Carbon\Carbon::parse($result->view_date)->format('Y-m-d') }}
                                                    </td>
                                                @endif

                                                <td>{{ $result->daily_view }}</td>

                                                {{-- Only show total on the last row --}}
                                                @if ($index == 0)
                                                    <td rowspan="{{ $jobGroup->count() }}">{{ $result->total_view }}</td>
                                                @endif

                                            </tr>
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
    <script src="{{ asset('assets/js/datatable/datatables/jquery.dataTables.min.js') }}"></script>
    <script src="https://cdn.datatables.net/buttons/2.3.6/js/dataTables.buttons.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.10.1/jszip.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.36/pdfmake.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.36/vfs_fonts.js"></script>
    <script src="https://cdn.datatables.net/buttons/2.3.6/js/buttons.html5.min.js"></script>
    <script src="https://cdn.datatables.net/buttons/2.3.6/js/buttons.print.min.js"></script>

    <script>
        $(document).ready(function() {
            $('#performance-table').DataTable({
                dom: 'Bfrtip',
                pageLength: 100,
                columns: [{
                        searchable: false,
                        orderable: false
                    }, // Serial number column
                    null,
                    null,
                    null
                ],
                order: [],
                buttons: [{
                        extend: 'copy',
                        className: 'btn btn-primary',
                        exportOptions: {
                            columns: ':visible',
                            format: {
                                body: function(data, row, column, node) {
                                    // For first column (serial number), return row index + 1 + page offset
                                    if (column === 0) {
                                        return row + 1;
                                    }
                                    return data;
                                }
                            }
                        }
                    },
                    {
                        extend: 'csv',
                        className: 'btn btn-success',
                        exportOptions: {
                            columns: ':visible',
                            format: {
                                body: function(data, row, column, node) {
                                    if (column === 0) {
                                        return row + 1;
                                    }
                                    return data;
                                }
                            }
                        }
                    },
                    {
                        extend: 'excel',
                        className: 'btn btn-info',
                        exportOptions: {
                            columns: ':visible',
                            format: {
                                body: function(data, row, column, node) {
                                    if (column === 0) {
                                        return row + 1;
                                    }
                                    return data;
                                }
                            }
                        }
                    },
                    {
                        extend: 'pdf',
                        className: 'btn btn-danger',
                        exportOptions: {
                            columns: ':visible',
                            format: {
                                body: function(data, row, column, node) {
                                    if (column === 0) {
                                        return row + 1;
                                    }
                                    return data;
                                }
                            }
                        }
                    },
                    {
                        extend: 'print',
                        className: 'btn btn-warning',
                        exportOptions: {
                            columns: ':visible',
                            format: {
                                body: function(data, row, column, node) {
                                    if (column === 0) {
                                        return row + 1;
                                    }
                                    return data;
                                }
                            }
                        }
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
        });
    </script>
@endsection
