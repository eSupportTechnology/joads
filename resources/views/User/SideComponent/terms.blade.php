<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Terms & Conditions</title>
    <link rel="stylesheet" href="{{ asset('css/privacy.css') }}">
    <link rel="stylesheet" href="{{ asset('css/home.css') }}">
    <link rel="stylesheet" href="{{ asset('css/header.css') }}">
    <link rel="stylesheet" href="styles.css">

    <style>
        /* Logo positioning */
        .logo-container {
            position: absolute;
            top: 130px; /* Increase this value to add more space between the logo and the header */
            right: 570px;
        }

        .logo {
            width: 150px; /* Adjust size as needed */
            height: auto;
        }

        /* Optional: Add margin to the header to create consistent spacing */
        .privacy-policy-header {
        }

        .justify-text {
            text-align: justify;
        }
        

        /* Footer styling */
        /* Footer Container */
.footer-container {
    background-color: #18799c; /* Blue background */
    color: white; /* White text */
    padding: 20px; /* Padding around the content */
    text-align: center; /* Center align the content */
}

/* Footer Title */
.footer-title {
    font-size: 24px; /* Larger font size for the title */
    margin-bottom: 15px; /* Space below the title */
    font-weight: bold; /* Bold text */
}

/* Footer List */
.footer-list {
    list-style-type: none; /* Remove bullet points */
    padding: 0; /* Remove padding */
    margin: 0; /* Remove margin */
}

/* Footer List Items */
.footer-list li {
    font-size: 16px; /* Font size for list items */
    margin: 5px 0; /* Add margin between list items */
}

/* Footer Email */
.footer-email {
    font-style: italic; /* Italicize the email */
    margin-bottom: 10px; /* Add space below email */
}

/* Footer Phone */
.footer-phone {
    font-weight: 600; /* Make phone numbers bold */
    margin-bottom: 5px; /* Add space between phone items */
}

/* Hover effect for footer items */
.footer-list li:hover {
    background-color: #18799c; /* Darker blue on hover */
    cursor: pointer; /* Pointer cursor on hover */
    padding: 5px 0; /* Add padding on hover for effect */
}

/* Footer for small screens */
@media (max-width: 600px) {
    .footer-container {
        padding: 15px; /* Reduce padding for smaller screens */
    }
    .footer-title {
        font-size: 20px; /* Adjust title font size */
    }
    .footer-list li {
        font-size: 14px; /* Adjust list item font size */
    }
}

    </style>
</head>
<header class="privacy-policy-header" >
    <h1>Terms & Conditions</h1>
</header>

<body class="privacy-policy-body">
    <main class="privacy-policy-main" style="padding-top:100px">


        <!-- Logo in the top right corner -->
        <div class="logo-container">
            <img src="{{ asset('Jobads.png') }}" alt="Logo" class="logo">
        </div>
        <div class="container">
            <div class="privacy-policy-">

        
                <!-- Dynamic Navigation Menu -->
                <nav>
                    <h2 style="color: #0056b3"> Terms and Conditions</h2>
                    <p >Welcome to JOBADS.LK. 
                        These Terms and Conditions govern your use of our website and the payment process for services provided through our platform. By accessing and using our website, you agree to comply with these terms. Please read them carefully before proceeding with any transactions.</p>
    
                </nav>
        
                <!-- Dynamic Content Sections -->
                @foreach ($terms as $term)
                    <div id="term-{{ $term['number'] }}" class="section" >
                        <h2 style="color: #0056b3" >{{ $term->title}}.</h2>
                        <p style="text-align: justify;">{{ $term->content }}</p>
                    </div>
                @endforeach
            </div>
        
        
        </div>
    
    </main>
    <!-- Footer with contact information -->
<footer class="footer-container">
    <h2 class="footer-title">Contact Us</h2>
    <ul class="footer-list">
        @php
                use App\Models\ContactUs;
                $contacts = contactus::all();
        @endphp
        <li class="footer-email">Email: {{ $contacts->first()->email ?? 'Not Available' }}</li>
        @foreach ($contacts as $contact)
            <li class="footer-phone">Phone: {{ $contact->phone }}</li>
        @endforeach
    </ul>
</footer>

</body>

</html>
