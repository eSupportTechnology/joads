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
        }

        .more-content.expanded {
            max-height: 300px;
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
    </style>
</head>

<body>
    @include('home.header')
    <div class="container">
        <div class="about-section">
            <div class="content">
                <h1>{{ $aboutUs->title }}</h1> <!-- Dynamically display the title -->

                <!-- Show part of the description initially -->
                <p id="description" class="description">{{ Str::limit($aboutUs->description, 150) }}</p>

                <!-- Full description hidden initially -->
                <div id="more-content" class="more-content">
                    <p id="full-description">{{ $aboutUs->description }}</p> <!-- Full description -->
                </div>

                <!-- Toggle button for showing/hiding full content -->
                <a href="#" id="learn-more-btn" class="learn-more">Learn More</a>
            </div>
            <div class="illustration">
                <img src="{{ asset('Jobads.png') }}" style="width: 100px;" alt="Illustration">
            </div>
        </div>

    </div>

    @php
    // Fetch the first record of the Vision and Mission
    $vissionMission = \App\Models\VissionMission::first();
@endphp

<div class="container">
    <div class="about-section" style="padding-top:10px ;display:flex;flex-direction:column">
        <h2>Our Vision</h2>
        <p>{{ $vissionMission->vission ?? 'Vision not available' }}</p> <!-- Dynamically display Vision content -->

        <h2>Our Mission</h2>
        <p>{{ $vissionMission->mission ?? 'Mission not available' }}</p> <!-- Dynamically display Mission content -->
    </div>
</div>

    @include('home.footer')

    <script>
        document.addEventListener('DOMContentLoaded', function () {
            const learnMoreBtn = document.getElementById('learn-more-btn');
            const moreContent = document.getElementById('more-content');
            const description = document.getElementById('description');
            const fullDescription = document.getElementById('full-description');

            // Function to add line breaks only at periods and apostrophes (but not in domains like Jobads.lk)
            function addLineBreaks(text) {
                // Prevent line breaks for "jobads.lk"
                text = text.replace(/(jobads\.lk)([^a-zA-Z0-9])/gi, function (match, p1, p2) {
                    return p1 + "###" + p2; // Add a temporary marker to ignore line breaks
                });

                // Add line breaks only after periods (.) and apostrophes (') - but not after "Jobads.lk"
                text = text.replace(/([.'!?])\s+/g, '$1<br>');  // Only break after period or apostrophe, without breaking "Jobads.lk"

                // Revert the temporary marker back to normal "jobads.lk"
                text = text.replace(/###/g, ".");

                return text;
            }

            // Apply line breaks to the full description
            fullDescription.innerHTML = addLineBreaks(fullDescription.innerHTML);

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
