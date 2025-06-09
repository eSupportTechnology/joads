<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>HomePage</title>
    <link rel="icon" href="{{ asset('assets/images/favicon.ico') }}" type="image/x-icon">
    <link rel="shortcut icon" href="{{ asset('assets/images/favicon.ico') }}" type="image/x-icon">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">

    <link rel="stylesheet" href="{{ asset('css/home.css') }}">
    <link rel="stylesheet" href="{{ asset('css/footer.css') }}">
    <link rel="stylesheet" href="{{ asset('css/header.css') }}">
    <!-- Swiper CSS -->
    <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css">



    <style>
        .dropdown {
            padding: 8px;
            margin: 10px 0;
            width: 100%;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 14px;
        }

        .ads-container {
            width: 100%;
            max-width: 1200px;
            margin: 0 auto;
        }

        .swiper-container {
            width: 100%;
            height: 220px;
            overflow: hidden;
        }

        .swiper-slide {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100%;
        }

        .banner-item img {
            max-width: 75%;
            max-height: 100%;
            border-radius: 10px;
        }

        .filters-form {
            display: flex;
            flex-wrap: wrap;
            gap: 10px;
            justify-content: center;
            align-items: center;
        }

        .text-input,
        .dropdown {
            flex: 1;
            min-width: 220px;
        }

        .filters input,
        .filters select {
            font-size: 12px;
        }

        .contact-table th,
        .contact-table td {
            padding: 10px;
            border: 1px solid #ddd;
            word-wrap: break-word;
            width: auto;
            text-align: left;
        }

        .text-input::placeholder {
            font-size: 12px;
        }

        .table-container {
            max-height: auto;
            overflow-y: auto;
            border: 1px solid #ddd;
            margin-top: 10px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }

        .scroll-wrapper {
            background-color: #d9d9d9;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            margin: 12px 15px;
            padding: 0px;
            overflow-y: visible;
        }

        .categories-container {
            overflow-x: auto;
            scrollbar-width: none;
        }

        .job-grid {
            min-height: 50px;
            height: auto;
            display: grid;
            gap: 4.3px;
        }

        .job-listings-container {
            flex: 3;
            background: #fff;
            padding: 0px 20px;
            border-radius: 10px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        .job-card {
            padding: 3px 10px;
            font-size: 14px;
            border-bottom: 1px dotted #000;
            cursor: pointer;
        }

        .main-footer {
            background-color: #18799c;
            color: #fff;
            padding: 4px 20px;
            text-align: center;
            font-size: 14px;
            border-radius: 50px 0 0 0;
        }

        .categories-list {
            display: flex;
            flex-direction: column;
            overflow-y: auto;
            overflow-x: auto;
            -webkit-overflow-scrolling: touch;
            scrollbar-width: none;
            -ms-overflow-style: none;
            max-height: calc(40px * 4.5);
            padding: 12px 0px 12px 0px;
            scroll-behavior: smooth;
            margin-top: 0.5px;
        }

        .filters {
            display: flex;
            gap: 10px;
            align-items: center;
            margin: 20px 0 0 0;
            justify-content: center;
            padding: 0 20px 0 20px;
            border-bottom: 4px solid #3a7ecc;
        }

        .job-listings-title {
            margin: 10px;
        }

        .categories-list::-webkit-scrollbar {
            display: none;
        }

        .category-link {
            flex: 0 0 auto;
        }

        .pagination-container {
            text-align: center;
        }

        .pagination {
            display: inline-flex;
            list-style: none;
            padding-left: 0;
            border-radius: 0.25rem;
            margin: 0;
        }

        .pagination li {
            margin: 0 5px;
        }

        .pagination a,
        .pagination span {
            display: inline-block;
            padding: 8px 16px;
            margin: 0;
            line-height: 1.5;
            text-decoration: none;
            color: #007bff;
            background-color: #fff;
            border: 1px solid #dee2e6;
            border-radius: 0.25rem;
        }

        .pagination a:hover,
        .pagination span:hover {
            background-color: #007bff;
            color: white;
        }

        .pagination .active a,
        .pagination .active span {
            background-color: #007bff;
            border-color: #007bff;
            color: white;
        }

        .pagination .disabled a,
        .pagination .disabled span {
            background-color: #f8f9fa;
            border-color: #dee2e6;
            color: #6c757d;
        }

        .pagination .page-item:first-child a,
        .pagination .page-item:first-child span {
            border-radius: 0.25rem 0 0 0.25rem;
        }

        .pagination .page-item:last-child a,
        .pagination .page-item:last-child span {
            border-radius: 0 0.25rem 0.25rem 0;
        }

        .view-btn {
            background: linear-gradient(135deg, #3a7ecc, #18799c);
            color: white;
            border: none;
            padding: 12px 20px;
            border-radius: 6px;
            cursor: pointer;
            font-size: 14px;
            transition: all 0.3s ease;
            box-shadow: 0 2px 8px rgba(58, 126, 204, 0.3);
            min-width: 50px;
        }

        .view-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 15px rgba(58, 126, 204, 0.4);
        }

        /* Responsive Design */

        /* Large Desktop (1200px and up) */
        @media (min-width: 1200px) {
            .filters {
                background-color: rgba(0, 0, 0, 0.1);
                padding: 2px 25px 0px 25px;
                display: flex;
                justify-content: space-between;
                align-items: center;
            }

            .filters-form {
                width: 70%;
                margin: 0;
                flex-wrap: nowrap;
            }

            .text-input,
            .dropdown {
                min-width: 180px;
            }

            .job-grid {
                grid-template-columns: repeat(5, 1fr);
            }
        }

        /* Desktop (992px to 1199px) */
        @media (min-width: 992px) and (max-width: 1199px) {
            .filters {
                background-color: rgba(0, 0, 0, 0.1);
                padding: 15px 20px;
                flex-direction: column;
                gap: 15px;
            }

            .filters-form {
                width: 100%;
                gap: 12px;
            }

            .text-input,
            .dropdown {
                min-width: 160px;
            }

            .job-grid {
                grid-template-columns: repeat(4, 1fr);
            }
        }

        /* Tablet (768px to 991px) */
        @media (min-width: 768px) and (max-width: 991px) {
            .filters {
                background-color: rgba(0, 0, 0, 0.1);
                padding: 15px 20px;
                flex-direction: column;
                gap: 15px;
            }

            .filters-form {
                width: 100%;
                gap: 12px;
                grid-template-columns: 1fr 1fr;
                display: grid;
            }

            .text-input,
            .dropdown {
                min-width: 140px;
            }

            .view-btn {
                grid-column: span 2;
                justify-self: center;
                max-width: 200px;
            }

            .job-grid {
                grid-template-columns: repeat(3, 1fr);
            }

            .category-link {
                width: 300px !important;
            }
        }

        /* Mobile Large (576px to 767px) */
        @media (min-width: 576px) and (max-width: 767px) {
            .filters {
                background-color: rgba(0, 0, 0, 0.1);
                padding: 15px 15px;
                flex-direction: column;
                gap: 15px;
                text-align: center;
                align-items: center;
                justify-content: center;
            }

            .filters-form {
                width: 100%;
                max-width: 400px;
                flex-direction: column;
                gap: 12px;
                align-items: center;
                justify-content: center;
                margin: 0 auto;
            }

            .text-input,
            .dropdown {
                width: 100%;
                max-width: 350px;
                text-align: center;
                margin: 0 auto;
                display: block;
            }

            .view-btn {
                width: 100%;
                max-width: 200px;
                margin: 0 auto;
                display: block;
            }

            .job-grid {
                grid-template-columns: repeat(2, 1fr);
                justify-items: center;
            }

            .jobtitle {
                font-size: 16px;
                text-align: center;
                width: 100%;
            }

            .job-card {
                text-align: center;
            }
        }

        /* Mobile Small (up to 575px) */
        @media (max-width: 575px) {
            .filters {
                background-color: rgba(0, 0, 0, 0.1);
                padding: 12px 10px;
                flex-direction: column;
                gap: 12px;
                text-align: center;
                align-items: center;
                justify-content: center;
            }

            .filters-form {
                width: 100%;
                max-width: 350px;
                flex-direction: column;
                gap: 10px;
                align-items: center;
                justify-content: center;
                margin: 0 auto;
            }

            .text-input,
            .dropdown {
                width: 100%;
                max-width: 300px;
                font-size: 12px;
                text-align: center;
                margin: 0 auto;
                display: block;
            }

            .text-input {
                height: 40px;
                padding: 8px 12px;
            }

            .dropdown {
                height: 40px;
                padding: 8px 12px;
            }

            .view-btn {
                width: 100%;
                max-width: 200px;
                padding: 12px;
                margin: 0 auto;
                display: block;
            }

            .job-grid {
                grid-template-columns: 1fr;
                justify-items: center;
            }

            .jobtitle {
                font-size: 14px;
                text-align: center;
                line-height: 1.4;
                width: 100%;
            }

            .job-card {
                text-align: center;
            }

            .pagination {
                flex-wrap: wrap;
                justify-content: center;
            }

            .pagination li {
                margin: 2px;
            }

            .pagination a,
            .pagination span {
                padding: 6px 10px;
                font-size: 12px;
            }
        }

        /* Extra Small Mobile (up to 400px) */
        @media (max-width: 400px) {
            .filters {
                padding: 10px 8px;
                gap: 10px;
                text-align: center;
                align-items: center;
                justify-content: center;
            }

            .filters-form {
                gap: 8px;
                align-items: center;
                justify-content: center;
                max-width: 280px;
                margin: 0 auto;
            }

            .text-input,
            .dropdown {
                font-size: 11px;
                height: 38px;
                padding: 6px 10px;
                text-align: center;
                width: 100%;
                max-width: 250px;
                margin: 0 auto;
                display: block;
            }

            .view-btn {
                font-size: 12px;
                padding: 10px;
                max-width: 150px;
                margin: 0 auto;
                display: block;
            }

            .jobtitle {
                font-size: 13px;
                text-align: center;
                width: 100%;
            }

            .job-card {
                font-size: 12px;
                padding: 8px;
                text-align: center;
            }
        }

        /* Landscape Mobile */
        @media (max-height: 500px) and (orientation: landscape) {
            .filters {
                padding: 8px 15px;
            }

            .text-input,
            .dropdown {
                height: 35px;
            }

            .view-btn {
                padding: 8px 15px;
            }
        }
    </style>

</head>

<body>
    @include('home.header')
    @include('home.socialbutton')


    <!-- Categories Section -->
    <section class="categories-container">
        <div class="categories-header"
            style="background: linear-gradient(to bottom, #28adce, #18799c);justify-content: flex-end; gap: 15px; min-height:40px; height:auto">

            <a href="{{ route('login') }}" class="category-btn"
                style="text-decoration: none; padding: 6px 6px; border-radius: 5px; box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2); transition: all 0.3s ease;
             background-color: #6bbed4; color: black; font-weight:600"
                onmouseover=" this.style.transform='translateY(-3px)'; this.style.boxShadow='0 12px 24px rgba(0, 0, 0, 0.3)'; this.style.backgroundColor='#6c9dbd';"
                onmouseout=" this.style.transform='translateY(0)'; this.style.boxShadow='0 8px 16px rgba(0, 0, 0, 0.2)'; this.style.backgroundColor='#6bbed4';">
                JOBSEEKER LOGIN
            </a>

            <a href="{{ route('employer.login') }}" class="category-btn"
                style="text-decoration: none; padding: 6px 6px; border-radius: 5px; box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
             transition: all 0.3s ease;  background-color:  #6bbed4; color: black; font-weight:600"
                onmouseover=" this.style.transform='translateY(-3px)'; this.style.boxShadow='0 12px 24px rgba(0, 0, 0, 0.3)'; this.style.backgroundColor='#6c9dbd';"
                onmouseout=" this.style.transform='translateY(0)'; this.style.boxShadow='0 8px 16px rgba(0, 0, 0, 0.2)'; this.style.backgroundColor=' #6bbed4';">
                EMPLOYER LOGIN
            </a>

            <a href="{{ route('feedback.home') }}" class="category-btn"
                style="text-decoration: none; padding: 6px 6px; border-radius: 5px; box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2); transition: all 0.3s ease;
             background-color:  #6bbed4; color: black; font-weight:600"
                onmouseover=" this.style.transform='translateY(-3px)'; this.style.boxShadow='0 12px 24px rgba(0, 0, 0, 0.3)'; this.style.backgroundColor='#6c9dbd';"
                onmouseout=" this.style.transform='translateY(0)'; this.style.boxShadow='0 8px 16px rgba(0, 0, 0, 0.2)'; this.style.backgroundColor=' #6bbed4';">
                FEEDBACK
            </a>
        </div>
    </section>




    <div class="scroll-wrapper">
        <!-- Scroll buttons -->
        <button class="scroll-btn left-scroll" id="scrollLeft">
            <i class="fa fa-chevron-left"></i>
        </button>

        <!-- Categories list -->
        <div class="categories-list" id="categoriesList"
            style="border-radius: 15px; display: flex; flex-wrap: wrap; gap: 4px; justify-content: center;">

            <!-- Render "All" category first -->
            @foreach ($categories as $category)
                @if ($category->name == 'All')
                    <a href="javascript:void(0);" data-category-id="{{ $category->id }}"
                        class="category-link {{ session('selected_category_id') == $category->id ? 'active' : '' }}"
                        style="
                        text-decoration: none;
                        background-color: {{ session('selected_category_id') == $category->id ? '#1267e7' : '#f8f9fa' }};
                        color: {{ session('selected_category_id') == $category->id ? 'white' : 'black' }};
                        padding: 4px 15px;
                        border-radius: 5px;
                        min-width: 230px;
                        width: auto;
                        font-size: 14px;
                        transition: all 0.3s ease;
                        white-space: nowrap;
                        display: inline-block;
                        position: sticky; top: 0; z-index: 10;
                   ">
                        {{ $category->name }}
                    </a>
                @endif
            @endforeach

            <!-- Render the rest of the categories -->
            @foreach ($categories as $category)
                @if ($category->name != 'All')
                    <a href="javascript:void(0);" data-category-id="{{ $category->id }}"
                        class="category-link {{ session('selected_category_id') == $category->id ? 'active' : '' }}"
                        style="
                        text-decoration: none;
                        background-color: {{ session('selected_category_id') == $category->id ? '#1267e7' : '#f8f9fa' }};
                        color: {{ session('selected_category_id') == $category->id ? 'white' : 'black' }};
                        padding: 4px 15px;
                        border-radius: 5px;
                        min-width: 230px;
                        width: auto;
                        font-size: 14px;
                        transition: all 0.3s ease;
                        white-space: nowrap;
                        display: inline-block;
                   ">
                        {{ $category->name }}
                    </a>
                @endif
            @endforeach

        </div>

        <!-- Scroll buttons -->
        <button class="scroll-btn right-scroll" id="scrollRight">
            <i class="fa fa-chevron-right"></i>
        </button>
    </div>

    </section>
    <!-- <div class="ads-banner">
        <img src="{{ asset('assets/images/ads.jpg') }}" alt="">
    </div> -->
    <!-- Swiper JS -->
    <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>

    <div class="ads-container">
        <div class="swiper-container ads-banner">
            <div class="swiper-wrapper">
                @forelse ($banners as $banner)
                    <div class="swiper-slide banner-item">
                        <img src="{{ asset('storage/' . $banner->image) }}" alt="{{ $banner->title }}">
                    </div>
                @empty
                    <div class="swiper-slide banner-item">
                        {{-- <p>No banners available.</p> --}}
                        <img src="/banner-new.jpg" alt="">

                    </div>
                @endforelse
            </div>
            <!-- Add navigation buttons if needed -->
            <!-- <div class="swiper-button-next"></div>
            <div class="swiper-button-prev"></div> -->
            <!-- Add pagination if needed -->
            <!-- <div class="swiper-pagination"></div> -->
        </div>
    </div>


    <!-- Filters Section -->
     <section class="filters">
        <p class="jobtitle">
            Available New Jobs : {{ $totalCount }}
            @if (session('selected_category_id'))
                @php
                    $selectedCategory = \App\Models\Category::find(session('selected_category_id'));
                @endphp
                in {{ $selectedCategory->name }}
            @endif
        </p>
        <form method="GET" action="{{ route('home') }}" class="filters-form" id="searchForm">
            <!-- Category Filter -->
            <input type="hidden" name="category_id" id="categoryInput"
                value="{{ request('category_id') ?? session('selected_category_id') }}">

            <input class="text-input" style="height:17px" type="text" name="search"
                placeholder="Enter Vacancy Name/Company/Job Reference" value="{{ request('search') }}">

            <input class="text-input" style="height:17px;" type="text" name="location"
                placeholder="Enter your Location" value="{{ request('location') }}">

            <select name="country" class="dropdown" style="height: 43px; color: #777777">
                <option value="">Select Country</option>
                @foreach ($countries as $country)
                    <option value="{{ $country->id }}" {{ request('country') == $country->id ? 'selected' : '' }}>
                        {{ $country->name }}
                    </option>
                @endforeach
            </select>

            <button class="view-btn" type="submit">
                <i class="fa fa-search"></i>
            </button>
        </form>
    </section>

    <!-- Job Listings Section -->
    <section id="job-listings" class="job-listings-container w-full max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-6">
    <h3 class="job-listings-title text-2xl font-bold text-gray-800 mb-6 text-center sm:text-left">Available Jobs</h3>

    @if ($jobs->isEmpty())
        <div class="text-center py-12">
            <p class="text-gray-600 text-lg">No jobs found matching your criteria.</p>
        </div>
    @else
        @php
            // Check if category_id is set and not null, and whether it is "All"
            $isCategorySelected = request()->has('category_id') && request()->category_id != null;
            $isAllCategory = request()->category_id === '45';
        @endphp

        @if ($isCategorySelected && !$isAllCategory)
            <!-- Display as Table if Specific Category (not "45") is Selected -->
            <div class="overflow-x-auto">
                <table class="job-table w-full min-w-full">
                    <thead>
                        <tr>
                            <th class="px-2 py-2 text-left text-xs sm:text-sm">#</th>
                            <th class="px-2 py-2 text-left text-xs sm:text-sm">Reference ID</th>
                            <th class="px-2 py-2 text-left text-xs sm:text-sm">Job Title</th>
                            <th class="px-2 py-2 text-left text-xs sm:text-sm hidden md:table-cell">Description</th>
                            <th class="px-2 py-2 text-left text-xs sm:text-sm">Location</th>
                            <th class="px-2 py-2 text-left text-xs sm:text-sm hidden sm:table-cell">Posted Date</th>
                            <th class="px-2 py-2 text-left text-xs sm:text-sm">Closing Date</th>
                        </tr>
                    </thead>
                    <tbody>
                        @foreach ($jobs as $index => $job)
                            <tr>
                                <td class="px-2 py-2 text-xs sm:text-sm">{{ ($jobs->currentPage() - 1) * $jobs->perPage() + $index + 1 }}</td>
                                <td class="px-2 py-2 text-xs sm:text-sm">{{ $job->job_id ?? 'N/A' }}</td>
                                <td class="px-2 py-2">
                                    <a href="{{ route('job.details', $job->id) }}" class="job-title block text-xs sm:text-sm">
                                        {{ $job->title }}
                                    </a>
                                    <br>
                                    <a href="{{ route('job.details', $job->id) }}" class="company-name text-xs sm:text-sm">
                                        {{ $job->employer == null ? '' : $job->employer->company_name }}
                                    </a>
                                </td>
                                <td class="px-2 py-2 text-xs sm:text-sm hidden md:table-cell">{{ $job->description ?? 'No description provided' }}</td>
                                <td class="px-2 py-2 text-xs sm:text-sm">{{ $job->location ?? 'Not specified' }}</td>
                                <td class="px-2 py-2 text-xs sm:text-sm hidden sm:table-cell">{{ $job->created_at ? $job->created_at->format('Y-m-d') : 'N/A' }}</td>
                                <td class="px-2 py-2 text-xs sm:text-sm">{{ $job->closing_date ?? 'N/A' }}</td>
                            </tr>
                        @endforeach
                    </tbody>
                </table>
            </div>
        @else
            <!-- Display as Cards if No Category or "All" is Selected -->
            <div class="job-grid grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4 gap-4 md:gap-6">
                @foreach ($jobs as $job)
                    <div class="job-card bg-white border border-gray-200 rounded p-4 min-w-0 w-full cursor-pointer hover:shadow-md transition-shadow duration-200"
                         style="min-height:50px;height:auto;"
                         onclick="window.location='{{ route('job.details', $job->id) }}'">
                        <a href="{{ route('job.details', $job->id) }}" class="job-title block text-gray-900 hover:text-blue-600 transition-colors duration-150"
                           style="font-size:15px; margin-bottom: 0px;">
                            {{ $job->title }}
                        </a>
                        <p class="company-name text-gray-700"
                           style="font-size: 14px; margin-top: 2px; margin-bottom: 0px; font-weight:600; line-height:1;">
                            {{ $job->employer == null ? '' : $job->employer->company_name }}
                        </p>
                        <p class="location text-gray-600"
                           style="font-size: 12px; margin-top: 1px; margin-bottom: 0px; line-height:1;">
                            {{ $job->location }}
                        </p>
                        <div class="flex justify-between items-end mt-2" style="display: flex; justify-content: space-between;">
                            <p class="text-red-600"
                               style="font-size: 14px; color:red; margin-top: 3px; margin-bottom: 0px; line-height: 1.2;">
                                {{ $job->closing_date }}
                            </p>
                            <p class="text-gray-500"
                               style="font-size: 14px; color:#888888; margin-top: 3px; margin-bottom: 0px; line-height: 1.2;">
                                {{ $job->job_id }}</p>
                        </div>
                    </div>
                @endforeach
            </div>
        @endif

        <!-- Pagination -->
        <div class="pagination-container flex justify-center mt-8" style="margin-top: 20px;">
            <div class="w-full max-w-md">
                {{ $jobs->appends(request()->except('page'))->links('pagination::bootstrap-4') }}
            </div>
        </div>
    @endif
</section>






    </main><br /><br /><br /><br />

    @include('home.footer')

    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const categoryLinks = document.querySelectorAll('.category-link');
            const categoryInput = document.getElementById('categoryInput');
            const searchForm = document.getElementById('searchForm');

            // Handle category selection
            categoryLinks.forEach(link => {
                link.addEventListener('click', function(e) {
                    e.preventDefault();
                    const categoryId = this.dataset.categoryId;

                    // Update the category input and submit the form
                    categoryInput.value = categoryId;
                    searchForm.submit();
                });
            });

            // Handle clear filter
            document.querySelector('.clear-filter')?.addEventListener('click', function(e) {
                e.preventDefault();
                categoryInput.value = '';
                searchForm.submit();
            });
        });
    </script>
    <script>
        $(document).on('click', '.flag-btn', function() {
            let jobId = $(this).data('job-id');
            let button = $(this);

            $.ajax({
                url: `/jobs/${jobId}/flag`,
                method: 'POST',
                headers: {
                    'X-CSRF-TOKEN': '{{ csrf_token() }}'
                },
                success: function(response) {
                    if (response.status === 'flagged') {
                        button.find('i').removeClass('fa-flag-o').addClass('fa-flag');
                    } else {
                        button.find('i').removeClass('fa-flag').addClass('fa-flag-o');
                    }
                    alert(response.message);
                }
            });
        });
    </script>
    <script>
        document.addEventListener("DOMContentLoaded", function() {
            const scrollContainer = document.getElementById("categoriesList");
            const scrollLeftBtn = document.getElementById("scrollLeft");
            const scrollRightBtn = document.getElementById("scrollRight");

            // Debug check if elements are found
            console.log("ScrollContainer:", scrollContainer);
            console.log("ScrollLeftBtn:", scrollLeftBtn);
            console.log("ScrollRightBtn:", scrollRightBtn);

            function scrollCategories(direction) {
                // Get all category links
                const categoryCards = document.querySelectorAll(".category-link");
                console.log("Number of category cards:", categoryCards.length);

                if (categoryCards.length === 0) return;

                // Get the width of one category card plus its margin/gap
                const cardWidth = categoryCards[0].offsetWidth + 4; // 4px for gap
                console.log("Card width:", cardWidth);

                // Changed to scroll only one card width at a time
                const scrollAmount = cardWidth;
                console.log("Scroll amount:", scrollAmount);

                // Perform the scroll
                scrollContainer.scrollBy({
                    left: direction === "right" ? scrollAmount : -scrollAmount,
                    behavior: "smooth"
                });

                // Log current scroll position
                console.log("Current scroll position:", scrollContainer.scrollLeft);
            }

            // Add click event listeners
            scrollLeftBtn.addEventListener("click", function() {
                console.log("Left button clicked");
                scrollCategories("left");
            });

            scrollRightBtn.addEventListener("click", function() {
                console.log("Right button clicked");
                scrollCategories("right");
            });

            // Check if container is scrollable
            console.log("Container total width:", scrollContainer.scrollWidth);
            console.log("Container visible width:", scrollContainer.clientWidth);
        });
    </script>



    <!-- <script>
        let currentAd = 0;
        const ads = document.querySelectorAll('.ads-banner img'); // Select all ad images
        const totalAds = ads.length;

        // Function to change the displayed ad
        function showNextAd() {
            // Hide the current ad
            ads[currentAd].style.opacity = 0;

            // Move to the next ad
            currentAd = (currentAd + 1) % totalAds; // Loop back to the first ad

            // Show the new ad
            ads[currentAd].style.opacity = 1;
        }

        // Change the ad every 10 seconds
        setInterval(showNextAd, 10000); // 10000 ms = 10 seconds
    </script> -->

    <script>
        document.addEventListener("DOMContentLoaded", function() {
            new Swiper('.swiper-container', {
                loop: true, // Enable infinite looping
                autoplay: {
                    delay: 5000, // 3 seconds delay
                    disableOnInteraction: false, // Continue autoplay after user interaction
                },
                pagination: {
                    el: '.swiper-pagination',
                    clickable: true,
                },
                navigation: {
                    nextEl: '.swiper-button-next',
                    prevEl: '.swiper-button-prev',
                },
            });
        });
    </script>


    <script>
        document.addEventListener('DOMContentLoaded', function() {
            // If the page is reloaded (e.g. via the browser's refresh button)
            if (performance.navigation.type === performance.navigation.TYPE_RELOAD) {
                // Redirect to the home route without query parameters.
                window.location.href = "{{ route('home') }}";
            }

            // Clear filters when clicking a home link (if you have any that should clear the filters)
            document.querySelectorAll('a[href="{{ route('home') }}"]').forEach(link => {
                link.addEventListener('click', function(e) {
                    e.preventDefault();
                    clearFilters();
                });
            });

            function clearFilters() {
                // Clear form inputs (assuming these IDs exist)
                document.getElementById('searchInput').value = '';
                document.getElementById('locationInput').value = '';
                document.getElementById('countrySelect').value = '';
                document.getElementById('categoryInput').value = '';
                // Redirect to the home route without any query parameters.
                window.location.href = "{{ route('home') }}";
            }

            // Handle category selection if you're using clickable category links
            const categoryLinks = document.querySelectorAll('.category-link');
            categoryLinks.forEach(link => {
                link.addEventListener('click', function(e) {
                    e.preventDefault();
                    // Update the hidden input with the selected category ID
                    document.getElementById('categoryInput').value = this.dataset.categoryId;
                    // Submit the form so that the URL updates accordingly
                    document.getElementById('searchForm').submit();
                });
            });
        });
    </script>



</body>

</html>
