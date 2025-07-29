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

                                            <!-- Custom Category Dropdown -->
                                            <div class="dropdown-container">
                                                <div class="dropdown-input" id="category_dropdown_input">
                                                    <span class="dropdown-placeholder">Select Categories</span>
                                                    <i class="fas fa-chevron-down dropdown-arrow" id="category_arrow"></i>
                                                </div>
                                                <div class="dropdown-menu-custom" id="category_dropdown_menu">
                                                    @foreach ($categories as $category)
                                                        <div class="dropdown-item-custom" data-value="{{ $category->id }}" data-text="{{ $category->name }}">
                                                            {{ $category->name }}
                                                        </div>
                                                    @endforeach
                                                </div>
                                            </div>

                                            <!-- Selected Categories Display -->
                                            <div id="selected_categories" class="tag-container mt-2"></div>

                                            <!-- Hidden inputs for form submission -->
                                            <div id="hidden_category_inputs"></div>
                                        </div>

                                        <div class="detail-item mb-3 border-bottom pb-2">
                                            <h6 class="text-primary mb-1"><i class="fas fa-tag me-2"></i>Sub Category</h6>

                                            <!-- Custom Subcategory Dropdown -->
                                            <div class="dropdown-container">
                                                <div class="dropdown-input" id="subcategory_dropdown_input">
                                                    <span class="dropdown-placeholder">Select Subcategories</span>
                                                    <i class="fas fa-chevron-down dropdown-arrow" id="subcategory_arrow"></i>
                                                </div>
                                                <div class="dropdown-menu-custom" id="subcategory_dropdown_menu">
                                                    @foreach ($sub_categories as $sub_category)
                                                        <div class="dropdown-item-custom" data-value="{{ $sub_category->id }}" data-text="{{ $sub_category->name }}" data-category="{{ $sub_category->category_id }}">
                                                            {{ $sub_category->name }}
                                                        </div>
                                                    @endforeach
                                                </div>
                                            </div>

                                            <!-- Selected Subcategories Display -->
                                            <div id="selected_subcategories" class="tag-container mt-2"></div>

                                            <!-- Hidden inputs for form submission -->
                                            <div id="hidden_subcategory_inputs"></div>
                                        </div>

                                        <div class="detail-item mb-3 border-bottom pb-2">
                                            <h6 class="text-primary mb-1"><i class="fas fa-building me-2"></i>Employer</h6>
                                            <input type="text" name="employer" class="form-control"
                                                value="{{ old('employer', $job->employer->company_name ?? 'N/A') }}"
                                                disabled>
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
                                            <input type="text" name="salary_range" class="form-control"
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
                                                        ({{ $package->duration->duration }} days)
                                                        - Rs.
                                                        {{ $package->lkr_price }}/{{ $package->usd_price }} USD
                                                    </option>
                                                @endforeach
                                            </select>
                                        </div>
                                        <div class="detail-item mb-3 border-bottom pb-2">
                                            <h6 class="text-primary mb-1"><i
                                                    class="fas fa-map-marker-alt me-2"></i>Payment
                                                Price
                                            </h6>
                                            <input type="text" name="package_price" class="form-control"
                                                value="{{ old('package_price', $job->package_price) }}">
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

                            <div class="mb-4" id="email-template-container" style="display: none;">
                                <label for="email_template_id" class="form-label text-secondary">Select Email
                                    Template:</label>
                                <select name="email_template_id" class="form-select form-select-lg shadow-sm"
                                    id="email_template_id">
                                    <option value="">-- Select Template --</option>
                                    @foreach ($emailTemplates as $template)
                                        <option value="{{ $template->id }}">{{ $template->subject }}</option>
                                    @endforeach
                                </select>
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

        .tag-container .badge {
            font-size: 0.85rem;
            padding: 6px 10px;
            border-radius: 12px;
        }

        /* Custom Dropdown Styles */
        .dropdown-container {
            position: relative;
            margin-bottom: 0.5rem;
        }

        .dropdown-input {
            border: 1px solid #ced4da;
            border-radius: 0.375rem;
            padding: 0.5rem 2.5rem 0.5rem 0.75rem;
            background-color: white;
            cursor: pointer;
            min-height: 38px;
            display: flex;
            align-items: center;
            justify-content: space-between;
            transition: all 0.2s ease;
        }

        .dropdown-input:hover {
            border-color: #86b7fe;
        }

        .dropdown-input.active {
            border-color: #86b7fe;
            box-shadow: 0 0 0 0.25rem rgba(13, 110, 253, 0.25);
        }

        .dropdown-arrow {
            position: relative;
            left:1rem;
            transition: transform 0.2s ease;
            color: #6c757d;
        }

        .dropdown-arrow.rotated {
            transform: rotate(180deg);
        }

        .dropdown-menu-custom {
            position: absolute;
            top: 100%;
            left: 0;
            right: 0;
            background: white;
            border: 1px solid #ced4da;
            border-radius: 0.375rem;
            box-shadow: 0 0.5rem 1rem rgba(0, 0, 0, 0.15);
            max-height: 200px;
            overflow-y: auto;
            z-index: 1000;
            display: none;
        }

        .dropdown-menu-custom.show {
            display: block;
        }

        .dropdown-item-custom {
            padding: 0.5rem 0.75rem;
            cursor: pointer;
            border-bottom: 1px solid #f8f9fa;
            transition: background-color 0.2s ease;
        }

        .dropdown-item-custom:hover {
            background-color: #f8f9fa;
        }

        .dropdown-item-custom:last-child {
            border-bottom: none;
        }

        .dropdown-item-custom.selected {
            background-color: #e3f2fd;
            color: #1976d2;
        }

        .tag-container .badge {
            position: relative;
            margin-right: 0.25rem;
            margin-bottom: 0.25rem;
            padding-right: 2rem;
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
        }

        .tag-remove {
            position: absolute;
            top: 50%;
            right: 0.3rem;
            transform: translateY(-50%);
            cursor: pointer;
            font-size: 0.7rem;
            opacity: 0.8;
            z-index: 1001;
            background: transparent;
            border: none;
            color: white;
            width: 14px;
            height: 14px;
            display: flex;
            align-items: center;
            justify-content: center;
            border-radius: 50%;
            transition: all 0.2s ease;
        }

        .tag-remove:hover {
            opacity: 1;
            background: rgba(255, 255, 255, 0.2);
            transform: translateY(-50%) scale(1.1);
        }

        .tag-remove:active {
            transform: translateY(-50%) scale(0.95);
        }
    </style>

    <script>
        const categories = @json($categories);
        const subcategories = @json($sub_categories);

        // Initialize selected items from backend data
        const initialCategoryIds = @json($job->category_ids ?? []);
        const initialSubcategoryIds = @json($job->subcategory_ids ?? []);

        let selectedCategories = [...initialCategoryIds];
        let selectedSubcategories = [...initialSubcategoryIds];

        // Dropdown functionality
        function initializeDropdown(inputId, menuId, arrowId, selectedItems, sourceList, onSelectionChange) {
            const input = document.getElementById(inputId);
            const menu = document.getElementById(menuId);
            const arrow = document.getElementById(arrowId);

            // Toggle dropdown
            input.addEventListener('click', function(e) {
                e.stopPropagation();
                const isOpen = menu.classList.contains('show');

                // Close all other dropdowns
                document.querySelectorAll('.dropdown-menu-custom').forEach(m => m.classList.remove('show'));
                document.querySelectorAll('.dropdown-arrow').forEach(a => a.classList.remove('rotated'));
                document.querySelectorAll('.dropdown-input').forEach(i => i.classList.remove('active'));

                if (!isOpen) {
                    menu.classList.add('show');
                    arrow.classList.add('rotated');
                    input.classList.add('active');
                }
            });

            // Handle item selection
            menu.addEventListener('click', function(e) {
                if (e.target.classList.contains('dropdown-item-custom')) {
                    const value = e.target.getAttribute('data-value');
                    const text = e.target.getAttribute('data-text');

                    if (!selectedItems.includes(value)) {
                        selectedItems.push(value);
                        onSelectionChange();
                    }
                }
            });
        }

        // Render selected items with remove functionality
        function renderSelectedItems(container, hiddenContainer, selectedItems, sourceList, inputName) {
            container.innerHTML = '';
            hiddenContainer.innerHTML = '';

            selectedItems.forEach(id => {
                const item = sourceList.find(c => c.id == id);
                if (!item) return;

                // Create badge wrapper
                const badge = document.createElement('span');
                badge.className = 'badge bg-success text-white me-1 mb-1';

                // Create text content
                const textNode = document.createTextNode(item.name);
                badge.appendChild(textNode);

                // Create remove button as a simple clickable element
                const removeBtn = document.createElement('span');
                removeBtn.className = 'tag-remove';
                removeBtn.innerHTML = '&times;'; // Using HTML entity for multiplication sign
                removeBtn.setAttribute('data-id', id);
                removeBtn.setAttribute('data-type', inputName);
                removeBtn.title = 'Remove ' + item.name;

                // Add click handler with improved event handling
                removeBtn.onclick = function(event) {
                    event.preventDefault();
                    event.stopPropagation();

                    const idToRemove = this.getAttribute('data-id');
                    const dataType = this.getAttribute('data-type');

                    console.log('Attempting to remove:', idToRemove, 'Type:', dataType);

                    // Find and remove the item
                    const index = selectedItems.findIndex(item => item.toString() === idToRemove.toString());
                    if (index !== -1) {
                        selectedItems.splice(index, 1);
                        console.log('Item removed. Remaining items:', selectedItems);

                        // Trigger appropriate refresh
                        if (dataType === 'category_id') {
                            handleCategoryChange();
                        } else {
                            handleSubcategoryChange();
                        }
                    } else {
                        console.log('Item not found in array:', selectedItems);
                    }
                };

                badge.appendChild(removeBtn);
                container.appendChild(badge);

                // Create hidden input for form submission
                const hiddenInput = document.createElement('input');
                hiddenInput.type = 'hidden';
                hiddenInput.name = inputName + '[]';
                hiddenInput.value = id;
                hiddenContainer.appendChild(hiddenInput);
            });
        }

        // Filter and display subcategories based on selected categories
        function filterSubcategories() {
            const subcategoryMenu = document.getElementById('subcategory_dropdown_menu');
            const items = subcategoryMenu.querySelectorAll('.dropdown-item-custom');

            items.forEach(item => {
                const categoryId = item.getAttribute('data-category');
                if (selectedCategories.length === 0 || selectedCategories.includes(categoryId)) {
                    item.style.display = 'block';
                } else {
                    item.style.display = 'none';
                    // Remove from selection if no longer visible
                    const value = item.getAttribute('data-value');
                    const index = selectedSubcategories.indexOf(value);
                    if (index > -1) {
                        selectedSubcategories.splice(index, 1);
                    }
                }
            });
        }

        function handleCategoryChange() {
            renderSelectedItems(
                document.getElementById('selected_categories'),
                document.getElementById('hidden_category_inputs'),
                selectedCategories,
                categories,
                'category_id'
            );
            filterSubcategories();
            handleSubcategoryChange();
        }

        function handleSubcategoryChange() {
            renderSelectedItems(
                document.getElementById('selected_subcategories'),
                document.getElementById('hidden_subcategory_inputs'),
                selectedSubcategories,
                subcategories,
                'subcategory_id'
            );
        }

        // Initialize dropdowns
        initializeDropdown(
            'category_dropdown_input',
            'category_dropdown_menu',
            'category_arrow',
            selectedCategories,
            categories,
            handleCategoryChange
        );

        initializeDropdown(
            'subcategory_dropdown_input',
            'subcategory_dropdown_menu',
            'subcategory_arrow',
            selectedSubcategories,
            subcategories,
            handleSubcategoryChange
        );

        // Close dropdowns when clicking outside
        document.addEventListener('click', function() {
            document.querySelectorAll('.dropdown-menu-custom').forEach(menu => menu.classList.remove('show'));
            document.querySelectorAll('.dropdown-arrow').forEach(arrow => arrow.classList.remove('rotated'));
            document.querySelectorAll('.dropdown-input').forEach(input => input.classList.remove('active'));
        });

        // Initial rendering
        handleCategoryChange();

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
            let rejectionBox = document.getElementById('rejection-reason-container');
            let templateBox = document.getElementById('email-template-container');
            if (this.value === 'reject') {
                rejectionBox.style.display = 'block';
                templateBox.style.display = 'none';
            } else if (this.value === 'approved') {
                templateBox.style.display = 'block';
                rejectionBox.style.display = 'none';
            } else {
                rejectionBox.style.display = 'none';
                templateBox.style.display = 'none';
            }
        });

        // Trigger change on page load
        document.getElementById('status').dispatchEvent(new Event('change'));
    </script>
@endsection
