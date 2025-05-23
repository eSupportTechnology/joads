<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About Us</title>
    <link rel="stylesheet" href="{{ asset('css/home.css') }}">
    <link rel="stylesheet" href="{{ asset('css/header.css') }}">
    <link rel="stylesheet" href="{{ asset('css/aboutus.css') }}">
    <link rel="stylesheet" href="{{ asset('css/footer.css') }}">

    <style>
        .more-content {
            max-height: 0;
            overflow: hidden;
            transition: max-height 0.3s ease;
            text-align: justify;
        }

        .more-content.expanded {
            max-height: 300px;
            text-align: justify;
            /* Adjust this value according to your content */
        }

        .learn-more {
            cursor: pointer;
            display: inline-block;
            padding: 10px 20px;
            background-color: #5a67d8;
            color: #fff;
            text-decoration: none;
            border-radius: 4px;
            font-size: 14px;
            text-align: justify;
        }

        .learn-more:hover {
            background-color: #4c51bf;
        }

        /* Vision and Mission Section Styling */
        .vision-mission-section {
            margin-top: 50px;
        }

        .vision-mission-section h2 {
            font-size: 24px;
            margin-bottom: 15px;
        }

        .vision-mission-section p {
            font-size: 16px;
            line-height: 1.6;
        }
        .text-center {
            text-align: left;
        }
        .box {
            padding: 20px;
            text-align: left;
            background-color: #fff;
            padding: 40px;
            border-radius: 8px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        
        }
        
            #description {
        text-align: justify;
        width: 650px;
        margin: 0 auto; /* Center the paragraph on larger screens */
    }

    /* Responsive Design for Smaller Screens */
    @media (max-width: 768px) {
        #description {
            width: 90%; /* Adjust width to fit most of the screen */
        }
    }

    @media (max-width: 480px) {
        #description {
            width: 100%; /* Full width for very small screens */
            padding: 10px; /* Add padding for better readability */
        }
    }
        
    </style>
</head>

<body>
    @include('home.header')
    <div class="container">
        <div class="about-section">
            <div class="content">
                <h1>{{ $aboutUs->title }}</h1> <!-- Dynamically display the title -->

                <!-- Show part of the description initially -->
                <p id="description" class="description">
                    {{ Str::limit($aboutUs->description, 1000) }}
                </p>
                
                <!-- Full description hidden initially -->
                <div id="more-content" class="more-content" style="text-align: justify;width:650px">
                    <p id="full-description"  >{{ $aboutUs->description }}</p> <!-- Full description -->
                </div>

                <!-- Toggle button for showing/hiding full content -->
                <a href="#" id="learn-more-btn" class="learn-more">Learn More</a>
            </div>
            <div class="illustration">
                <img src="{{ asset('Jobads.png') }}" style="width: 150px;padding-right: 250px;padding-left:300px" alt="Illustration">
            </div>
        </div>

    </div>

    @php
    // Fetch the first record of the Vision and Mission
    $vissionMission = \App\Models\VissionMission::first();
@endphp

<div class="container">
    <div class="box">
        <h2>Our Vision</h2>
        <p style="font-size: 16px; color: #666;">
            {{ $vissionMission->vission ?? 'Vision not available' }}
        </p> <!-- Dynamically display Vision content -->

        <h2>Our Mission</h2>
        <p style="font-size: 16px; color: #666;">
            {{ $vissionMission->mission ?? 'Mission not available' }}
        </p> <!-- Dynamically display Mission content -->
    </div>
</div>


    @include('home.footer')

    <script>
        document.addEventListener('DOMContentLoaded', function () {
            const learnMoreBtn = document.getElementById('learn-more-btn');
            const moreContent = document.getElementById('more-content');
            const description = document.getElementById('description');
    
            // Event listener for the Learn More button
            learnMoreBtn.addEventListener('click', function (e) {
                e.preventDefault();
                if (moreContent.classList.contains('expanded')) {
                    moreContent.classList.remove('expanded');
                    learnMoreBtn.textContent = 'Learn More';
                    description.style.display = 'block'; // Show part of the description
                } else {
                    moreContent.classList.add('expanded');
                    learnMoreBtn.textContent = 'Show Less';
                    description.style.display = 'none'; // Hide part of the description when expanded
                }
            });
        });
    </script>
    </body>

</html>
