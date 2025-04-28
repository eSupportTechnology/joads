<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>{{ $job->title }} - Job Details</title>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/js/all.min.js"></script>


    <!-- Slick Slider CSS -->
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/slick-carousel/slick/slick.css" />
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/slick-carousel/slick/slick-theme.css" />

    <!-- jQuery (Required for Slick Slider) -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <!-- Slick Slider JS -->
    <script src="https://cdn.jsdelivr.net/npm/slick-carousel/slick/slick.min.js"></script>

    <link rel="stylesheet" href="{{ asset('css/home.css') }}">
    <link rel="stylesheet" href="{{ asset('css/footer.css') }}">
    <link rel="stylesheet" href="{{ asset('css/header.css') }}">




    <style>
        /* ======== General Styles ======== */
        body {
            font-family: Arial, sans-serif;
            background-color: #f7fafc;
            margin: 0;
            padding: 0;
            overflow-x: hidden;
            /* Prevent horizontal scroll */
        }

        /* ======== Layout Container ======== */
        .layout-container {
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
            width: 100%;
            max-width: 1400px;
            margin: auto;
            padding: 20px;
        }

        /* ======== Advertisement Section (Left Side) ======== */
        .advertising-section {
            width: 30%;
            max-width: 350px;
            padding: 20px;
            order: -1;
            /* Moves it to the left */
            overflow: hidden;
            /* Ensures no extra scroll */
        }

        /* Advertisement Card Styling */
        .advertising-card {
            text-align: center;
            margin-bottom: 20px;
        }

        .advertising-card img {
            width: 100%;
            max-height: 400px;
            object-fit: contain;
            border-radius: 8px;
            margin-bottom: 10px;
        }



        /* ======== Job Details Section (Right Side) ======== */
        .showcontainer {
            width: 70%;
            max-width: 1000px;
            overflow: hidden;
            /* Prevents content from expanding */
        }

        /* Job Card Styling */
        .job-cardn {
            background-color: white;
            border-radius: 20px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            overflow: hidden;
        }

        /* Header Section */
        .job-cardn .header {
            position: relative;
        }

        .job-cardn .header img {
            width: 100%;
            height: auto;
            object-fit: cover;
            transition: transform 0.3s ease;
        }

        .job-cardn .header img:hover {
            transform: scale(1.05);
        }

        /* Content */
        .job-cardn .content {
            padding: 30px;
        }

        /* Job Details Grid */
        .job-cardn .details {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 20px;
            margin-bottom: 40px;
        }

        .job-cardn .details .detail {
            display: flex;
            align-items: center;
            color: #4a5568;
        }

        .job-cardn .details .detail i {
            margin-right: 8px;
            color: #3182ce;
        }

        /* ======== Apply Now Button ======== */
        .btn-apply {
            background-color: #007bff;
            /* Primary blue */
            color: white;
            font-size: 1.2rem;
            padding: 12px 25px;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            transition: background-color 0.3s ease, transform 0.2s ease;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            display: inline-block;
            font-weight: bold;
            text-align: center;
        }

        /* Hover Effect */
        .btn-apply:hover {
            background-color: #0056b3;
            /* Darker blue */
            transform: scale(1.05);
            box-shadow: 0 6px 10px rgba(0, 0, 0, 0.15);
        }

        /* Active (Click) Effect */
        .btn-apply:active {
            transform: scale(0.98);
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
        }

        /* Animation */
        @keyframes button-bounce {

            0%,
            100% {
                transform: translateY(0);
            }

            50% {
                transform: translateY(-3px);
            }
        }

        #apply {
            animation: button-bounce 1s infinite alternate;
        }

        /* ======== Responsive Button Adjustments ======== */
        /* Medium Screens (Tablets) */
        @media (max-width: 992px) {
            .btn-apply {
                font-size: 1.1rem;
                padding: 10px 22px;
            }
        }

        /* Small Screens (Phones) */
        @media (max-width: 768px) {
            .btn-apply {
                width: 100%;
                /* Make it full width */
                font-size: 1rem;
                padding: 12px;
            }
        }

        /* Very Small Screens */
        @media (max-width: 480px) {
            .btn-apply {
                font-size: 0.9rem;
                padding: 10px;
            }
        }

        /* Large Screens (Desktops & Laptops) */
        @media (max-width: 1200px) {
            .advertising-section {
                width: 35%;
                /* Increase ad section width */
            }

            .showcontainer {
                width: 65%;
            }
        }

        /* Tablets (768px - 992px) */
        @media (max-width: 992px) {
            .layout-container {
                flex-direction: column;
                /* Stack elements vertically */
                align-items: center;
            }

            .advertising-section {
                width: 100%;
                max-width: 100%;
                text-align: center;
                margin-bottom: 20px;
            }

            .showcontainer {
                width: 100%;
                max-width: 100%;
            }
        }

        /* Mobile Screens (Below 768px) */
        @media (max-width: 768px) {
            .layout-container {
                flex-direction: column;
                /* Stacks sections */
                align-items: center;
                padding: 10px;
            }

            .advertising-section {
                width: 100%;
                max-width: 100%;
                padding: 10px;
            }

            .showcontainer {
                width: 100%;
                padding: 10px;
            }

            .job-cardn {
                padding: 20px;
            }
        }

        /* Small Phones (Below 480px) */
        @media (max-width: 480px) {
            .layout-container {
                padding: 5px;
            }

            .advertising-section {
                width: 100%;
                text-align: center;
                padding: 5px;
            }

            .advertising-card img {
                width: 100%;
                height: auto;
            }

            .showcontainer {
                width: 100%;
                padding: 5px;
            }

            .job-cardn {
                padding: 15px;
            }

            body {
                overflow-x: hidden;
                /* Prevents horizontal scroll on small screens */
            }
        }
    </style>


    </style>
    <!-- Swiper CSS -->
    <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css">


    <style>
        .ads-container {
            width: 360px;
            overflow: hidden;
            max-height: 700px;
            position: sticky;
            top: 110;
            /* Stays fixed at the top until it reaches the bottom */
            right: auto;
            left: auto;
            z-index: 9999;
            transition: transform 0.3s ease-in-out;
        }

        /* Style the swiper container to ensure proper layout */
        .swiper-container.ads-banner {
            width: 100%;
            height: auto;
            /* Ensures the height adjusts based on content */
        }

        /* Adjust the image to fit without distortion */
        .swiper-slide.banner-item img {
            width: 100%;
            height: auto;
            max-height: 600px;
            /* You can adjust this value */
            object-fit: contain;
        }

        /* Adjust the text if no banners are available */
        .swiper-slide p {
            text-align: center;
            font-size: 16px;
            color: #777;
            padding: 20px;
        }

        /* For larger screens: Fixed position for the banner */
        @media (min-width: 1024px) {
            .ads-container {
                position: fixed;
                /* Fix the banner */
                top: 110px;
                /* Position from top of the page */
                right: 0;
                left: 80px;
                z-index: 9999;
                /* Ensure it stays on top */
                width: 360px;
                /* Width to limit the banner's size */
                max-height: 700px;
                /* Max height for the banner */
            }

            .swiper-container.ads-banner {
                height: auto;
            }
        }



        @media (max-width: 1023px) {
            .ads-container {
                position: relative;
                /* Reset to relative */
                margin-bottom: 20px;
                /* Add space if needed */
                width: 100%;
                /* Full width for small screens */
            }
        }
    </style>
