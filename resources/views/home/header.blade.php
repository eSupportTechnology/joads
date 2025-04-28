<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact Us Popup</title>
    <link rel="stylesheet" href="{{ asset('css/header.css') }}">
    
    <!-- Meta Pixel Code -->
<script>
!function(f,b,e,v,n,t,s)
{if(f.fbq)return;n=f.fbq=function(){n.callMethod?
n.callMethod.apply(n,arguments):n.queue.push(arguments)};
if(!f._fbq)f._fbq=n;n.push=n;n.loaded=!0;n.version='2.0';
n.queue=[];t=b.createElement(e);t.async=!0;
t.src=v;s=b.getElementsByTagName(e)[0];
s.parentNode.insertBefore(t,s)}(window, document,'script',
'https://connect.facebook.net/en_US/fbevents.js');
fbq('init', '902449721836213');
fbq('track', 'PageView');
</script>
<noscript><img height="1" width="1" style="display:none"
src="https://www.facebook.com/tr?id=902449721836213&ev=PageView&noscript=1"
/></noscript>
<!-- End Meta Pixel Code -->

    <style>
        /* Unique Header Styles */
        .unique-header {
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 20px 30px;
            background-color: #ffffff;
            border-bottom: 3px solid #cccbcb;
            position: sticky;
            top: 0;
            height: 45px;
            z-index: 1000;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
        }

        /* Logo */
        .unique-header .logo img {
            max-width: 150px;
        }

        /* Menu Toggle Button */
        .menu-toggle {
            display: none;
            background: none;
            border: none;
            font-size: 24px;
            cursor: pointer;
            position: relative;
            z-index: 1100;
            /* Ensures the toggle button is above other elements */
        }

        .menu-toggle.open::before {
            content: "✖";
            /* Close icon */
            font-size: 24px;
            color: #333;
            position: absolute;
            top: 0;
            left: 0;
            transition: all 0.3s ease-in-out;
        }

        .menu-toggle:not(.open)::before {
            content: "";
            /* Hamburger menu icon */
            font-size: 24px;
            color: #333;
            position: absolute;
            top: 0;
            left: 0;
            transition: all 0.3s ease-in-out;
        }

        /* Navigation Links */
        .unique-nav-links {
            display: flex;
            gap: 20px;
            margin-left: 5%;
        }

        .unique-nav-links a {
            text-decoration: none;
            color: #1267e7;
            font-size: 17px;
        }

        /* Mobile Responsive Styles */
        @media (max-width: 768px) {
            .menu-toggle {
                display: block;
                /* Show the menu toggle on mobile */
                margin-left: 320px;
                margin-top: -30px;


            }

            .profile-dropdown-content {
                margin-left: -50px;
                margin-top: 40px;
                width: auto;
            }

            .unique-nav-links {
                display: none;
                /* Hide navigation by default */
                flex-direction: column;
                gap: 10px;
                background-color: #ffffff;
                position: absolute;
                top: 60px;
                /* Adjust based on header height */
                left: 0;
                right: 0;
                padding: 10px 20px;
                box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
                z-index: 999;
            }

            .unique-nav-links.show {
                display: flex;
                /* Show navigation when toggled */
            }

            .profile-dropdown {
                margin-left: 280px;
                margin-top: -35px;
                border-radius: 5px;
                z-index: 1;

                right: 0;
                /* Align dropdown to the right */
            }
        }

        .profile-letter-circle {
            margin-top: 5px;
        }

        @media screen and (max-width: 768px) {
            .profile-letter-circle {
                margin-top: -50px;
            }
        }
    </style>

</head>

