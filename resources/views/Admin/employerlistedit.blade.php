@extends('layouts.admin.master')

@section('title', 'Edit Employee')

@section('css')
    <!-- Add any CSS files related to the page here -->
@endsection

@section('style')
    <link rel="stylesheet" type="text/css" href="{{ asset('assets/css/vendors/animate.css') }}">
@endsection

@section('breadcrumb-title')
    <h3>Edit Employee</h3>
@endsection

@section('breadcrumb-items')
    <li class="breadcrumb-item">Dashboard</li>
    <li class="breadcrumb-item"><a href="{{ route('employer.list') }}">Employee List</a></li>
    <li class="breadcrumb-item active">Edit Employee</li>
@endsection

@section('content')
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-header">
                        <h5>Edit Employee</h5>
                    </div>
                    <div class="card-body">
                        <form action="{{ route('employer.listupdate', $employer->id) }}" method="POST" enctype="multipart/form-data">
                            @csrf
                            @method('PUT')
                            <div class="row">
                                <div class="form-group mb-3 col-md-6">
                                    <label for="company_name">Company Name:</label>
                                    <input type="text" name="company_name" id="company_name" class="form-control"
                                        value="{{ $employer->company_name }}" required>
                                </div>

                                <div class="form-group mb-3 col-md-6">
                                    <label for="email">Email:</label>
                                    <input type="email" name="email" id="email" class="form-control"
                                        value="{{ $employer->email }}" required>
                                </div>

                                <div class="form-group mb-3 col-md-6">
                                    <label for="contact_details">Contact Details:</label>
                                    <input type="text" name="contact_details" id="contact_details" class="form-control"
                                        value="{{ $employer->contact_details }}" required>
                                </div>

                                <div class="form-group mb-3 col-md-6">
                                    <label for="business_info">Business Info:</label>
                                    <input type="text" name="business_info" id="business_info" class="form-control"
                                        value="{{ $employer->business_info }}" required>
                                </div>

                                <div class="form-group mb-3 col-md-6">
                                    <label for="job_posting_settings">Job Posting Settings:</label>
                                    <input type="text" name="job_posting_settings" id="job_posting_settings"
                                        class="form-control" value="{{ $employer->job_posting_settings }}">
                                </div>

                                <div class="form-group mb-3 col-md-6">
                                    <label for="logo">Logo:</label>
                                    <input type="file" name="logo" id="logo" class="form-control">

                                    @if ($employer->logo)
                                        <div class="mt-2">
                                            <p>Current Logo:</p>
                                            <img src="{{ asset('uploads/logos/' . $employer->logo) }}" alt="Logo"
                                                height="80">
                                        </div>
                                    @endif
                                </div>

                                <div class="form-group mb-3 col-md-6">
                                    <label for="is_active">Status:</label>
                                    <select name="is_active" id="is_active" class="form-control" required>
                                        <option value="1" {{ $employer->is_active ? 'selected' : '' }}>Active</option>
                                        <option value="0" {{ !$employer->is_active ? 'selected' : '' }}>Inactive
                                        </option>
                                    </select>
                                </div>

                            </div>
                            <button type="submit" class="btn btn-primary">Update Employee</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection

@section('script')
    <script src="{{ asset('assets/js/clock.js') }}"></script>
    <script src="{{ asset('assets/js/chart/apex-chart/moment.min.js') }}"></script>
    <script src="{{ asset('assets/js/notify/bootstrap-notify.min.js') }}"></script>
    <script src="{{ asset('assets/js/dashboard/default.js') }}"></script>
    <script src="{{ asset('assets/js/notify/index.js') }}"></script>
    <script src="{{ asset('assets/js/typeahead/handlebars.js') }}"></script>
    <script src="{{ asset('assets/js/typeahead/typeahead.bundle.js') }}"></script>
    <script src="{{ asset('assets/js/typeahead/typeahead.custom.js') }}"></script>
    <script src="{{ asset('assets/js/typeahead-search/handlebars.js') }}"></script>
    <script src="{{ asset('assets/js/typeahead-search/typeahead-custom.js') }}"></script>
    <script src="{{ asset('assets/js/height-equal.js') }}"></script>
    <script src="{{ asset('assets/js/animation/wow/wow.min.js') }}"></script>
@endsection
