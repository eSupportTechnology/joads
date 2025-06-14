@extends('layouts.admin.master')

@section('title', 'Job')

@section('style')
    <style>
        form#jobPostingForm {
            max-width: 1000px;
            margin: 2rem auto;
            padding: 1.5rem;
            background: #fff;
            border-radius: 8px;
            box-shadow: 0 2px 8px rgb(0 0 0 / 0.1);
            font-family: Arial, sans-serif;
        }

        .job-posting {
            border: 1px solid #ddd;
            border-radius: 6px;
            padding: 1rem 1.25rem;
            margin-bottom: 1.5rem;
            position: relative;
        }

        .remove-job-posting {
            position: absolute;
            top: 10px;
            right: 10px;
            background: #d9534f;
            border: none;
            color: white;
            padding: 5px 10px;
            border-radius: 4px;
            cursor: pointer;
            font-size: 0.85rem;
            transition: background-color 0.2s ease;
        }
        .remove-job-posting:hover {
            background: #c9302c;
        }

        label.form-label {
            display: block;
            font-weight: 600;
            margin-bottom: 0.3rem;
            font-size: 0.9rem;
            color: #333;
        }

        input[type="text"],
        input[type="date"],
        select,
        textarea {
            width: 100%;
            padding: 8px 10px;
            border: 1px solid #bbb;
            border-radius: 5px;
            font-size: 0.95rem;
            font-family: inherit;
            box-sizing: border-box;
            transition: border-color 0.2s ease;
        }
        input[type="text"]:focus,
        input[type="date"]:focus,
        select:focus,
        textarea:focus {
            outline: none;
            border-color: #5a9bd4;
            box-shadow: 0 0 5px rgba(90, 155, 212, 0.5);
            background-color: #fff;
        }

        /* Button container for alignment */
        .button-group {
            display: flex;
            gap: 12px;
            justify-content: flex-start; /* Align left */
            margin-bottom: 1.5rem;
        }

        button#addJobPosting,
        button[type="submit"] {
            flex: 1 1 180px; /* Same width base, flexible */
            padding: 12px 0;
            font-size: 1.1rem;
            font-weight: 600;
            border-radius: 6px;
            border: none;
            cursor: pointer;
            user-select: none;
            transition: background-color 0.2s ease;
            font-family: inherit;
            text-align: center;
        }

        button#addJobPosting {
            background-color: #28a745;
            color: white;
        }
        button#addJobPosting:hover {
            background-color: #218838;
        }

        button[type="submit"] {
            background-color: #007bff;
            color: white;
        }
        button[type="submit"]:hover {
            background-color: #0069d9;
        }

        .image-preview-container {
            margin-top: 8px;
            border: 1px solid #ccc;
            border-radius: 5px;
            max-height: 140px;
            overflow: hidden;
        }
        .image-preview {
            max-width: 100%;
            display: block;
            border-radius: 5px;
        }

        /* Responsive */
        @media (max-width: 600px) {
            form#jobPostingForm {
            margin: 1rem 1rem;
            padding: 1rem;
            }

            .button-group {
            flex-direction: column;
            gap: 10px;
            }

            button#addJobPosting,
            button[type="submit"] {
            flex: none;
            width: 100%;
            }
        }
    </style>
@endsection

@section('breadcrumb-title')
    <h3>Jobs</h3>
@endsection

@section('breadcrumb-items')
    <li class="breadcrumb-item">Dashboard</li>
    <li class="breadcrumb-item active">Create Job</li>
@endsection

