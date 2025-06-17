@extends('layouts.admin.master')

@section('title', 'Countries List')

@section('css')
    <link rel="stylesheet" type="text/css" href="{{ asset('assets/css/vendors/datatables.css') }}">
    <link rel="stylesheet" type="text/css" href="{{ asset('assets/css/vendors/datatable-extension.css') }}">
@endsection

@section('style')
    <style>
        .icon-fixed-size {
            width: 16px;
            height: 16px;
            font-size: 16px;
            line-height: 16px;
            display: inline-block;
            text-align: center;
        }

        .custom-btn {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            padding: 8px 12px;
            font-size: 14px;
            border-radius: 4px;
            text-transform: uppercase;
            font-weight: bold;
            min-width: 100px;
            height: 36px;
            margin: 0 4px;
            transition: all 0.3s ease;
        }

        .custom-btn i {
            font-size: 16px;
            margin-right: 6px;
        }

        .custom-btn-warning {
            background-color: #ffc107;
            color: #fff;
            border: 1px solid #ffc107;
        }

        .custom-btn-warning:hover {
            background-color: #e0a800;
            border-color: #d39e00;
        }

        .custom-btn-danger {
            background-color: #dc3545;
            color: #fff;
            border: 1px solid #dc3545;
        }

        .custom-btn-danger:hover {
            background-color: #c82333;
            border-color: #bd2130;
        }

        .dt-ext table {
            width: 100% !important;
        }

        .actions-column {
            text-align: center;
            min-width: 200px;
        }

        /* Hide Actions column when printing */
        @media print {
            .actions-column {
                display: none;
            }

            #countries-table td:nth-last-child(1),
            #countries-table th:nth-last-child(1) {
                display: none;
            }
        }
    </style>
@endsection

@section('breadcrumb-title')
    <h3>Countries List</h3>
@endsection

@section('breadcrumb-items')
    <li class="breadcrumb-item">Dashboard</li>
    <li class="breadcrumb-item active">Countries List</li>
@endsection

@section('content')
    <div class="container-fluid">
        @if (session('success'))
            <div class="alert alert-success">{{ session('success') }}</div>
        @endif

        <div class="row">
            <div class="col-sm-12">
                <div class="card">
                    <div class="card-header d-flex justify-content-between align-items-center">
                        <h5>Countries</h5>
                        <a href="{{ route('countries.create') }}" class="btn btn-primary custom-btn">
                            <i class="fa fa-plus icon-fixed-size"></i> Create New
                        </a>
                    </div>
                    <div class="card-body">
                        <div class="dt-ext table-responsive">
                            <table class="display" id="countries-table">
                                <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>Name</th>
                                        <th>Total Views</th>
                                        <th>Today Views</th>
                                        <th class="actions-column">Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @foreach ($countries as $country)
                                        <tr>
                                            <td>{{ $loop->iteration }}</td>
                                            <td>{{ $country->name }}</td>
                                            <td>{{ $country->total_view_count ?? 0 }}</td>
                                            <td>{{ $country->total_update_count ?? 0 }}</td>
                                            <td class="actions-column">
                                                <a href="{{ route('countries.edit', $country) }}"
                                                    class="btn custom-btn custom-btn-warning" style="height:12px">
                                                    <i class="icon-pencil-alt icon-fixed-size"></i> Edit
                                                </a>
                                                <form action="{{ route('countries.destroy', $country) }}" method="POST"
                                                    class="d-inline">
                                                    @csrf
                                                    @method('DELETE')
                                                    <button type="submit" class="btn custom-btn custom-btn-danger" style="height:12px"
                                                        onclick="return confirm('Are you sure you want to delete this country?')">
                                                        <i class="icon-trash icon-fixed-size"></i> Delete
                                                    </button>
                                                </form>
                                            </td>
                                        </tr>
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
    <script src="{{ asset('assets/js/datatable/datatable-extension/dataTables.buttons.min.js') }}"></script>
    <script src="{{ asset('assets/js/datatable/datatable-extension/jszip.min.js') }}"></script>
    <script src="{{ asset('assets/js/datatable/datatable-extension/pdfmake.min.js') }}"></script>
    <script src="{{ asset('assets/js/datatable/datatable-extension/vfs_fonts.js') }}"></script>
    <script src="{{ asset('assets/js/datatable/datatable-extension/buttons.html5.min.js') }}"></script>
    <script src="{{ asset('assets/js/datatable/datatable-extension/buttons.print.min.js') }}"></script>
    <script src="{{ asset('assets/js/datatable/datatable-extension/dataTables.bootstrap4.min.js') }}"></script>
    <script src="{{ asset('assets/js/datatable/datatable-extension/dataTables.responsive.min.js') }}"></script>
    <script>
        $(document).ready(function() {
            $('#countries-table').DataTable({
                responsive: true,
                pageLength: 25,
                dom: 'Bfrtip',
                buttons: [
                    'copy',
                    'csv',
                    'excel',
                    'pdf',
                    {
                        extend: 'print',
                        exportOptions: {
                            columns: ':not(.actions-column)' // Exclude actions column during export
                        }
                    }
                ],
                order: [
                    [0, 'asc']
                ],
                columnDefs: [{
                    targets: [-1],
                    orderable: false
                }]
            });
        });
    </script>
@endsection
