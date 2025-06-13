@extends('layouts.employer.master')

@section('title', 'Job')

@section('css')
    <style>
        .custom-select-wrapper {
            position: relative;
        }

        .custom-select-dropdown {
            display: none;
            position: absolute;
            top: 100%;
            left: 0;
            right: 0;
            z-index: 1000;
            max-height: 280px;
            overflow-y: auto;
            background: #fff;
            border: 1px solid #ced4da;
            border-radius: 4px;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.15);
            margin-top: 5px;
        }

        .custom-select-option {
            padding: 8px 15px;
            cursor: pointer;
            transition: all 0.2s ease;
        }

        .custom-select-option:hover,
        .custom-select-option.highlighted {
            background-color: #f8f9fa;
        }

        .custom-select-option.selected {
            background-color: #e9ecef;
        }

        .custom-select-dropdown::-webkit-scrollbar {
            width: 6px;
        }

        .custom-select-dropdown::-webkit-scrollbar-track {
            background: #f1f1f1;
            border-radius: 4px;
        }

        .custom-select-dropdown::-webkit-scrollbar-thumb {
            background: #c1c1c1;
            border-radius: 4px;
        }

        .custom-select-dropdown::-webkit-scrollbar-thumb:hover {
            background: #a8a8a8;
        }

        .custom-select-dropdown.show {
            display: block;
        }

        .contact-item {
            border: 1px solid #dee2e6;
            padding: 15px;
            margin-bottom: 15px;
            border-radius: 4px;
        }

        .remove-contact {
            float: right;
            color: red;
            cursor: pointer;
        }

        .tag-container {
            display: flex;
            flex-wrap: wrap;
            gap: 5px;
            margin-top: 5px;
        }

        .tag {
            background-color: #0d6efd;
            color: white;
            padding: 5px 10px;
            border-radius: 20px;
            display: flex;
            align-items: center;
            font-size: 0.875rem;
        }

        .tag .remove {
            margin-left: 8px;
            cursor: pointer;
            font-weight: bold;
        }
    </style>
@endsection

@section('style')
    <link rel="stylesheet" type="text/css" href="{{ asset('assets/css/vendors/animate.css') }}">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Your custom scripts should come after -->
@endsection

@section('breadcrumb-title')
    <h3>Jobs</h3>
@endsection

@section('breadcrumb-items')
    <li class="breadcrumb-item">Dashboard</li>
    <li class="breadcrumb-item active">Create Job</li>
@endsection