</head>

<body>
    @include('home.header')

    <main>
        <div class="layout-container">
            <!-- Advertising Section -->
            <aside class="advertising-section">


                <div class="ads-container">
                    <div class="swiper-container ads-banner">
                        <div class="swiper-wrapper">
                            @forelse ($banners as $banner)
                                <div class="swiper-slide banner-item">
                                    <img src="{{ asset('storage/app/public/' . $banner->image) }}"
                                        alt="{{ $banner->title }}">
                                </div>
                            @empty
                                <div class="swiper-slide ">
                                    <p>No banners available.</p>
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
            </aside>


            <!-- Job Details Section -->
            <div class="showcontainer">
                <div class="job-cardn">
                    @if (session('success'))
                        <div class="alert alert-success"
                            style="background-color: #d4edda; color: #155724; padding: 10px; border-radius: 5px; border: 1px solid #c3e6cb;">
                            {{ session('success') }}
                        </div>
                    @endif

                    <!-- Header Section -->
                    <div class="header">
                        @if (!empty($job->image))
                            <img src="{{ asset('storage/app/public/' . $job->image) }}" alt="Company banner">
                            <div class="overlay"></div>
                        @endif
                    </div>

                    <!-- Content Section -->
                    <div class="content">
                        <!-- Job Title and Company -->
                        <small> JOB ID : {{ $job->job_id }}</small>
                        <div class="job-title">
                            
                            <h1>{{ $job->title }}</h1>
                            <p class="company-name">{{ $job->employer->company_name }}</p>
                        </div>
                        <p>
                            <i class="fas fa-eye"></i> {{ $job->view_count }} Views
                        </p>

                        <!-- Key Details -->
                        <div class="details">
                            @if (!empty($job->location))
                                <div class="detail">
                                    <i class="fas fa-map-marker-alt"></i>&nbsp;&nbsp;
                                    <span>{{ $job->location }}</span>
                                </div>
                            @endif
                            @if (!empty($job->country))
                                <div class="detail">
                                    <i class="fas fa-map-marker-alt"></i>&nbsp;&nbsp;
                                    <span>{{ $job->country->name }}</span>
                                </div>
                            @endif
                            @if (!empty($job->created_at))
                                <div class="detail">
                                    <i class="fas fa-calendar"></i>&nbsp;&nbsp;
                                    <span>Posted: {{ $job->created_at->format('M d, Y') }}</span>
                                </div>
                            @endif
                            @if (!empty($job->salary_range))
                                <div class="detail">
                                    <i class="fas fa-money-bill-wave"></i>&nbsp;&nbsp;
                                    <span>Salary: {{ number_format($job->salary_range, 2) }}</span>
                                </div>
                            @endif
                            @if (!empty($job->closing_date))
                                <div class="detail">
                                    <i class="fas fa-hourglass-end"></i>&nbsp;&nbsp;
                                    <span>Closes: {{ $job->closing_date }}</span>
                                </div>
                            @endif
                        </div>

                        <!-- Description -->
                        @if (!empty($job->description))
                            <div class="description">
                                <h2>Job Description</h2>
                                <p>{{ $job->description }}</p>
                            </div>
                        @endif

                        <!-- Requirements -->
                        @if (!empty($job->requirements))
                            <div class="requirements">
                                <h2>Requirements</h2>
                                <p>{{ $job->requirements }}</p>
                            </div>
                        @endif
                    </div>

                    <!-- Buttons -->
                    <div class="btn-group mb-4">
                        <button class="btn btn-apply" id="apply">Apply Now</button>
                        @auth
                            <button class="flag-btn" title="flag button" data-job-id="{{ $job->id }}">
                                <i
                                    class="fa-solid {{ auth()->user()->flaggedJobs->contains($job->id) ? 'fa-flag' : 'fa-regular fa-flag' }}"></i>
                            </button>
                        @endauth
                    </div>
                </div>
                <div id="componentContainer-apply"></div>
            </div>
        </div>

    </main>

    <!-- Apply Options Content -->


    <!-- Script for Dynamic Component Loading -->
    <script>
        $(document).ready(function() {
            $('#apply').on('click', function() {
                const jobId = '{{ $job->id }}';
                $('#componentContainer-apply').load(`/apply/${jobId}`);
            });

            $(document).on('click', '.flag-btn', function() {
                const jobId = $(this).data('job-id');
                const button = $(this);

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
        });
    </script>

    <script>
        $(document).ready(function() {
            $('.advertising-slider').slick({
                dots: true, // Add navigation dots
                infinite: true, // Enable infinite loop
                speed: 500, // Transition speed
                slidesToShow: 1, // Number of slides to show
                slidesToScroll: 1, // Number of slides to scroll
                autoplay: true, // Enable autoplay
                autoplaySpeed: 3000, // Autoplay interval in milliseconds
                arrows: true, // Show next/prev arrows
            });
        });
    </script>
    <!-- Swiper JS -->
    <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
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
        document.addEventListener("DOMContentLoaded", function() {
            const adsContainer = document.querySelector(".ads-container");
            const showContainer = document.querySelector(".showcontainer");

            function updateAdsPosition() {
                const showContainerRect = showContainer.getBoundingClientRect();
                const adsHeight = adsContainer.offsetHeight;
                const showContainerBottom = showContainerRect.bottom;
                const windowHeight = window.innerHeight;

                let newTransform = "translateY(0px)"; // Default position (sticky)

                if (showContainerBottom < adsHeight + 50) {
                    // Move smoothly to the bottom when reaching the end
                    newTransform = `translateY(${showContainerBottom - adsHeight - 50}px)`;
                }

                adsContainer.style.transform = newTransform;
            }

            window.addEventListener("scroll", updateAdsPosition);
            window.addEventListener("resize", updateAdsPosition);
            updateAdsPosition(); // Run on load
        });
    </script>



</body>

</html>