@section('content')

    <form action="{{ route('admin.job_postings.store') }}" method="POST" enctype="multipart/form-data" id="jobPostingForm">
        @csrf

        <!-- Container for dynamically added job postings -->
        <div id="jobPostingsContainer"></div>

        <div class="button-group">
        <button type="button" id="addJobPosting" class="btn btn-success">Add Another Job</button>
        <button type="submit" class="btn btn-primary">save jobs</button>
        </div>
    </form>

    <!-- Template for one job posting -->
    <template id="jobPostingTemplate">
        <div class="job-posting position-relative">
            <button type="button" class="remove-job-posting position-absolute top-0 end-0 m-2">Remove</button>

            <!-- Currency Type -->
            <div class="mb-3">
                <label for="lkr_usd___INDEX__" class="form-label">Currency Type</label>
                <select name="job_postings[__INDEX__][lkr_usd]" id="lkr_usd___INDEX__" class="form-control" required>
                    <option value="">Select a Currency</option>
                    <option value="Local">Local(LKR)</option>
                    <option value="Foreign">Foreign(USD)</option>
                </select>
            </div>

            <!-- Package -->
            <div class="mb-3">
                <label for="package_id___INDEX__" class="form-label">Package *</label>
                <select name="job_postings[__INDEX__][package_id]" id="package_id___INDEX__" class="form-control" required>
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

            <div clsss="mb-3">
                @foreach ($jobPostings as $index => $job)
                    <div class="job-posting">
                        <!-- Custom Price Field -->
                        <div class="mb-3">
                            <label class="form-label">Package Price</label>
                            <input type="number" step="0.01" name="job_postings[__INDEX__][custom_price]" id="custom_price___INDEX__"class="form-control"placeholder="Enter price or leave blank for default">
                        </div>
                    </div>
                @endforeach
            </div>

            <!-- Employer -->
            <div class="mb-3">
                <label class="form-label">Employer *</label>
                <select name="job_postings[__INDEX__][employer_id]" class="form-control" required>
                    <option value="">Select an employer</option>
                    @foreach ($employers as $employer)
                        <option value="{{ $employer->id }}">{{ $employer->company_name }}</option>
                    @endforeach
                </select>
            </div>

            <!-- Job Title -->
            <div class="mb-3">
                <label class="form-label">Job Title *</label>
                <input type="text" name="job_postings[__INDEX__][title]" class="form-control" required>
            </div>

            <!-- Description -->
            <div class="mb-3">
                <label class="form-label">Description</label>
                <textarea name="job_postings[__INDEX__][description]" class="form-control" rows="4"></textarea>
            </div>

            <!-- Categories -->
            <div class="mb-3">
                <label class="form-label">Categories *</label>
                <select class="form-control category-select" onchange="handleCategorySelect(this)">
                    <option value="">Select a category</option>
                    @foreach ($categories as $category)
                        <option value="{{ $category->id }}">{{ $category->name }}</option>
                    @endforeach
                </select>
                <div class="tag-container mt-2 selected_categories"></div>
                <div class="hidden_category_inputs"></div>
            </div>

            <!-- Subcategories -->
            <div class="mb-3">
                <label class="form-label">Subcategories *</label>
                <select class="form-control subcategory-select" onchange="handleSubcategorySelect(this)" disabled>
                    <option value="">Select subcategory</option>
                </select>
                <div class="tag-container mt-2 selected_subcategories"></div>
                <div class="hidden_subcategory_inputs"></div>
            </div>

            <!-- Location -->
            <div class="mb-3">
                <label class="form-label">Location *</label>
                <input type="text" name="job_postings[__INDEX__][location]" class="form-control" required>
            </div>

            <!-- Country -->
            <div class="mb-3">
                <label class="form-label">Country *</label>
                <select name="job_postings[__INDEX__][country_id]" class="form-control" required>
                    <option value="">Select a country</option>
                    @foreach ($countries as $country)
                        <option value="{{ $country->id }}">{{ $country->name }}</option>
                    @endforeach
                </select>
            </div>

            <!-- Salary Range -->
            <div class="mb-3">
                <label class="form-label">Salary Range</label>
                <input type="text" name="job_postings[__INDEX__][salary_range]" class="form-control">
            </div>

            <!-- Image -->
            <div class="mb-3">
                <label class="form-label">Image</label>
                <input type="file" name="job_postings[__INDEX__][image]" class="form-control image-input" accept="image/*">
                <div class="image-preview-container mt-3">
                    <img class="image-preview" src="" alt="Image Preview" style="max-width: 100%; display: none;">
                </div>
            </div>

            <!-- Requirements -->
            <div class="mb-3">
                <label class="form-label">Requirements</label>
                <textarea name="job_postings[__INDEX__][requirements]" class="form-control" rows="4"></textarea>
            </div>

            <!-- Closing Date -->
            <div class="mb-3 col-md-3">
                <label class="form-label">Closing Date *</label>
                <input type="date" name="job_postings[__INDEX__][closing_date]" class="form-control" required>
            </div>

            <input type="hidden" name="job_postings[__INDEX__][status]" value="pending">
        </div>

    </template>

    <!-- payment model -->
    <div class="modal fade" id="paymentMethodModal" tabindex="-1" aria-labelledby="paymentMethodModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="paymentMethodModalLabel">Select Payment Method</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="form-check mb-3">
                        <input class="form-check-input" type="radio" name="paymentMethod"
                            id="contactContributor" value="contact_contributor">
                        <label class="form-check-label" for="contactContributor"> Contact Contributor </label>
                    </div>
                    <div class="form-check">
                        <input class="form-check-input" type="radio" name="paymentMethod"
                            id="onlinePayment" value="online">
                        <label class="form-check-label" for="onlinePayment">Online Payment</label>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary" id="confirmPaymentMethod">Confirm</button>
                </div>
            </div>
        </div>
    </div>

    <script>

        document.addEventListener('DOMContentLoaded', function () {

            const container = document.getElementById('jobPostingsContainer');
            const template = document.getElementById('jobPostingTemplate').content;
            const addBtn = document.getElementById('addJobPosting');
            const subcategoriesByCategory = @json($subcategories->groupBy('category_id'));
            let jobIndex = 0;

            // Add new job posting block
            function addJobPosting() {

                const newIndex = jobIndex++;
                let clone = document.importNode(template, true);

                // Replace __INDEX__ in the clone's innerHTML, for all relevant fields
                clone.firstElementChild.innerHTML = clone.firstElementChild.innerHTML.replace(/__INDEX__/g, newIndex);

                // Append clone directly as DOM node, so you have a direct reference
                container.appendChild(clone.firstElementChild);

                const newBlock = container.lastElementChild; // The appended block

                // Image preview setup (same as before)
                const imageInput = newBlock.querySelector('.image-input');
                const imgPreview = newBlock.querySelector('.image-preview');
                if (imageInput && imgPreview) {
                    imageInput.addEventListener('change', function () {
                        if (imageInput.files && imageInput.files[0]) {
                            if (!imageInput.files[0].type.startsWith('image/')) {
                                alert('Please select a valid image file.');
                                imageInput.value = '';
                                imgPreview.src = '';
                                imgPreview.style.display = 'none';
                                return;
                            }
                            const reader = new FileReader();
                            reader.onload = function (e) {
                                imgPreview.src = e.target.result;
                                imgPreview.style.display = 'block';
                            };
                            reader.onerror = function () {
                                alert('Error reading the image file.');
                                imageInput.value = '';
                                imgPreview.src = '';
                                imgPreview.style.display = 'none';
                            };
                            reader.readAsDataURL(imageInput.files[0]);
                        } else {
                            imgPreview.src = '';
                            imgPreview.style.display = 'none';
                        }
                    });
                }

                // Query selects inside the new block
                const packageSelect = newBlock.querySelector(`select[name="job_postings[${newIndex}][package_id]"]`);
                const currencySelect = newBlock.querySelector(`select[name="job_postings[${newIndex}][lkr_usd]"]`);
                const customPriceInput = newBlock.querySelector(`input[name="job_postings[${newIndex}][custom_price]"]`);

                if (packageSelect && window.jobPostingPackageOptions && currencySelect) {
                    const currency = currencySelect.value;
                    packageSelect.innerHTML = '<option value="">Select a package</option>';
                    window.jobPostingPackageOptions.forEach(pkg => {
                        const option = document.createElement('option');
                        option.value = pkg.value;
                        if (currency === 'Foreign') {
                            option.textContent = `${pkg.size} ads - (${pkg.duration} days) - $${pkg.usd} USD`;
                        } else {
                            option.textContent = `${pkg.size} ads - (${pkg.duration} days) - Rs. ${pkg.lkr}`;
                        }
                        option.dataset.lkr = pkg.lkr;
                        option.dataset.usd = pkg.usd;
                        option.dataset.size = pkg.size;
                        option.dataset.duration = pkg.duration;
                        packageSelect.appendChild(option);
                    });
                }

                // Setup event listeners
                if (currencySelect && packageSelect && customPriceInput) {
                    setupCurrencyAndPackageListeners(newBlock);
                } else {
                    console.error('Missing elements in the new job block:', { currencySelect, packageSelect, customPriceInput });
                }
            }

            // Update indices for all job posting blocks
            function updateIndices() {
                const blocks = container.querySelectorAll('.job-posting');
                blocks.forEach((block, idx) => {
                    block.querySelectorAll('input, select, textarea').forEach(input => {
                        if (input.name) {
                            input.name = input.name.replace(/job_postings\[\d+\]/, `job_postings[${idx}]`);
                        }
                        if (input.id) {
                            input.id = input.id.replace(/_\d+$/, `_${idx}`);
                        }
                    });
                    block.querySelectorAll('.hidden_category_inputs input').forEach(input => {
                        input.name = `job_postings[${idx}][categories][]`;
                    });
                    block.querySelectorAll('.hidden_subcategory_inputs input').forEach(input => {
                        input.name = `job_postings[${idx}][subcategories][]`;
                    });
                });
                jobIndex = blocks.length;
            }

            // Remove job posting (event delegation)
            container.addEventListener('click', function(event) {
                if (event.target.classList.contains('remove-job-posting')) {
                    const jobBlock = event.target.closest('.job-posting');
                    if (jobBlock) {
                        jobBlock.remove();
                        updateIndices();
                    }
                }
            });

            // Handle category select change - allow multiple categories
            function handleCategorySelect(selectElem) {
                const jobPostBlock = selectElem.closest('.job-posting');
                const subcategorySelect = jobPostBlock.querySelector('.subcategory-select');
                const selectedCategories = jobPostBlock.querySelector('.selected_categories');
                const hiddenCategoryInputs = jobPostBlock.querySelector('.hidden_category_inputs');
                const hiddenSubcategoryInputs = jobPostBlock.querySelector('.hidden_subcategory_inputs');
                const selectedSubcategories = jobPostBlock.querySelector('.selected_subcategories');
                const categoryId = selectElem.value;
                const categoryName = selectElem.options[selectElem.selectedIndex]?.textContent;

                if (!categoryId) return;

                subcategorySelect.disabled = false;
                subcategorySelect.innerHTML = '<option value="">Select subcategory</option>';

                const relatedSubcategories = subcategoriesByCategory[categoryId] || [];
                if (relatedSubcategories.length === 0) {
                    subcategorySelect.innerHTML = '<option value="">No subcategories available</option>';
                    subcategorySelect.disabled = true;
                } else {
                    relatedSubcategories.forEach(sub => {
                        subcategorySelect.insertAdjacentHTML(
                            'beforeend',
                            `<option value="${sub.id}">${sub.name}</option>`
                        );
                    });
                }

                const existing = Array.from(hiddenCategoryInputs.children).some(input => input.value === categoryId);
                if (!existing) {
                    const tag = document.createElement('div');
                    tag.className = 'badge bg-primary text-white mx-1 d-inline-flex align-items-center';
                    tag.textContent = categoryName + ' ';
                    const closeBtn = document.createElement('button');
                    closeBtn.type = 'button';
                    closeBtn.className = 'ms-2 text-white remove-category';
                    closeBtn.setAttribute('aria-label', `Remove ${categoryName} category`);
                    closeBtn.innerHTML = '×';
                    tag.appendChild(closeBtn);
                    selectedCategories.appendChild(tag);

                    const input = document.createElement('input');
                    input.type = 'hidden';
                    const idx = Array.from(container.children).indexOf(jobPostBlock);
                    input.name = `job_postings[${idx}][categories][]`;
                    input.value = categoryId;
                    hiddenCategoryInputs.appendChild(input);

                    closeBtn.addEventListener('click', function () {
                        tag.remove();
                        input.remove();

                        const relatedSubs = subcategoriesByCategory[categoryId] || [];
                        Array.from(hiddenSubcategoryInputs.children).forEach(subInput => {
                            if (relatedSubs.some(sub => sub.id == subInput.value)) {
                                const subTag = Array.from(selectedSubcategories.children).find(t => t.dataset.id == subInput.value);
                                if (subTag) subTag.remove();
                                subInput.remove();
                            }
                        });

                        if (!hiddenCategoryInputs.children.length) {
                            subcategorySelect.disabled = true;
                            selectedSubcategories.innerHTML = '';
                            hiddenSubcategoryInputs.innerHTML = '';
                        }
                    });
                }

                selectElem.value = '';
            }

            // Handle subcategory select change - allow multiple subcategories
            function handleSubcategorySelect(selectElem) {
                const jobPostBlock = selectElem.closest('.job-posting');
                const selectedSubcategories = jobPostBlock.querySelector('.selected_subcategories');
                const hiddenSubcategoryInputs = jobPostBlock.querySelector('.hidden_subcategory_inputs');
                const subcategoryId = selectElem.value;
                const subcategoryName = selectElem.options[selectElem.selectedIndex]?.textContent;

                if (!subcategoryId) return;

                const existing = Array.from(hiddenSubcategoryInputs.children).some(input => input.value === subcategoryId);
                if (!existing) {
                    const tag = document.createElement('div');
                    tag.className = 'badge bg-secondary text-white mx-1 d-inline-flex align-items-center';
                    tag.dataset.id = subcategoryId;
                    tag.textContent = subcategoryName + ' ';
                    const closeBtn = document.createElement('button');
                    closeBtn.type = 'button';
                    closeBtn.className = 'ms-2 text-white remove-subcategory';
                    closeBtn.setAttribute('aria-label', `Remove ${subcategoryName} subcategory`);
                    closeBtn.innerHTML = '×';
                    tag.appendChild(closeBtn);
                    selectedSubcategories.appendChild(tag);

                    const input = document.createElement('input');
                    input.type = 'hidden';
                    const idx = Array.from(container.children).indexOf(jobPostBlock);
                    input.name = `job_postings[${idx}][subcategories][]`;
                    input.value = subcategoryId;
                    hiddenSubcategoryInputs.appendChild(input);

                    closeBtn.addEventListener('click', function () {
                        tag.remove();
                        input.remove();
                    });
                }

                selectElem.value = '';
            }

            // Setup currency and package listeners
            function setupCurrencyAndPackageListeners(jobBlock) {
                

                const currencySelect = jobBlock.querySelector('select[name^="job_postings"][name$="[lkr_usd]"]');
                const packageSelect = jobBlock.querySelector('select[name^="job_postings"][name$="[package_id]"]');
                const customPriceInput = jobBlock.querySelector('input[name^="job_postings"][name$="[custom_price]"]');

                if (!currencySelect || !packageSelect || !customPriceInput) {
                    console.error('Missing required elements in job block:', { currencySelect, packageSelect, customPriceInput });
                    return;
                }

                // Initialize package options if not already done
                if (!window.jobPostingPackageOptions) {
                    window.jobPostingPackageOptions = [];
                    const firstPackageSelect = document.querySelector('select[name^="job_postings"][name$="[package_id]"]');
                    if (firstPackageSelect) {
                        firstPackageSelect.querySelectorAll('option').forEach(opt => {
                            if (opt.value && opt.value !== '') {
                                const lkr = opt.getAttribute('data-lkr');
                                const usd = opt.getAttribute('data-usd');
                                const size = opt.getAttribute('data-size');
                                const duration = opt.getAttribute('data-duration');
                                if (lkr && usd && size && duration) {
                                    window.jobPostingPackageOptions.push({
                                        value: opt.value,
                                        lkr: lkr,
                                        usd: usd,
                                        size: size,
                                        duration: duration,
                                    });
                                } else {
                                    console.warn(`Skipping package option with missing attributes:`, opt);
                                }
                            }
                        });
                    }

                    if (window.jobPostingPackageOptions.length === 0) {
                        console.error('No valid package options found.');
                        packageSelect.innerHTML = '<option value="">No packages available</option>';
                        customPriceInput.value = '';
                        return;
                    }
                }


                // Autofill the custom price field based on the selected package and currency
                function autofillCustomPrice() {
                    const currency = currencySelect.value;
                    const selectedOption = packageSelect.selectedOptions[0];
                    if (!selectedOption || !selectedOption.value) {
                        customPriceInput.value = '';
                        return;
                    }
                    if (currency === 'Local') {
                        customPriceInput.value = selectedOption.dataset.lkr || '';
                    } else if (currency === 'Foreign') {
                        customPriceInput.value = selectedOption.dataset.usd || '';
                    } else {
                        customPriceInput.value = '';
                    }
                }

                // Update package options based on the selected currency
                function updatePackageOptions() {
                    const currency = currencySelect.value;
                    packageSelect.innerHTML = '<option value="">Select a package</option>';

                    window.jobPostingPackageOptions.forEach(pkg => {
                        let priceText = '';
                        if (currency === 'Local') {
                            priceText = `${pkg.size} ads - (${pkg.duration} days) - Rs. ${parseFloat(pkg.lkr).toFixed(2)}`;
                        } else if (currency === 'Foreign') {
                            priceText = `${pkg.size} ads - (${pkg.duration} days) - $${parseFloat(pkg.usd).toFixed(2)} USD`;
                        } else {
                            priceText = `${pkg.size} ads - (${pkg.duration} days)`;
                        }

                        const option = document.createElement('option');
                        option.value = pkg.value;
                        option.textContent = priceText;
                        option.dataset.lkr = pkg.lkr;
                        option.dataset.usd = pkg.usd;
                        option.dataset.size = pkg.size;
                        option.dataset.duration = pkg.duration;
                        packageSelect.appendChild(option);
                    });

                    if (packageSelect.options.length > 1) {
                        packageSelect.selectedIndex = 1; // Auto-select first real option
                    } else {
                        packageSelect.selectedIndex = 0;
                    }

                    autofillCustomPrice();
                }

                // Attach event listeners
                currencySelect.addEventListener('change', updatePackageOptions);
                packageSelect.addEventListener('change', autofillCustomPrice);

                // Initialize package options and autofill price on first setup
                updatePackageOptions();
            }
            
            // Event delegation for category and subcategory selects
            document.addEventListener('change', function(event) {
                if (event.target.matches('.category-select')) {
                    handleCategorySelect(event.target);
                }
                if (event.target.matches('.subcategory-select')) {
                    handleSubcategorySelect(event.target);
                }
            });

            // Payment modal logic
            function initializePaymentModalLogic() {
                if (!window.bootstrap || !window.bootstrap.Modal) {
                    console.alert('Bootstrap Modal is not available.');
                    return;
                }
                const paymentModal = new bootstrap.Modal(document.getElementById('paymentMethodModal'));
                const confirmPaymentButton = document.getElementById('confirmPaymentMethod');
                const form = document.getElementById('jobPostingForm');

                function handlePaymentSelection() {
                    const selectedPayment = document.querySelector('input[name="paymentMethod"]:checked');
                    if (selectedPayment) {
                        // Check if the selected payment method is 'online'
                        if (selectedPayment.value === 'online') {
                            alert('Online payment is not allowed at this time. Please select a different payment method.');
                            return; // Exit the function without proceeding
                        }

                        const existingInput = form.querySelector('input[name="payment_method"]');
                        if (existingInput) existingInput.remove();

                        const input = document.createElement('input');
                        input.type = 'hidden';
                        input.name = 'payment_method';
                        input.value = selectedPayment.value;
                        form.appendChild(input);

                        paymentModal.hide();
                        form.submit();
                    } else {
                        alert('Please select a payment method before confirming.');
                    }
                }

                confirmPaymentButton.addEventListener('click', handlePaymentSelection);

                form.addEventListener('submit', function (event) {
                    event.preventDefault();
                    paymentModal.show();
                });
            }

            // Initialize
            addJobPosting();
            addBtn.addEventListener('click', addJobPosting);
            initializePaymentModalLogic();

        });

    </script>

@endsection