<body>
    <header class="unique-header" style=" border-bottom: 3px solid #cccbcb;  box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);">

        <div class="logo">
            <a href="/">
                <img src="{{ asset('Jobads.png') }}" alt="Logo" class="unique-logo"
                    style="max-height: 60px; margin-left: 20px;">
            </a>

        </div>
        <button class="menu-toggle" aria-label="Toggle Navigation">
            ☰
        </button>
        <nav class="nav-links unique-nav-links" style="margin-left:45px;margin-top:11px">
            <!-- "Post Your Vacancy" as a button -->
            <a href="{{ route('user.postvacancy') }}"
                style="background: linear-gradient(to bottom, #28adce, #18799c); color: white;transition: color 0.3s ease,
            transform 0.3s ease; padding: 10px 10px; text-decoration: none; border-radius: 5px;"
                onmouseover="this.style.transform='translateY(-2px)'; this.style.boxShadow='0 6px 10px rgba(0, 0, 0, 0.15)';"
                onmouseout="this.style.transform='translateY(0)'; this.style.boxShadow='0 4px 6px rgba(0, 0, 0, 0.1)';">
                Post Your Vacancy
            </a>

            <!-- "CV Create" as a button -->
            <a href="{{ route('profile.personal') }}"
                style="background: linear-gradient(to bottom, #28adce, #18799c); color: white;
                      transition: color 0.3s ease, transform 0.3s ease; padding: 10px 10px;
                      text-decoration: none; border-radius: 5px;"
                onmouseover="this.style.transform='translateY(-2px)';
                            this.style.boxShadow='0 6px 10px rgba(0, 0, 0, 0.15)';"
                onmouseout="this.style.transform='translateY(0)';
                           this.style.boxShadow='0 4px 6px rgba(0, 0, 0, 0.1)';">
                CV Create
            </a>


            <!-- Other navigation links -->
            <a href="{{ route('ourservices') }}"
                style="text-decoration: none; color: black; font-size: 16px; transition: color 0.3s ease, transform 0.3s ease;"
                onmouseover="this.style.color='black'; this.style.transform='translateY(-2px)';"
                onmouseout="this.style.color='black'; this.style.transform='translateY(0)';">
                Our Services
            </a>
            <a href="/topemployees"
                style="text-decoration: none;color: black;font-size: 16px;  transition: color 0.3s ease, transform 0.3s ease;"
                onmouseover="this.style.color='black'; this.style.transform='translateY(-2px)';"
                onmouseout="this.style.color='black'; this.style.transform='translateY(0)';">
                Best Employers
            </a>
            <a href="javascript:void(0);" id="contact-us-btn"
                style="text-decoration: none;color: black; font-size: 16px;  transition: color 0.3s ease, transform 0.3s ease;"
                onmouseover="this.style.color='black'; this.style.transform='translateY(-2px)';"
                onmouseout="this.style.color='black'; this.style.transform='translateY(0)';">
                Contact Us
            </a>


        </nav>




        </div>
        <div class="menu">
            @auth
                <!-- For authenticated users -->
                <div class="profile-dropdown">
                    <!-- Display First Letter of User's Name in a Circle -->
                    <div class="profile-letter-circle"
                        style="width: 40px; height: 40px; border-radius: 50%; margin-right:30px;
                background-color: #28adce; color: white; display: flex; align-items: center; justify-content:
                center; font-size: 18px; font-weight: bold;">
                        {{ strtoupper(substr(Auth::user()->name, 0, 1)) }}
                    </div>
                    </span> <!-- Display user name -->
                    <div class="profile-dropdown-content">
                        <a href="{{ route('profile.edit') }}">My Profile</a>
                        <form method="POST" action="{{ route('logout') }}">
                            @csrf
                            <x-dropdown-link :href="route('logout')"
                                onclick="event.preventDefault();
                                        this.closest('form').submit();">
                                {{ __('Log Out') }}
                            </x-dropdown-link>
                        </form>
                    </div>
                </div>
            @endauth

            {{-- @guest
                <!-- For guests -->
                <a href="{{ route('login') }}"class="login-btn">Login</a>
                <a href="{{ route('register') }}" class="signup-btn">Sign Up</a>
            @endguest --}}
        </div>
        <!-- Profile Dropdown -->

    </header>

    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

    <!-- contact us -->
    <script>
        document.addEventListener("DOMContentLoaded", function() {
            document.getElementById("contact-us-btn").addEventListener("click", function() {
                fetch("{{ route('contacts') }}")
                    .then(response => response.text())
                    .then(data => {
                        document.body.insertAdjacentHTML("beforeend", data);
                        document.getElementById("contactPopup").style.display = "block";

                        document.querySelector(".close").addEventListener("click", function() {
                            document.getElementById("contactPopup").remove();
                        });

                        window.addEventListener("click", function(event) {
                            var popup = document.getElementById("contactPopup");
                            if (event.target === popup) {
                                popup.remove();
                            }
                        });
                    });
            });
        });
    </script>

    <script>
        // Select menu toggle button and navigation links
        const menuToggle = document.querySelector('.menu-toggle');
        const navLinks = document.querySelector('.unique-nav-links');

        // Add click event listener to the menu toggle button
        menuToggle.addEventListener('click', () => {
            // Toggle the "show" class on the navigation links
            navLinks.classList.toggle('show');
        });
    </script>

    <script>
        const searchButton = document.getElementById('search-button');
        const searchInput = document.getElementById('search-input');
        let hideTimeout;

        // Function to show the input bar
        function showInputBar() {
            clearTimeout(hideTimeout); // Clear any previous hide timeout
            searchInput.classList.add('visible');
        }

        // Function to hide the input bar
        function hideInputBar() {
            hideTimeout = setTimeout(() => {
                searchInput.classList.remove('visible');
            }, 10000); // Hide after 10 seconds
        }

        // Event listeners for the search button


        searchButton.addEventListener('mouseout', () => {
            hideInputBar();
        });

        // Reset timer when the input is hovered over
        searchInput.addEventListener('mouseover', () => {
            clearTimeout(hideTimeout);
        });

        searchInput.addEventListener('mouseout', () => {
            hideInputBar();
        });
        $(document).ready(function() {
            $('#login-button').on('click', function() {
                window.location.href = '/login';
            });

            $('#signup-button').on('click', function() {
                window.location.href = '/register';
            });
        });
    </script>


</body>

</html>