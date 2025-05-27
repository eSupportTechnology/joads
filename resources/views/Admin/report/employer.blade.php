@extends('layouts.admin.master')
@section('title', 'Employer Registration Report')

@section('css')
@endsection

@section('style')
    <link rel="stylesheet" type="text/css" href="{{ asset('assets/css/vendors/datatables.css') }}">
    <link rel="stylesheet" type="text/css" href="{{ asset('assets/css/vendors/datatable-extension.css') }}">
@endsection

@section('breadcrumb-title')
    <h3>Employer Registration Report</h3>
@endsection

@section('breadcrumb-items')
    <li class="breadcrumb-item active">Employer Registrations</li>
@endsection

@section('content')
    <div class="container mt-5">
        <h1>Employer Statistics</h1>

        <!-- Navigation Tabs -->
        <ul class="nav nav-tabs" id="statisticsTabs" role="tablist">
            <li class="nav-item">
                <a class="nav-link active" id="daily-tab" data-bs-toggle="tab" href="#daily" role="tab" aria-controls="daily" aria-selected="true">Daily</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" id="weekly-tab" data-bs-toggle="tab" href="#weekly" role="tab" aria-controls="weekly" aria-selected="false">Weekly</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" id="monthly-tab" data-bs-toggle="tab" href="#monthly" role="tab" aria-controls="monthly" aria-selected="false">Monthly</a>
            </li>
        </ul>

        <div class="tab-content mt-4" id="statisticsTabContent">
            <!-- Daily Statistics -->
            <div class="tab-pane fade show active" id="daily" role="tabpanel" aria-labelledby="daily-tab">
                <h2>Daily Company Statistics (Last 30 Days)</h2>
                <table id="daily-table" class="table table-bordered">
                    <thead>
                        <tr>
                            <th>Date</th>
                            <th>Total Companies</th>
                            <th>Companies</th>
                        </tr>
                    </thead>
                    <tbody>
                        @forelse ($dailyCompanyStats as $day)
                            <tr>
                                <td>{{ $day['date'] }}</td>
                                <td>{{ $day['count'] }}</td>
                                <td>
                                    <ul>
                                        @forelse ($day['employers'] as $employer)
                                            <li>
                                                <strong>{{ $employer->company_name }}</strong> ({{ $employer->email }})
                                                <ul>
                                                    @forelse ($employer->jobPostings as $job)
                                                        <li>{{ $job->title }} - {{ $job->view_count }} views</li>
                                                    @empty
                                                        <li>No job postings available</li>
                                                    @endforelse
                                                </ul>
                                            </li>
                                        @empty
                                            <li>No companies available</li>
                                        @endforelse
                                    </ul>
                                </td>
                            </tr>
                        @empty
                            <tr>
                                <td colspan="3">No data available for the last 30 days</td>
                            </tr>
                        @endforelse
                    </tbody>
                </table>
            </div>

            <!-- Weekly Statistics -->
            <div class="tab-pane fade" id="weekly" role="tabpanel" aria-labelledby="weekly-tab">
                <h2>Weekly Company Statistics (This Year)</h2>
                <table id="weekly-table" class="table table-bordered">
                    <thead>
                        <tr>
                            <th>Week</th>
                            <th>Total Companies</th>
                            <th>Companies</th>
                        </tr>
                    </thead>
                    <tbody>
                        @forelse ($weeklyCompanyStats as $week)
                            <tr>
                                <td>Week {{ $week['week'] }} ({{ $week['week_start'] }} - {{ $week['week_end'] }})</td>
                                <td>{{ $week['count'] }}</td>
                                <td>
                                    <ul>
                                        @forelse ($week['employers'] as $employer)
                                            <li>
                                                <strong>{{ $employer->company_name }}</strong> ({{ $employer->email }})
                                                <ul>
                                                    @forelse ($employer->jobPostings as $job)
                                                        <li>{{ $job->title }} - {{ $job->view_count }} views</li>
                                                    @empty
                                                        <li>No job postings available</li>
                                                    @endforelse
                                                </ul>
                                            </li>
                                        @empty
                                            <li>No companies available</li>
                                        @endforelse
                                    </ul>
                                </td>
                            </tr>
                        @empty
                            <tr>
                                <td colspan="3">No data available for this year</td>
                            </tr>
                        @endforelse
                    </tbody>
                </table>
            </div>

            <!-- Monthly Statistics -->
            <div class="tab-pane fade" id="monthly" role="tabpanel" aria-labelledby="monthly-tab">
                <h2>Monthly Company Statistics (This Year)</h2>
                <table id="monthly-table" class="table table-bordered">
                    <thead>
                        <tr>
                            <th>Month</th>
                            <th>Total Companies</th>
                            <th>Companies</th>
                        </tr>
                    </thead>
                    <tbody>
                        @forelse ($monthlyCompanyStats as $month)
                            <tr>
                                <td>{{ $month['month'] }}</td>
                                <td>{{ $month['count'] }}</td>
                                <td>
                                    <ul>
                                        @forelse ($month['employers'] as $employer)
                                            <li>
                                                <strong>{{ $employer->company_name }}</strong> ({{ $employer->email }})
                                                <ul>
                                                    @forelse ($employer->jobPostings as $job)
                                                        <li>{{ $job->title }} - {{ $job->view_count }} views</li>
                                                    @empty
                                                        <li>No job postings available</li>
                                                    @endforelse
                                                </ul>
                                            </li>
                                        @empty
                                            <li>No companies available</li>
                                        @endforelse
                                    </ul>
                                </td>
                            </tr>
                        @empty
                            <tr>
                                <td colspan="3">No data available for this year</td>
                            </tr>
                        @endforelse
                    </tbody>
                </table>
            </div>
        </div>
    </div>
@endsection

@section('script')
    <script src="{{ asset('assets/js/datatable/datatables/jquery.dataTables.min.js') }}"></script>
    <script src="{{ asset('assets/js/datatable/datatable-extension/dataTables.buttons.min.js') }}"></script>
    <script src="{{ asset('assets/js/datatable/datatable-extension/jszip.min.js') }}"></script>
    <script src="{{ asset('assets/js/datatable/datatable-extension/buttons.html5.min.js') }}"></script>
    <script src="{{ asset('assets/js/datatable/datatable-extension/buttons.print.min.js') }}"></script>

    <script>
        $(document).ready(function() {
            const config = {
                dom: 'Bfrtip',
                buttons: ['copy', 'csv', 'excel', 'pdf', 'print'],
                pageLength: 10,
                ordering: true,
                responsive: true
            };

            const dailyTable = $('#daily-table').DataTable(config);
            const weeklyTable = $('#weekly-table').DataTable(config);
            const monthlyTable = $('#monthly-table').DataTable(config);

            $('a[data-bs-toggle="tab"]').on('shown.bs.tab', function(e) {
                const targetId = $(e.target).attr('href').substring(1);
                if (targetId === 'daily') dailyTable.columns.adjust().draw();
                if (targetId === 'weekly') weeklyTable.columns.adjust().draw();
                if (targetId === 'monthly') monthlyTable.columns.adjust().draw();
            });
        });
    </script>
@endsection
