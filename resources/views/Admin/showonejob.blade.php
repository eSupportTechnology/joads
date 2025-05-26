@extends('layouts.admin.master')

@section('title', 'Job Details')

@section('breadcrumb-title')
    <h3 class="fade-in">Job Details</h3>
@endsection

@section('breadcrumb-items')
    <nav aria-label="breadcrumb" class="animated fadeIn">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="{{ route('dashboard') }}">Dashboard</a></li>
            <li class="breadcrumb-item"><a href="{{ route('job_postings.index') }}">Manage Job Postings</a></li>
            <li class="breadcrumb-item active">Job Details</li>
        </ol>
    </nav>
@endsection

@section('content')
    <div class="container mt-4">
        <div class="row justify-content-center">
            <div class="col-lg-10">
                <!-- Job Details Card -->
                <div class="card shadow-lg hover-shadow-lg transition-all duration-300 mb-4">
                    <div class="card-header bg-gradient-primary text-white py-3">
                        <div class="d-flex justify-content-between align-items-center">
                            <h5 class="mb-0">
                                <i class="fas fa-briefcase me-2"></i>
                                Job ID: {{ $job->job_id }}
                            </h5>
                            <span
                                class="badge bg-{{ $job->status == 'approved' ? 'success' : ($job->status == 'rejected' ? 'danger' : 'warning') }} px-3 py-2">
                                {{ ucfirst($job->status) }}
                            </span>
                        </div>
                    </div>

                    <div class="card-body">
                        <div class="row">
                            <!-- Image Section -->
                            <div class="col-md-6 mb-4">
                                <div class="position-relative overflow-hidden rounded-3 shadow-sm hover-zoom">
                                    <img src="{{ asset('storage/' . $job->image) }}" alt="Job Image"
                                        class="img-fluid w-100 transition-transform">


                                </div>
                            </div>

                            <!-- Details Section -->
                            <div class="col-md-6">
                                <div class="details-container p-3">
                                    <form action="{{ route('job_postings.update', $job->id) }}" method="POST">
                                        @csrf
                                        @method('PUT')

                                        <div class="detail-item mb-3 border-bottom pb-2">
                                            <h6 class="text-primary mb-1"><i class="fas fa-tasks me-2"></i>Title</h6>
                                            <input type="text" name="title" class="form-control"
                                                value="{{ old('title', $job->title) }}">
                                        </div>

                                        <div class="detail-item mb-3 border-bottom pb-2">
                                            <h6 class="text-primary mb-1"><i class="fas fa-tag me-2"></i>Category</h6>
                                            <select name="category_id" class="form-control">
                                                @foreach ($categories as $category)
                                                    <option value="{{ $category->id }}"
                                                        {{ $job->category_id == $category->id ? 'selected' : '' }}>
                                                        {{ $category->name }}
                                                    </option>
                                                @endforeach
                                            </select>
                                        </div>

                                        <div class="detail-item mb-3 border-bottom pb-2">
                                            <h6 class="text-primary mb-1"><i class="fas fa-tag me-2"></i>Sub Category</h6>
                                            <select name="subcategory_id" class="form-control">
                                                @foreach ($sub_categories as $sub_category)
                                                    <option value="{{ $sub_category->id }}"
                                                        {{ $job->subcategory_id == $sub_category->id ? 'selected' : '' }}>
                                                        {{ $sub_category->name }}
                                                    </option>
                                                @endforeach
                                            </select>
                                        </div>

                                        <div class="detail-item mb-3 border-bottom pb-2">
                                            <h6 class="text-primary mb-1"><i class="fas fa-building me-2"></i>Employer</h6>
                                            <input type="text" name="employer" class="form-control"
                                                value="{{ old('employer', $job->employer->company_name) }}" disabled>
                                        </div>

                                        <div class="detail-item mb-3 border-bottom pb-2">
                                            <h6 class="text-primary mb-1"><i class="fas fa-align-left me-2"></i>Description
                                            </h6>
                                            <textarea name="description" class="form-control">{{ old('description', $job->description) }}</textarea>
                                        </div>

                                        <div class="detail-item mb-3 border-bottom pb-2">
                                            <h6 class="text-primary mb-1"><i class="fas fa-map-marker-alt me-2"></i>Location
                                            </h6>
                                            <input type="text" name="location" class="form-control"
                                                value="{{ old('location', $job->location) }}">
                                        </div>

                                        <div class="detail-item mb-3 border-bottom pb-2">
                                            <h6 class="text-primary mb-1"><i class="fas fa-dollar-sign me-2"></i>Salary
                                                Range</h6>
                                            <input type="number" name="salary_range" class="form-control"
                                                value="{{ old('salary_range', $job->salary_range) }}">
                                        </div>

                                        <div class="detail-item mb-3 border-bottom pb-2">
                                            <h6 class="text-primary mb-1"><i class="fas fa-list-ul me-2"></i>Requirements
                                            </h6>
                                            <textarea name="requirements" class="form-control">{{ old('requirements', $job->requirements) }}</textarea>
                                        </div>

                                        <div class="detail-item mb-3 border-bottom pb-2">
                                            <h6 class="text-primary mb-1"><i class="fas fa-calendar-alt me-2"></i>Closing
                                                Date</h6>
                                            <input type="date" name="closing_date" class="form-control"
                                                value="{{ old('closing_date', $job->closing_date) }}">
                                        </div>

                                        <div class="detail-item mb-3">
                                            <h6 class="text-primary mb-1"><i class="fas fa-file-alt me-2"></i>Package</h6>
                                            <select name="package_id" class="form-control">
                                                @foreach ($packages as $package)
                                                    <option value="{{ $package->id }}"
                                                        {{ $job->package_id == $package->id ? 'selected' : '' }}>
                                                        {{ $package->package_size }} ads -
                                                        ({{ $package->duration->duration }} days) - Rs.
                                                        {{ $package->lkr_price }}/{{ $package->usd_price }} USD
                                                    </option>
                                                @endforeach
                                            </select>
                                        </div>

                                        <button type="submit" class="btn btn-primary mt-3">Update Job</button>
                                    </form>


                                    @if ($job->status == 'rejected')
                                        <div class="detail-item mb-3 bg-danger-subtle p-3 rounded">
                                            <h6 class="text-danger mb-1"><i
                                                    class="fas fa-exclamation-circle me-2"></i>Rejection Reason</h6>
                                            <p class="mb-0">{{ $job->rejection_reason }}</p>
                                        </div>
                                    @endif
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Status Update Card -->
                <div class="card shadow-lg hover-shadow-lg transition-all duration-300">
                    <div class="card-header bg-gradient-secondary text-white py-3">
                        <h5 class="mb-0"><i class="fas fa-edit me-2"></i>Update Job Status</h5>
                    </div>

                    <div class="card-body">
                        <form action="{{ route('job_postings.updateStatus', $job->id) }}" method="POST"
                            class="needs-validation" novalidate>
                            @csrf
                            @method('PATCH')

                            <div class="mb-4">
                                <label for="status" class="form-label text-secondary">Update Status:</label>
                                <select name="status" class="form-select form-select-lg shadow-sm" id="status"
                                    required>
                                    <option value="pending" {{ $job->status == 'pending' ? 'selected' : '' }}>Pending
                                    </option>
                                    <option value="approved" {{ $job->status == 'approved' ? 'selected' : '' }}>Approved
                                    </option>
                                    <option value="reject" {{ $job->status == 'reject' ? 'selected' : '' }}>Rejected
                                    </option>
                                </select>
                            </div>

                            <div id="rejection-reason-container" class="mb-4 fade-in" style="display: none;">
                                <label for="rejection-reason" class="form-label text-secondary">Rejection Reason:</label>
                                <textarea name="rejection_reason" class="form-control shadow-sm" id="rejection-reason" rows="4"
                                    placeholder="Please provide a detailed reason for rejection"></textarea>
                            </div>

                            <button type="submit" class="btn btn-primary btn-lg px-4 shadow-sm hover-lift">
                                <i class="fas fa-save me-2"></i>Update Status
                            </button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <style>
        .hover-shadow-lg {
            transition: box-shadow 0.3s ease-in-out;
        }

        .hover-shadow-lg:hover {
            box-shadow: 0 1rem 3rem rgba(0, 0, 0, .175) !important;
        }

        .hover-zoom img {
            transition: transform 0.3s ease-in-out;
        }

        .hover-zoom:hover img {
            transform: scale(1.05);
        }

        .hover-lift {
            transition: transform 0.2s ease-in-out;
        }

        .hover-lift:hover {
            transform: translateY(-2px);
        }

        .fade-in {
            animation: fadeIn 0.5s ease-in;
        }

        @keyframes fadeIn {
            from {
                opacity: 0;
            }

            to {
                opacity: 1;
            }
        }

        .bg-gradient-primary {
            background: linear-gradient(45deg, #007bff, #0056b3);
        }

        .bg-gradient-secondary {
            background: linear-gradient(45deg, #6c757d, #495057);
        }

        .detail-item:hover {
            background-color: rgba(0, 0, 0, .03);
            border-radius: 0.25rem;
        }
    </style>

    <script>
        // Form validation
        (function() {
            'use strict'
            var forms = document.querySelectorAll('.needs-validation')
            Array.prototype.slice.call(forms)
                .forEach(function(form) {
                    form.addEventListener('submit', function(event) {
                        if (!form.checkValidity()) {
                            event.preventDefault()
                            event.stopPropagation()
                        }
                        form.classList.add('was-validated')
                    }, false)
                })
        })()

        // Status change handler
        document.getElementById('status').addEventListener('change', function() {
            const rejectionReasonContainer = document.getElementById('rejection-reason-container');
            if (this.value === 'reject') {
                rejectionReasonContainer.style.display = 'block';
                document.getElementById('rejection-reason').setAttribute('required', '');
            } else {
                rejectionReasonContainer.style.display = 'none';
                document.getElementById('rejection-reason').removeAttribute('required');
            }
        });
    </script>
@endsection
