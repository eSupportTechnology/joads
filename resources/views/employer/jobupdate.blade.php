@extends('layouts.employer.master')

@section('title', 'Jobs')

@section('css')

@endsection

@section('style')
    <link rel="stylesheet" type="text/css" href="{{ asset('assets/css/vendors/animate.css') }}">
@endsection

@section('breadcrumb-title')
    <h3>Jobs</h3>
@endsection

@section('breadcrumb-items')
    <li class="breadcrumb-item">Dashboard</li>
    <li class="breadcrumb-item active">Update Job</li>
@endsection

@section('content')

    <div class="container">
        <!-- Success Message -->
        @if (session('success'))
            <div class="alert alert-success alert-dismissible fade show" role="alert">
                {{ session('success') }}
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
        @endif

        <!-- Error Message -->
        @if (session('error'))
            <div class="alert alert-danger alert-dismissible fade show" role="alert">
                {{ session('error') }}
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
        @endif

        <h1>Update Job Posting</h1>
        <form action="{{ route('employer.job_postings.post.update', ['jobPosting' => $jobPosting]) }}" method="POST"
            enctype="multipart/form-data">
            @csrf
            @method('patch')

            <!-- Currency Selection -->
            <div class="mb-3">
                <label for="lkr_usd" class="form-label">Currency Type</label>
                <select name="lkr_usd" id="lkr_usd" class="form-control" required>
                    <option value="">Select a Currency</option>
                    <option value="Local" {{ old('lkr_usd', $jobPosting->currency_type) == 'Local' ? 'selected' : '' }}>
                        Local(LKR)</option>
                    <option value="Foreign" {{ old('lkr_usd', $jobPosting->currency_type) == 'Foreign' ? 'selected' : '' }}>
                        Foreign(USD)</option>
                </select>
            </div>

            <!-- Package Selection -->
            <div class="mb-3">
                <label for="package_id" class="form-label">Package *</label>
                <select name="package_id" id="package_id" class="form-control @error('package_id') is-invalid @enderror"
                    required>
                    <option value="">Select a package</option>
                    @foreach ($packages as $package)
                        <option value="{{ $package->id }}" data-lkr="{{ $package->lkr_price }}"
                            data-usd="{{ $package->usd_price }}" data-size="{{ $package->package_size }}"
                            data-duration="{{ $package->duration->duration }}"
                            {{ old('package_id', $jobPosting->package_id) == $package->id ? 'selected' : '' }}>
                            {{ $package->package_size }} ads - ({{ $package->duration->duration }} days)
                            - Rs. {{ $package->lkr_price }} / ${{ $package->usd_price }} USD
                        </option>
                    @endforeach
                </select>
                @error('package_id')
                    <div class="invalid-feedback">{{ $message }}</div>
                @enderror
            </div>

            <!-- Custom Price -->
            <div class="mb-3">
                <label for="custom_price" class="form-label">Package Price</label>
                <input type="number" step="0.01" name="custom_price" id="custom_price"
                    class="form-control @error('custom_price') is-invalid @enderror"
                    placeholder="Enter price or leave blank to use default"
                    value="{{ old('custom_price', $jobPosting->package_price) }}">

                @error('custom_price')
                    <div class="invalid-feedback">{{ $message }}</div>
                @enderror
            </div>

            <div class="mb-3">
                <label for="title" class="form-label">Job Title</label>
                <input type="text" name="title" id="title" class="form-control"
                    value="{{ old('title', $jobPosting->title) }}" required>
                @error('title')
                    <div class="text-danger">{{ $message }}</div>
                @enderror
            </div>

            <div class="mb-3">
                <label for="description" class="form-label">Description</label>
                <textarea name="description" id="description" class="form-control" rows="4" required>{{ old('description', $jobPosting->description) }}</textarea>
                @error('description')
                    <div class="text-danger">{{ $message }}</div>
                @enderror
            </div>

            <div class="mb-3">
                <label for="category_id" class="form-label">Category</label>
                <select name="category_id" id="category_id" class="form-control" required>
                    @foreach ($categories as $category)
                        <option value="{{ $category->id }}"
                            {{ $jobPosting->category_id == $category->id ? 'selected' : '' }}>
                            {{ $category->name }}
                        </option>
                    @endforeach
                </select>
                @error('category_id')
                    <div class="text-danger">{{ $message }}</div>
                @enderror
            </div>

            <div class="mb-3">
                <label for="subcategory_id" class="form-label">Subcategory</label>
                <select name="subcategory_id" id="subcategory_id" class="form-control" required>
                    <option value="">Select a subcategory</option>
                    @foreach ($subcategories as $subcategory)
                        <option value="{{ $subcategory->id }}"
                            {{ $jobPosting->subcategory_id == $subcategory->id ? 'selected' : '' }}>
                            {{ $subcategory->name }}
                        </option>
                    @endforeach
                </select>
                @error('subcategory_id')
                    <div class="text-danger">{{ $message }}</div>
                @enderror
            </div>

            <div class="mb-3">
                <label for="location" class="form-label">Location</label>
                <input type="text" name="location" id="location" class="form-control"
                    value="{{ old('location', $jobPosting->location) }}" required>
                @error('location')
                    <div class="text-danger">{{ $message }}</div>
                @enderror
            </div>
            <div class="mb-3">
                <label for="country" class="form-label">country</label>
                <select name="country_id" id="country_id" class="form-control" required>
                    @foreach ($countries as $country)
                        <option value="{{ $country->id }}"
                            {{ old('country_id', $jobPosting->country_id ?? '') == $country->id ? 'selected' : '' }}>
                            {{ $country->name }}</option>
                    @endforeach
                </select>
                @error('country')
                    <div class="text-danger">{{ $message }}</div>
                @enderror
            </div>

            <div class="mb-3">
                <label for="salary_range" class="form-label">Salary Range</label>
                <input type="text" name="salary_range" id="salary_range" class="form-control"
                    value="{{ old('salary_range', $jobPosting->salary_range) }}">
                @error('salary_range')
                    <div class="text-danger">{{ $message }}</div>
                @enderror
            </div>

            <div class="mb-3">
                <label for="image" class="form-label">Image</label>
                <input type="file" name="image" id="image" class="form-control" accept="image/*">
                <div id="imagePreviewContainer" class="mt-3">
                    <img id="imagePreview" src="{{ asset('storage/' . $jobPosting->image) }}" alt="Current Image"
                        style="max-width: 100%; display: {{ $jobPosting->image ? 'block' : 'none' }};">
                </div>
                @error('image')
                    <div class="text-danger">{{ $message }}</div>
                @enderror
            </div>

            <div class="mb-3">
                <label for="requirements" class="form-label">Requirements</label>
                <textarea name="requirements" id="requirements" class="form-control" rows="4" required>{{ old('requirements', $jobPosting->requirements) }}</textarea>
                @error('requirements')
                    <div class="text-danger">{{ $message }}</div>
                @enderror
            </div>

            <div class="mb-3">
                <label for="closing_date" class="form-label">Closing Date</label>
                <input type="date" name="closing_date" id="closing_date" class="form-control"
                    value="{{ old('closing_date', $jobPosting->closing_date) }}" required>
                @error('closing_date')
                    <div class="text-danger">{{ $message }}</div>
                @enderror
            </div>

            <button type="submit" class="btn btn-primary">Update job</button>
        </form>
    </div>

    <script type="text/javascript">
        var session_layout = '{{ session()->get('
                            layout ') }}';
    </script>
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

    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const currencySelect = document.getElementById('lkr_usd');
            const packageSelect = document.getElementById('package_id');
            const priceInput = document.getElementById('custom_price');

            // Get initial value from backend
            const initialDBValue = priceInput.value.trim();
            let userEdited = false;

            // Detect if user changes input manually
            priceInput.addEventListener('input', () => {
                userEdited = true;
            });

            // Update package display based on selected currency
            function updatePackageOptionLabels() {
                const currency = currencySelect.value;

                Array.from(packageSelect.options).forEach(option => {
                    const size = option.getAttribute('data-size');
                    const duration = option.getAttribute('data-duration');
                    const lkr = option.getAttribute('data-lkr');
                    const usd = option.getAttribute('data-usd');

                    if (size && duration) {
                        option.textContent = currency === 'Local' ?
                            `${size} ads - (${duration} days) - Rs. ${lkr}` :
                            `${size} ads - (${duration} days) - $${usd} USD`;
                    }
                });
            }

            // Set price if not manually changed
            function updatePriceFromPackage() {
                const selectedOption = packageSelect.options[packageSelect.selectedIndex];
                if (!selectedOption) return;

                const currency = currencySelect.value;
                const newPrice = currency === 'Local' ?
                    selectedOption.getAttribute('data-lkr') :
                    selectedOption.getAttribute('data-usd');

                // If not edited or value equals the original DB value
                if (!userEdited || priceInput.value.trim() === initialDBValue) {
                    priceInput.value = newPrice;
                }
            }

            // Events
            currencySelect.addEventListener('change', () => {
                updatePackageOptionLabels();
                updatePriceFromPackage();
            });

            packageSelect.addEventListener('change', () => {
                updatePriceFromPackage();
            });

            // Initialize on load
            updatePackageOptionLabels();
        });



        document.getElementById('image').addEventListener('change', function(event) {
            const imagePreview = document.getElementById('imagePreview');
            const file = event.target.files[0];

            if (file) {
                const reader = new FileReader();
                reader.onload = function(e) {
                    imagePreview.src = e.target.result;
                    imagePreview.style.display = 'block';
                };
                reader.readAsDataURL(file);
            } else {
                imagePreview.style.display = 'none';
            }
        });
    </script>
    <script>
        document.getElementById('image').addEventListener('change', function(event) {
            const imagePreview = document.getElementById('imagePreview');
            const file = event.target.files[0];

            if (file) {
                const reader = new FileReader();
                reader.onload = function(e) {
                    imagePreview.src = e.target.result;
                    imagePreview.style.display = 'block';
                };
                reader.readAsDataURL(file);
            } else {
                imagePreview.style.display = 'none';
            }
        });
    </script>

@endsection