@section('content')
    <div class="container">
        {{-- Success Message --}}
        @if (session('success'))
            <div class="alert alert-success alert-dismissible fade show" role="alert">
                {{ session('success') }}
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
        @endif

        {{-- Error Messages --}}
        @if ($errors->any())
            <div class="alert alert-danger alert-dismissible fade show" role="alert">
                <ul class="mb-0">
                    @foreach ($errors->all() as $error)
                        <li>{{ $error }}</li>
                    @endforeach
                </ul>
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
        @endif

        {{-- Form specific error (if needed) --}}
        @error('job_postings')
            <div class="alert alert-danger alert-dismissible fade show" role="alert">
                {{ $message }}
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
        @enderror

        <style>
            .tag-container {
                display: flex;
                flex-wrap: wrap;
                gap: 8px;
                margin-top: 8px;
            }

            .tag {
                background-color: #395a7e;
                color: white;
                padding: 4px 8px;
                border-radius: 16px;
                font-size: 12px;
                display: inline-flex;
                align-items: center;
                gap: 4px;
            }

            .tag .remove-tag {
                cursor: pointer;
                font-weight: bold;
                padding: 0 4px;
                border-radius: 50%;
                background-color: rgba(255, 255, 255, 0.3);
            }

            .tag .remove-tag:hover {
                background-color: rgba(255, 255, 255, 0.5);
            }

            .remove-contact {
                position: absolute;
                top: 10px;
                right: 15px;
                cursor: pointer;
                font-size: 24px;
                color: #dc3545;
                font-weight: bold;
                z-index: 10;
            }

            .contact-item {
                position: relative;
                border: 1px solid #dee2e6;
                border-radius: 8px;
                padding: 20px;
                margin-bottom: 20px;
                background-color: #f8f9fa;
            }
        </style>

        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-header">
                        <h5>Create Job Posting</h5>
                    </div>
                    <div class="card-body">

                        <form action="{{ route('employer.job_postings.job.store') }}" method="POST"
                            enctype="multipart/form-data" id="jobPostingForm">
                            @csrf
                            <div id="contacts-container">

                                <div id="contacts-container">
                                    <!-- Currency Selection -->
                                    <div class="mb-3">
                                        <label for="lkr_usd" class="form-label">Currency Type</label>
                                        <select name="lkr_usd" id="lkr_usd" class="form-control" required>
                                            <option value="">Select a Currency</option>
                                            <option value="Local">Local(LKR)</option>
                                            <option value="Foreign">Foreign(USD)</option>
                                        </select>
                                    </div>
                                    <!-- Package Selection -->
                                    <div class="mb-3">
                                        <label for="package_id" class="form-label">Package *</label>
                                        <select name="package_id" id="package_id" class="form-control" required>
                                            <option value="">Select a package</option>
                                            @foreach ($packages as $package)
                                                <option value="{{ $package->id }}" data-lkr="{{ $package->lkr_price }}"
                                                    data-usd="{{ $package->usd_price }}"
                                                    data-size="{{ $package->package_size }}"
                                                    data-duration="{{ $package->duration->duration }}">
                                                    {{ $package->package_size }} ads - ({{ $package->duration->duration }}
                                                    days)
                                                    - Rs. {{ $package->lkr_price }} / {{ $package->usd_price }} USD
                                                </option>
                                            @endforeach

                                        </select>
                                    </div>

                                    <!-- Example Job Posting (repeatable block) -->
                                    @foreach ($jobPostings as $index => $job)
                                        <div class="job-posting">
                                            <!-- Custom Price Field -->
                                            <div class="mb-3">
                                                <label for="custom_price_{{ $index }}" class="form-label">Package
                                                    Price</label>
                                                <input type="number" step="0.01"
                                                    name="job_postings[{{ $index }}][custom_price]"
                                                    id="custom_price_{{ $index }}" class="form-control"
                                                    placeholder="Enter price or leave blank for default">
                                            </div>
                                        </div>
                                    @endforeach
                                </div>


                                <div class="mb-3">
                                    <label for="title_0" class="form-label">Job Title *</label>
                                    <input type="text" name="job_postings[0][title]" id="title_0" class="form-control"
                                        required>
                                </div>

                                <div class="mb-3">
                                    <label for="description_0" class="form-label">Description</label>
                                    <textarea name="job_postings[0][description]" id="description_0" class="form-control" rows="4"></textarea>
                                </div>

                                <!-- Categories -->
                                <div class="mb-3">
                                    <label for="category_id_0" class="form-label">Categories *</label>
                                    <select id="category_id_0" class="form-control"
                                        onchange="handleCategorySelect(this, 0)">
                                        <option value="">Select a category</option>
                                        @foreach ($categories as $category)
                                            <option value="{{ $category->id }}">{{ $category->name }}</option>
                                        @endforeach
                                    </select>
                                    <div id="selected_categories_0" class="tag-container mt-2"></div>
                                    <div id="hidden_category_inputs_0"></div>
                                </div>

                                <!-- Subcategories -->
                                <div class="mb-3">
                                    <label for="subcategory_id_0" class="form-label">Subcategories *</label>
                                    <select id="subcategory_id_0" class="form-control"
                                        onchange="handleSubcategorySelect(this, 0)" disabled>
                                        <option value="">Select subcategory</option>
                                        {{-- Options will be loaded dynamically --}}
                                    </select>
                                    <div id="selected_subcategories_0" class="tag-container mt-2"></div>
                                    <div id="hidden_subcategory_inputs_0"></div>
                                </div>

                                <div class="mb-3">
                                    <label for="location_0" class="form-label">Location *</label>
                                    <input type="text" name="job_postings[0][location]" id="location_0"
                                        class="form-control" required>
                                </div>
                                <div class="mb-3">
                                    <label for="country_0" class="form-label">Country *</label>
                                    <select name="job_postings[0][country_id]" id="country_0" class="form-control"
                                        required>
                                        <option value="">Select a country</option>
                                        @foreach ($countries as $country)
                                            <option value="{{ $country->id }}">{{ $country->name }}</option>
                                        @endforeach
                                    </select>
                                </div>

                                <div class="mb-3">
                                    <label for="salary_range_0" class="form-label">Salary Range</label>
                                    <input type="text" name="job_postings[0][salary_range]" id="salary_range_0"
                                        class="form-control">
                                </div>

                                <div class="mb-3">
                                    <label for="image_0" class="form-label">Image</label>
                                    <input type="file" name="job_postings[0][image]" id="image_0"
                                        class="form-control image-input" accept="image/*">
                                    <div class="image-preview-container mt-3">
                                        <img class="image-preview" src="" alt="Image Preview"
                                            style="max-width: 100%; display: none;">
                                    </div>
                                </div>

                                <div class="mb-3">
                                    <label for="requirements_0" class="form-label">Requirements</label>
                                    <textarea name="job_postings[0][requirements]" id="requirements_0" class="form-control" rows="4"></textarea>
                                </div>

                                <div class="mb-3 col-md-3">
                                    <label for="closing_date_0" class="form-label">Closing Date *</label>
                                    <input type="date" name="job_postings[0][closing_date]" id="closing_date_0"
                                        class="form-control" required>
                                </div>

                                <input type="hidden" name="job_postings[0][status]" value="pending">

                            </div>

                            <button type="button" id="addContact" class="btn btn-success">Add Another Job</button>
                            <button type="submit" class="btn btn-primary">Create Jobs</button>

                            <div class="modal fade" id="paymentModal" tabindex="-1" aria-labelledby="paymentModalLabel"
                                aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="paymentModalLabel">Select Payment Method</h5>
                                            <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                aria-label="Close"></button>
                                        </div>
                                        <div class="modal-body">
                                            <div class="payment-methods">
                                                <div class="form-check mb-3">
                                                    <input class="form-check-input" type="radio" name="paymentMethod"
                                                        id="onlinePayment" value="online">
                                                    <label class="form-check-label" for="onlinePayment">
                                                        Online Payment
                                                    </label>
                                                </div>
                                                <div class="form-check mb-3">
                                                    <input class="form-check-input" type="radio" name="paymentMethod"
                                                        id="contactAdmin" value="admin">
                                                    <label class="form-check-label" for="contactAdmin">
                                                        Contact Admin
                                                    </label>
                                                </div>
                                            </div>

                                            <div id="adminContactInfo" style="display: none;">
                                                <div class="alert alert-info">
                                                    <h6>Your Job ID: <span id="jobIdDisplay"></span></h6>
                                                    <hr>
                                                    <h6>Admin Contact Details:</h6>
                                                    <p>Phone: +94 XX XXX XXXX</p>
                                                    <p>Email: admin@example.com</p>
                                                    <p>Please quote your Job ID when contacting the admin.</p>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary"
                                                data-bs-dismiss="modal">Close</button>
                                            <button type="button" class="btn btn-primary"
                                                id="confirmPayment">Confirm</button>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </form>
                        <div class="modal fade" id="paymentMethodModal" tabindex="-1"
                            aria-labelledby="paymentMethodModalLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="paymentMethodModalLabel">Select Payment Method</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal"
                                            aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        <div class="form-check mb-3">
                                            <input class="form-check-input" type="radio" name="paymentMethod"
                                                id="contactContributor" value="contact_contributor">
                                            <label class="form-check-label" for="contactContributor">
                                                Contact Contributor
                                            </label>
                                        </div>
                                        <div class="form-check">
                                            <input class="form-check-input" type="radio" name="paymentMethod"
                                                id="onlinePayment" value="online">
                                            <label class="form-check-label" for="onlinePayment">
                                                Online Payment
                                            </label>
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary"
                                            data-bs-dismiss="modal">Close</button>
                                        <button type="button" class="btn btn-primary"
                                            id="confirmPaymentMethod">Confirm</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const currencySelect = document.getElementById('lkr_usd');
            const packageSelect = document.getElementById('package_id');
            const priceInputs = document.querySelectorAll('[id^="custom_price_"]');

            priceInputs.forEach(input => {
                input.dataset.userEdited = 'false';

                input.addEventListener('input', async () => {
                    input.dataset.userEdited = 'true';

                    const usd = parseFloat(input.value);
                    if (currencySelect.value === 'Foreign' && !isNaN(usd)) {
                        try {
                            const response = await fetch(`/convert-usd-to-lkr?usd=${usd}`);
                            const data = await response.json();
                            if (data.success) {
                                input.setAttribute('data-lkr-price', data
                                .lkr);
                                console.log(
                                    `Converted ${usd} USD → ${data.lkr} LKR @ rate ${data.rate}`
                                    );
                            }
                        } catch (e) {
                            console.error('Conversion failed', e);
                        }
                    }
                });
            });

            function updatePrices() {
                const currency = currencySelect.value;

                Array.from(packageSelect.options).forEach(option => {
                    const size = option.getAttribute('data-size');
                    const duration = option.getAttribute('data-duration');
                    const lkr = option.getAttribute('data-lkr');
                    const usd = option.getAttribute('data-usd');

                    if (size && duration) {
                        option.textContent =
                            currency === 'Local' ?
                            `${size} ads - (${duration} days) - Rs. ${lkr}` :
                            `${size} ads - (${duration} days) - $${usd} USD`;
                    }
                });

                const selectedOption = packageSelect.options[packageSelect.selectedIndex];
                if (!selectedOption) return;

                const price = currency === 'Local' ?
                    selectedOption.getAttribute('data-lkr') :
                    selectedOption.getAttribute('data-usd');

                priceInputs.forEach(input => {
                    if (!input.value || input.dataset.userEdited === 'false') {
                        input.value = price;
                        input.dataset.userEdited = 'false';
                    }
                });
            }


            currencySelect.addEventListener('change', updatePrices);
            packageSelect.addEventListener('change', updatePrices);
        });
        const selectedCategories = new Map();
        const selectedSubcategories = new Map();


        function handleCategorySelect(select) {
            const value = select.value;
            const text = select.options[select.selectedIndex].text;

            if (value && !selectedCategories.has(value)) {
                selectedCategories.set(value, text);

                // Show tag
                const tag = document.createElement('div');
                tag.className = 'tag';
                tag.dataset.id = value;
                tag.innerHTML = `${text} <span class="remove" onclick="removeCategory('${value}')">&times;</span>`;
                document.getElementById('selected_categories_0').appendChild(tag);

                // Add hidden input
                const input = document.createElement('input');
                input.type = 'hidden';
                input.name = 'job_postings[0][category_ids][]';
                input.value = value;
                input.id = `category_input_${value}`;
                document.getElementById('hidden_category_inputs_0').appendChild(input);

                // Enable subcategory dropdown
                const subcategorySelect = document.getElementById('subcategory_id_0');
                subcategorySelect.disabled = false;
                subcategorySelect.innerHTML = `<option value="">Select subcategory</option>`;

                // Simulate fetching subcategories
                loadSubcategories(value);

                // select.value = '';
            }
        }

        function loadSubcategories(categoryId) {
            const subcategorySelect = document.getElementById('subcategory_id_0');
            subcategorySelect.innerHTML = '<option value="">Loading...</option>';
            subcategorySelect.disabled = true;

            fetch(`/subcategories/${categoryId}`)
                .then(response => response.json())
                .then(data => {
                    subcategorySelect.innerHTML = '<option value="">Select subcategory</option>';
                    data.forEach(sub => {
                        const option = document.createElement('option');
                        option.value = sub.id;
                        option.text = sub.name;
                        option.dataset.categoryId = categoryId;
                        subcategorySelect.appendChild(option);
                    });
                    subcategorySelect.disabled = false;
                })
                .catch(error => {
                    console.error("Error loading subcategories:", error);
                    subcategorySelect.innerHTML = '<option value="">Failed to load subcategories</option>';
                });
        }


        function handleSubcategorySelect(select) {
            const value = select.value;
            const text = select.options[select.selectedIndex].text;
            const categoryId = select.options[select.selectedIndex].dataset.categoryId;

            if (value && !selectedSubcategories.has(value)) {
                selectedSubcategories.set(value, {
                    name: text,
                    category_id: categoryId
                });

                // Add subcategory tag
                const tag = document.createElement('div');
                tag.className = 'tag';
                tag.dataset.id = value;
                tag.innerHTML = `${text} <span class="remove" onclick="removeSubcategory('${value}')">&times;</span>`;
                document.getElementById('selected_subcategories_0').appendChild(tag);

                // Add hidden input
                const input = document.createElement('input');
                input.type = 'hidden';
                input.name = 'job_postings[0][subcategory_ids][]';
                input.value = value;
                input.id = `subcategory_input_${value}`;
                document.getElementById('hidden_subcategory_inputs_0').appendChild(input);

                // select.value = '';
            }
        }

        function removeCategory(id) {
            const hasSubcategory = [...selectedSubcategories.values()].some(s => s.category_id === id);
            if (hasSubcategory) {
                alert("Remove related subcategories first.");
                return;
            }

            selectedCategories.delete(id);
            document.querySelector(`.tag[data-id='${id}']`)?.remove();
            document.getElementById(`category_input_${id}`)?.remove();

            // Disable subcategory select if no categories are left
            if (selectedCategories.size === 0) {
                document.getElementById('subcategory_id_0').disabled = true;
                document.getElementById('subcategory_id_0').innerHTML = '<option value="">Select subcategory</option>';
            }
        }

        function removeSubcategory(id) {
            selectedSubcategories.delete(id);
            document.querySelector(`#selected_subcategories_0 .tag[data-id='${id}']`)?.remove();
            document.getElementById(`subcategory_input_${id}`)?.remove();
        }





        document.addEventListener("DOMContentLoaded", function() {
            let contactIndex = 1;
            let maxJobs = 0;

            const packageSelect = document.getElementById("package_id");
            const addJobButton = document.getElementById("addContact");
            const contactsContainer = document.getElementById("contacts-container");

            setupCategoryListener(document.querySelector('.category-select'));
            // Handle package selection change
            packageSelect.addEventListener("change", function() {
                const selectedOption = packageSelect.options[packageSelect.selectedIndex];
                if (selectedOption.value) {
                    maxJobs = parseInt(selectedOption.getAttribute("data-max-jobs"), 10);
                } else {
                    maxJobs = 0;
                }
                validateJobLimit();
            });
            // Add new job form
            addJobButton.addEventListener("click", function() {
                if (contactsContainer.children.length - 1 >= maxJobs) {
                    alert(`You cannot add more than ${maxJobs} jobs for this package.`);
                    return;
                }

                const container = document.getElementById('contacts-container');
                const newContact = document.createElement('div');
                newContact.className = 'contact-item';

                newContact.innerHTML = `
                <span class="remove-contact" onclick="removeContactItem(this)">&times;</span>

                <div class="mb-3 mt-3">
                    <label for="title_${contactIndex}" class="form-label">Job Title *</label>
                    <input type="text" name="job_postings[${contactIndex}][title]" id="title_${contactIndex}" class="form-control" required>
                </div>

                <div class="mb-3">
                    <label for="description_${contactIndex}" class="form-label">Description</label>
                    <textarea name="job_postings[${contactIndex}][description]" id="description_${contactIndex}" class="form-control" rows="4" ></textarea>
                </div>

                <div class="mb-3">
                    <label for="category_id_${contactIndex}" class="form-label">Categories *</label>
                    <select id="category_id_${contactIndex}" class="form-control" onchange="handleCategorySelect(this, ${contactIndex})">
                        <option value="">Select a category</option>
                        @foreach ($categories as $category)
                            <option value="{{ $category->id }}">{{ $category->name }}</option>
                        @endforeach
                    </select>
                    <div id="selected_categories_${contactIndex}" class="tag-container mt-2"></div>
                    <div id="hidden_category_inputs_${contactIndex}"></div>
                </div>

                <div class="mb-3">
                    <label for="subcategory_id_${contactIndex}" class="form-label">Subcategories *</label>
                    <select id="subcategory_id_${contactIndex}" class="form-control" onchange="handleSubcategorySelect(this, ${contactIndex})" disabled>
                        <option value="">Select subcategory</option>
                    </select>
                    <div id="selected_subcategories_${contactIndex}" class="tag-container mt-2"></div>
                    <div id="hidden_subcategory_inputs_${contactIndex}"></div>
                </div>

                <div class="mb-3">
                    <label for="location_${contactIndex}" class="form-label">Location *</label>
                    <input type="text" name="job_postings[${contactIndex}][location]" id="location_${contactIndex}" class="form-control" required>
                </div>

                <div class="mb-3">
                    <label for="country_${contactIndex}" class="form-label">Country *</label>
                    <select name="job_postings[${contactIndex}][country_id]" id="country_${contactIndex}" class="form-control" required>
                        <option value="">Select a country</option>
                        @foreach ($countries as $country)
                            <option value="{{ $country->id }}">{{ $country->name }}</option>
                        @endforeach
                    </select>
                </div>

                <div class="mb-3">
                    <label for="salary_range_${contactIndex}" class="form-label">Salary Range</label>
                    <input type="text" name="job_postings[${contactIndex}][salary_range]" id="salary_range_${contactIndex}" class="form-control">
                </div>

                <div class="mb-3">
                    <label for="image_${contactIndex}" class="form-label">Image</label>
                    <input type="file" name="job_postings[${contactIndex}][image]" id="image_${contactIndex}" class="form-control image-input" accept="image/*">
                    <div class="image-preview-container mt-3">
                        <img class="image-preview" src="" alt="Image Preview" style="max-width: 100%; display: none;">
                    </div>
                </div>

                <div class="mb-3">
                    <label for="requirements_${contactIndex}" class="form-label">Requirements</label>
                    <textarea name="job_postings[${contactIndex}][requirements]" id="requirements_${contactIndex}" class="form-control" rows="4"></textarea>
                </div>

                <div class="mb-3 col-md-3">
                    <label for="closing_date_${contactIndex}" class="form-label">Closing Date *</label>
                    <input type="date" name="job_postings[${contactIndex}][closing_date]" id="closing_date_${contactIndex}" class="form-control" required>
                </div>

                <input type="hidden" name="job_postings[${contactIndex}][status]" value="pending">
            `;

                container.appendChild(newContact);
                setupImagePreview(newContact.querySelector('.image-input'));

                contactIndex++;
                validateJobLimit();
            });

            // Remove contact form
            document.getElementById('contacts-container').addEventListener('click', function(e) {
                if (e.target.classList.contains('remove-contact')) {
                    e.target.closest('.contact-item').remove();
                    validateJobLimit();
                }
            });

            // Validate job limit based on selected package
            function validateJobLimit() {
                const currentJobs = contactsContainer.children.length;
                if (currentJobs >= maxJobs) {
                    addJobButton.disabled = true;
                    //alert(`You have reached the maximum job limit (${maxJobs}) for this package.`);
                } else {
                    addJobButton.disabled = false;
                }
            }

            function setupCategoryListener(categorySelect) {
                $(categorySelect).on('change', function() {
                    const categoryId = $(this).val();
                    const contactItem = $(this).closest('.contact-item');
                    const subcategorySelect = contactItem.find('select[id^="subcategory_id_"]');

                    // Clear existing options
                    subcategorySelect.html('<option value="">Select a subcategory</option>');

                    if (categoryId) {
                        $.ajax({
                            url: `/subcategories/${categoryId}`,
                            method: 'GET',
                            dataType: 'json',
                            success: function(data) {
                                $.each(data, function(index, subcategory) {
                                    subcategorySelect.append(
                                        $('<option>', {
                                            value: subcategory.id,
                                            text: subcategory.name
                                        })
                                    );
                                });
                            },
                            error: function(error) {
                                console.error('Error fetching subcategories:', error);
                            }
                        });
                    }
                });
            }

            // Setup image preview
            function setupImagePreview(input) {
                input.addEventListener('change', function(event) {
                    const preview = this.nextElementSibling.querySelector('.image-preview');
                    const file = event.target.files[0];

                    if (file) {
                        const reader = new FileReader();
                        reader.onload = function(e) {
                            preview.src = e.target.result;
                            preview.style.display = 'block';
                        };
                        reader.readAsDataURL(file);
                    } else {
                        preview.style.display = 'none';
                    }
                });
            }

            // Setup initial image preview
            document.querySelectorAll('.image-input').forEach(setupImagePreview);
        });
    </script>




    <script>
        document.addEventListener("DOMContentLoaded", function() {
            const form = document.getElementById('jobPostingForm');
            const paymentModal = new bootstrap.Modal(document.getElementById('paymentMethodModal'));

            form.addEventListener('submit', function(e) {
                e.preventDefault();

                // Basic form validation
                if (!validateForm()) {
                    return;
                }

                paymentModal.show();
            });

            document.getElementById('confirmPaymentMethod').addEventListener('click', function() {
                const selectedPaymentMethodRadio = document.querySelector(
                    'input[name="paymentMethod"]:checked');

                if (!selectedPaymentMethodRadio) {
                    alert('Please select a payment method');
                    return;
                }

                const selectedPaymentMethod = selectedPaymentMethodRadio.value;

                // Avoid duplicate input
                let existingInput = document.querySelector('input[name="payment_method"]');
                if (!existingInput) {
                    const mainPaymentMethodInput = document.createElement('input');
                    mainPaymentMethodInput.type = 'hidden';
                    mainPaymentMethodInput.name = 'payment_method';
                    mainPaymentMethodInput.value = selectedPaymentMethod;
                    form.appendChild(mainPaymentMethodInput);
                } else {
                    existingInput.value = selectedPaymentMethod;
                }

                if (selectedPaymentMethod === 'contact_contributor') {
                    paymentModal.hide();
                    form.submit();
                } else if (selectedPaymentMethod === 'online') {
                    const formData = new FormData(form);

                    fetch('/store-form-data', {
                            method: 'POST',
                            body: formData,
                            headers: {
                                'X-CSRF-TOKEN': document.querySelector('meta[name="csrf-token"]')
                                    .content
                            }
                        })
                        .then(response => response.json())
                        .then(data => {
                            if (data.success) {
                                window.location.href = '/payment/checkout';
                            } else {
                                alert(data.message || 'Error processing form data');
                            }
                        })
                        .catch(error => {
                            console.error('Error:', error);
                            alert('An error occurred. Please try again.');
                        });
                }
            });


            // Form validation function
            function validateForm() {
                let isValid = true;
                const requiredFields = form.querySelectorAll('[required]');

                requiredFields.forEach(field => {
                    if (!field.value) {
                        field.classList.add('is-invalid');
                        isValid = false;
                    } else {
                        field.classList.remove('is-invalid');
                    }
                });

                if (!isValid) {
                    alert('Please fill in all required fields');
                }

                return isValid;
            }
        });
    </script>
@endsection
@section('script')
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
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
