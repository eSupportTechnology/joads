@extends('layouts.admin.master')
@section('title', 'Manage Job Postings')

@section('css')
@endsection

@section('style')
    <link rel="stylesheet" type="text/css" href="{{ asset('assets/css/vendors/datatables.css') }}">
    <link rel="stylesheet" type="text/css" href="{{ asset('assets/css/vendors/datatable-extension.css') }}">
    <link rel="stylesheet" type="text/css" href="{{ asset('assets/css/vendors/animate.css') }}">
@endsection

@section('breadcrumb-title')
    <h3>Manage Job Postings</h3>
@endsection

@section('breadcrumb-items')
    <li class="breadcrumb-item">Dashboard</li>
    <li class="breadcrumb-item active">Manage Job Postings</li>
@endsection

@section('content')
    <div class="container-fluid">
        <div class="card">
            <div class="card-body">
                @if (session('success'))
                    <div class="alert alert-success">{{ session('success') }}</div>
                @endif

                <ul class="nav nav-tabs" id="jobPostingsTab" role="tablist">
                    <li class="nav-item" role="presentation">
                        <button class="nav-link active" id="pending-tab" data-bs-toggle="tab" data-bs-target="#pending"
                            type="button" role="tab" aria-controls="pending" aria-selected="true">Pending</button>
                    </li>
                    <li class="nav-item" role="presentation">
                        <button class="nav-link" id="published-tab" data-bs-toggle="tab" data-bs-target="#published"
                            type="button" role="tab" aria-controls="published" aria-selected="false">Published</button>
                    </li>
                    <li class="nav-item" role="presentation">
                        <button class="nav-link" id="rejected-tab" data-bs-toggle="tab" data-bs-target="#rejected"
                            type="button" role="tab" aria-controls="rejected" aria-selected="false">Rejected</button>
                    </li>
                    <li class="nav-item" role="presentation">
                        <button class="nav-link" id="expired-tab" data-bs-toggle="tab" data-bs-target="#expired"
                            type="button" role="tab" aria-controls="expired" aria-selected="false">Expired</button>
                    </li>
                </ul>

                <div class="tab-content" id="jobPostingsTabContent">
                    <!-- Pending Tab -->
                    <div class="tab-pane fade show active" id="pending" role="tabpanel" aria-labelledby="pending-tab">
                        <div class="dt-ext table-responsive">
                            <table class="display" id="pending-table">
                                <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>ID</th>
                                        <th>Title</th>
                                        <th>Category</th>
                                        <th>Employer</th>
                                        <th>Status</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @foreach ($pendingJobs as $index => $job)
                                        <tr>
                                            <td>{{ $index + 1 }}</td>
                                            <td>{{ $job->job_id }}</td>
                                            <td>{{ $job->title }}</td>
                                            <td>{{ $job->category->name }}</td>
                                            <td>{{ $job->employer->company_name }}</td>
                                            <td>{{ $job->status }}</td>
                                            <td>
                                                <a href="{{ route('job_postings.show', $job->id) }}"
                                                    class="btn btn-info btn-sm">View</a>
                                            </td>
                                        </tr>
                                    @endforeach
                                </tbody>
                            </table>
                        </div>
                    </div>

                    <!-- Published Tab -->
                    <div class="tab-pane fade" id="published" role="tabpanel" aria-labelledby="published-tab">
                        <div class="dt-ext table-responsive">
                            <table class="display" id="published-table">
                                <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>ID</th>
                                        <th>Title</th>
                                        <th>Category</th>
                                        <th>Employer</th>
                                        <th>Views</th>
                                        <th>Status</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @foreach ($jobPostings as $index => $job)
                                        <tr>
                                            <td>{{ $index + 1 }}</td>
                                            <td>{{ $job->job_id }}</td>
                                            <td>{{ $job->title }}</td>
                                            <td>{{ $job->category->name }}</td>
                                            <td>{{ $job->employer->company_name }}</td>
                                            <td>{{ $job->view_count }}</td>
                                            <td>{{ $job->status }}</td>
                                            <td>
                                                <a href="{{ route('job_postings.show', $job->id) }}"
                                                    class="btn btn-info btn-sm">View</a>
                                            </td>
                                        </tr>
                                    @endforeach
                                </tbody>
                            </table>
                        </div>
                    </div>

                    <!-- Rejected Tab -->
                    <div class="tab-pane fade" id="rejected" role="tabpanel" aria-labelledby="rejected-tab">
                        <div class="dt-ext table-responsive">
                            <table class="display" id="rejected-table">
                                <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>ID</th>
                                        <th>Title</th>
                                        <th>Category</th>
                                        <th>Employer</th>
                                        <th>Status</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @foreach ($rejectedJobs as $index => $job)
                                        <tr>
                                            <td>{{ $index + 1 }}</td>
                                            <td>{{ $job->job_id }}</td>
                                            <td>{{ $job->title }}</td>
                                            <td>{{ $job->category->name }}</td>
                                            <td>{{ $job->employer->company_name }}</td>
                                            <td>{{ $job->status }}</td>
                                            <td>
                                                <a href="{{ route('job_postings.show', $job->id) }}"
                                                    class="btn btn-info btn-sm">View</a>
                                            </td>
                                        </tr>
                                    @endforeach
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <!-- Expired  Tab -->
                    <div class="tab-pane fade" id="expired" role="tabpanel" aria-labelledby="expired-tab">
                        <div class="dt-ext table-responsive">
                            <table class="display" id="expired-table">
                                <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>ID</th>
                                        <th>Title</th>
                                        <th>Category</th>
                                        <th>Employer</th>
                                        <th>Status</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @foreach ($expireddJobs as $index => $job)
                                        <tr>
                                            <td>{{ $index + 1 }}</td>
                                            <td>{{ $job->job_id }}</td>
                                            <td>{{ $job->title }}</td>
                                            <td>{{ $job->category->name }}</td>
                                            <td>{{ $job->employer->company_name }}</td>
                                            <td>{{ $job->status }}</td>
                                            <td>
                                                <a href="{{ route('job_postings.show', $job->id) }}"
                                                    class="btn btn-info btn-sm">View</a>
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
    <script src="{{ asset('assets/js/datatable/datatable-extension/buttons.colVis.min.js') }}"></script>
    <script src="{{ asset('assets/js/datatable/datatable-extension/pdfmake.min.js') }}"></script>
    <script src="{{ asset('assets/js/datatable/datatable-extension/vfs_fonts.js') }}"></script>
    <script src="{{ asset('assets/js/datatable/datatable-extension/dataTables.autoFill.min.js') }}"></script>
    <script src="{{ asset('assets/js/datatable/datatable-extension/dataTables.select.min.js') }}"></script>
    <script src="{{ asset('assets/js/datatable/datatable-extension/buttons.bootstrap4.min.js') }}"></script>
    <script src="{{ asset('assets/js/datatable/datatable-extension/buttons.html5.min.js') }}"></script>
    <script src="{{ asset('assets/js/datatable/datatable-extension/buttons.print.min.js') }}"></script>
    <script src="{{ asset('assets/js/datatable/datatable-extension/dataTables.bootstrap4.min.js') }}"></script>
    <script src="{{ asset('assets/js/datatable/datatable-extension/dataTables.responsive.min.js') }}"></script>
    <script src="{{ asset('assets/js/datatable/datatable-extension/responsive.bootstrap4.min.js') }}"></script>
    <script src="{{ asset('assets/js/datatable/datatable-extension/dataTables.keyTable.min.js') }}"></script>
    <script src="{{ asset('assets/js/datatable/datatable-extension/dataTables.colReorder.min.js') }}"></script>
    <script src="{{ asset('assets/js/datatable/datatable-extension/dataTables.fixedHeader.min.js') }}"></script>
    <script src="{{ asset('assets/js/datatable/datatable-extension/dataTables.rowReorder.min.js') }}"></script>
    <script src="{{ asset('assets/js/datatable/datatable-extension/dataTables.scroller.min.js') }}"></script>

    <script>
        $(document).ready(function() {
            // Initialize DataTables with simpler options first
            $('#pending-table, #published-table, #rejected-table,#expired-table').DataTable({
                dom: 'Blfrtip',
                pagingType: 'full_numbers', // This ensures all pagination controls appear
                buttons: ['copy', 'csv', 'excel', 'pdf', 'print'],
                responsive: true,
                lengthMenu: [
                    [10, 25, 50, -1],
                    [10, 25, 50, "All"]
                ]
            });
        });
    </script>
@endsection