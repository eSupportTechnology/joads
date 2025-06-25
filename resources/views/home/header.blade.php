<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact Us Popup</title>
    <link rel="stylesheet" href="{{ asset('css/header.css') }}">

    <!-- Meta Pixel Code -->
    <script>
        ! function(f, b, e, v, n, t, s) {
            if (f.fbq) return;
            n = f.fbq = function() {
                n.callMethod ?
                    n.callMethod.apply(n, arguments) : n.queue.push(arguments)
            };
            if (!f._fbq) f._fbq = n;
            n.push = n;
            n.loaded = !0;
            n.version = '2.0';
            n.queue = [];
            t = b.createElement(e);
            t.async = !0;
            t.src = v;
            s = b.getElementsByTagName(e)[0];
            s.parentNode.insertBefore(t, s)
        }(window, document, 'script',
            'https://connect.facebook.net/en_US/fbevents.js');
        fbq('init', '902449721836213');
        fbq('track', 'PageView');
    </script>
    <noscript><img height="1" width="1" style="display:none"
            src="https://www.facebook.com/tr?id=902449721836213&ev=PageView&noscript=1" /></noscript>
    <!-- End Meta Pixel Code -->

    <style>
        /* Unique Header Styles */
        .unique-header {
            display: flex;
            align-items: center;
            padding: 15px 30px;
            background-color: #ffffff;
            border-bottom: 3px solid #cccbcb;
            position: sticky;
            top: 0;
            min-height: 70px;
            z-index: 1000;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
        }

        /* Logo */
        .unique-header .logo img {
            max-height: 60px;
            width: auto;
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
            padding: 5px;
            order: 2;
        }

        .menu-toggle.open::before {
            font-size: 20px;
            color: #333;
        }

        .menu-toggle:not(.open)::before {
            font-size: 24px;
            color: #333;
        }

        /* Navigation Links */
        .unique-nav-links {
            display: flex;
            gap: 20px;
            align-items: center;
            margin-left: 100px;
            margin-top: 11px;
            z-index: 100;
        }

        .unique-nav-links a {
            text-decoration: none;
            color: black;
            font-size: 16px;
            transition: color 0.3s ease, transform 0.3s ease;
        }

        .unique-nav-links a:hover {
            color: black;
            transform: translateY(-2px);
        }

        /* Social Icons */
        .social-icons {
            display: flex;
            gap: 8px;
        }

        .social-icons a {
            text-decoration: none;
            color: #18799c;
            transition: transform 0.3s ease;
        }

        .social-icons a:hover {
            transform: scale(1.1);
        }

        .social-icons img {
            width: 25px;
            height: auto;
        }

        /* Profile Section */
        .menu {
            display: flex;
            align-items: center;
            order: 3;
        }

        .profile-dropdown {
            position: relative;
        }

        .profile-letter-circle {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            margin-left: 10px;
            background-color: #28adce;
            color: white;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 18px;
            font-weight: bold;
            cursor: pointer;
        }

        .profile-dropdown-content {
            display: none;
            position: absolute;
            right: 0;
            top: 100%;
            background: white;
            min-width: 160px;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
            border-radius: 5px;
            padding: 10px 0;
            z-index: 1001;
        }

        .profile-dropdown:hover .profile-dropdown-content {
            display: block;
        }

        .profile-dropdown-content a {
            color: black;
            padding: 8px 16px;
            text-decoration: none;
            display: block;
        }

        .profile-dropdown-content a:hover {
            background-color: #f1f1f1;
        }

        /* Mobile Responsive Styles */
        @media (max-width: 768px) {
            .unique-header {
                flex-wrap: wrap;
                padding: 10px 15px;
                min-height: 60px;
            }

            .logo {
                order: 1;
            }

            .logo img {
                max-height: 45px;
                margin-left: 0 !important;
            }

            .menu-toggle {
                display: block;
                order: 2;
                margin-left: auto;
                margin-right: 15px;
            }

            .menu {
                order: 3;
                margin-left: 0;
            }

            .profile-letter-circle {
                width: 35px;
                height: 35px;
                font-size: 16px;
                margin-right: 15px;
            }

            .unique-nav-links {
                display: none;
                order: 4;
                flex-direction: column;
                width: 100%;
                margin: 0;
                height: auto;
                background-color: #ffffff;
                position: absolute;
                top: 100%;
                left: 0;
                right: 0;
                padding: 20px;
                box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
                z-index: 999;
                gap: 15px;
            }

            .unique-nav-links.show {
                display: flex;
            }

            .unique-nav-links a {
                padding: 12px 0;
                border-bottom: 1px solid #eee;
                text-align: center;
                width: 100%;
                margin: 0;
            }

            .unique-nav-links a[href*="postvacancy"],
            .unique-nav-links a[href*="profile.personal"] {
                border-radius: 5px;
                border-bottom: none;
                margin: 5px 0;
            }

            .social-icons {
                justify-content: center;
                padding: 15px 0;
                border-top: 1px solid #eee;
                margin-top: 10px;
                width: 100%;
            }

            .social-icons img {
                width: 25px;
                height: auto;
            }

            .profile-dropdown-content {
                right: 0;
                top: 100%;
                min-width: 140px;
            }
        }

        @media (max-width: 480px) {
            .unique-header {
                padding: 8px 10px;
            }

            .logo img {
                max-height: 40px;
            }

            .profile-letter-circle {
                width: 30px;
                height: 30px;
                font-size: 14px;
                margin-right: 10px;
            }

            .unique-nav-links a {
                font-size: 14px;
                padding: 10px 0;
            }

            .social-icons img {
                width: 25px;
                height: 25px;
            }
        }

        /* Desktop - hide menu toggle */
        @media (min-width: 769px) {
            .menu-toggle {
                display: none !important;
            }
            .nav-links {
                display: flex !important;
            }
            .social-icons {
                display: flex !important;
            }
        }

        @media (max-width: 769px) {
            .nav-links {
                display: none !important;
            }
            .social-icons {
                display: none !important;
            }
            .first_link {
                padding-left: 0;
            }
        }
        .unique-header {
            width: 100%;
            background-color: #fff;
            padding: 4px 20px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        .header-container {
            display: flex;
            align-items: center;
            justify-content: space-between; /* Push logo to left, social icons to right */
        }

        .logo img {
            max-height: 60px;
        }

        .nav-links {
            display: flex;
            gap: 15px;
            align-items: center;
        }

        .social-icons {
            margin-top: 14px;
            padding-right: 20px;
            display: flex;
            gap: 8px;
            align-items: center;
            margin-left: auto;
        }

        .social-icons img {
            width: 24px;
            height: 24px;
        }
        @media (max-width: 1242px) {
            /* .first_link {
                padding-left: 50px;
            } */
        }
        /* .first_link {
            padding-left: 60px;
        } */

    </style>

</head>

<body>
    <header class="unique-header">
        <div class="header-container">
            <div class="logo">
                <div class="logo">
                    <a href="/">
                        <img src="{{ asset('Jobads.png') }}" alt="Logo" class="unique-logo"
                            style="max-height: 60px; margin-left: 20px;">
                    </a>
                </div>
            </div>



            <nav class="nav-links unique-nav-links">
                <!-- "Post Your Vacancy" as a button -->
                <a href="{{ route('user.postvacancy') }}"
                    style="background: linear-gradient(to bottom, #28adce, #18799c); color: white;transition: color 0.3s ease,
                transform 0.3s ease; padding: 10px 10px; text-decoration: none; border-radius: 5px; white-space: nowrap;"
                    onmouseover="this.style.transform='translateY(-2px)'; this.style.boxShadow='0 6px 10px rgba(0, 0, 0, 0.15)';"
                    onmouseout="this.style.transform='translateY(0)'; this.style.boxShadow='0 4px 6px rgba(0, 0, 0, 0.1)';">
                    Post Your Vacancy
                </a>

                <!-- "CV Create" as a button -->
                <a href="{{ route('profile.personal') }}"
                    style="background: linear-gradient(to bottom, #28adce, #18799c); color: white;
                        transition: color 0.3s ease, transform 0.3s ease; padding: 10px 10px;
                        text-decoration: none; border-radius: 5px; white-space: nowrap;"
                    onmouseover="this.style.transform='translateY(-2px)';
                                this.style.boxShadow='0 6px 10px rgba(0, 0, 0, 0.15)';"
                    onmouseout="this.style.transform='translateY(0)';
                            this.style.boxShadow='0 4px 6px rgba(0, 0, 0, 0.1)';">
                    Create Free CV
                </a>

                <!-- Other navigation links -->
                <a class="first_link" href="{{ route('ourservices') }}"
                    style="text-decoration: none; color: black; font-size: 16px; transition: color 0.3s ease, transform 0.3s ease; white-space: nowrap;"
                    onmouseover="this.style.color='black'; this.style.transform='translateY(-2px)';"
                    onmouseout="this.style.color='black'; this.style.transform='translateY(0)';">
                    Direct Recruitment
                </a>
                <a href="/topemployees"
                    style="text-decoration: none;color: black;font-size: 16px;  transition: color 0.3s ease, transform 0.3s ease; white-space: nowrap;"
                    onmouseover="this.style.color='black'; this.style.transform='translateY(-2px)';"
                    onmouseout="this.style.color='black'; this.style.transform='translateY(0)';">
                    Best Employers
                </a>
                <a href="javascript:void(0);" id="contact-us-btn"
                    style="text-decoration: none;color: black; font-size: 16px;  transition: color 0.3s ease, transform 0.3s ease; white-space: nowrap; padding-right:6px;"
                    onmouseover="this.style.color='black'; this.style.transform='translateY(-2px)';"
                    onmouseout="this.style.color='black'; this.style.transform='translateY(0)';">
                    Contact Us
                </a>

                <!-- Social icons -->


                        @auth
                            <!-- For authenticated users -->
                            <div class="profile-dropdown">
                                <!-- Display First Letter of User's Name in a Circle -->
                                <div class="profile-letter-circle">
                                    {{ strtoupper(substr(Auth::user()->name, 0, 1)) }}
                                </div>
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
                    </div>
            </nav>
            <div class="social-icons">
                <a href="https://www.linkedin.com/company/jobads-lk/?viewAsMember=true" target="_blank">
                    <img src="{{ asset('linkedin.jpeg') }}" alt="LinkedIn">
                </a>
                <a href="https://www.facebook.com/jobads.lkJSG" target="_blank">
                    <img src="{{ asset('facebook.jpeg') }}" alt="Facebook">
                </a>
                <a href="https://www.instagram.com/jobadslk/" target="_blank">
                    <img src="{{ asset('Instagram.jpeg') }}" alt="Instagram">
                </a>
                <a href="https://www.tiktok.com/@jobads.lk" target="_blank">
                    <img src="{{ asset('tiktok.jpeg') }}" alt="TikTok">
                </a>

                <div class="menu">
                    @auth
                        <!-- For authenticated users -->
                        <div class="profile-dropdown">
                            <!-- Display First Letter of User's Name in a Circle -->
                            <div class="profile-letter-circle">
                                {{ strtoupper(substr(Auth::user()->name, 0, 1)) }}
                            </div>
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
                </div>
            </div>
            <button class="menu-toggle" aria-label="Toggle Navigation">
                ☰
            </button>
        </div>
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
        // Mobile menu toggle functionality
                document.addEventListener('DOMContentLoaded', function () {
            const menuToggle = document.querySelector('.menu-toggle');
            const navElements = document.querySelectorAll('.nav-links, .social-icons');

            if (menuToggle && navElements.length > 0) {
                menuToggle.addEventListener('click', function () {
                    navElements.forEach(el => {
                        const currentDisplay = getComputedStyle(el).display;
                        if (currentDisplay === 'none') {
                            el.setAttribute('style', 'display: flex !important;');
                        } else {
                            el.setAttribute('style', 'display: none !important;');
                        }
                    });
                });

                // Close menu when clicking outside
                document.addEventListener('click', function (event) {
                    if (!menuToggle.contains(event.target) && ![...navElements].some(el => el.contains(event.target))) {
                        navElements.forEach(el => {
                            el.setAttribute('style', 'display: none !important;');
                        });
                    }
                });

                // Close when clicking any nav or social link
                navElements.forEach(container => {
                    container.querySelectorAll('a').forEach(link => {
                        link.addEventListener('click', function () {
                            navElements.forEach(el => {
                                el.setAttribute('style', 'display: none !important;');
                            });
                        });
                    });
                });
            }
        });



    </script>

    <script>
        const searchButton = document.getElementById('search-button');
        const searchInput = document.getElementById('search-input');
        let hideTimeout;

        // Function to show the input bar
        function showInputBar() {
            clearTimeout(hideTimeout);
            if (searchInput) {
                searchInput.classList.add('visible');
            }
        }

        // Function to hide the input bar
        function hideInputBar() {
            hideTimeout = setTimeout(() => {
                if (searchInput) {
                    searchInput.classList.remove('visible');
                }
            }, 10000);
        }

        // Event listeners for the search button
        if (searchButton) {
            searchButton.addEventListener('mouseout', () => {
                hideInputBar();
            });
        }

        // Reset timer when the input is hovered over
        if (searchInput) {
            searchInput.addEventListener('mouseover', () => {
                clearTimeout(hideTimeout);
            });

            searchInput.addEventListener('mouseout', () => {
                hideInputBar();
            });
        }

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
