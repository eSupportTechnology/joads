<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Terms & Conditions</title>

    <link rel="stylesheet" href="{{ asset('css/home.css') }}">
    <link rel="stylesheet" href="{{ asset('css/header.css') }}">
    <link rel="stylesheet" href="{{ asset('css/terms.css') }}">

    <style>
        /* Logo positioning */
        .logo-container {
            position: absolute;
            top: 100px; /* Increase this value to add more space between the logo and the header */
            right: 50px;
            z-index: 1000; /* Ensure it's above other elements */
        }

        .logo {
            width: 100px; /* Adjust size as needed */
            height: auto;
        }

        /* Optional: Add margin to the header to create consistent spacing */
        .terms-and-conditions-header {
            margin-top: 50px; /* Adjust as needed */
        }

        /* Footer styling */
        footer {
            background-color: #f8f9fa; /* Light grey background */
            padding: 20px;
            text-align: center;
            margin-top: 40px; /* Space from main content */
            border-top: 1px solid #ddd; /* Light border for separation */
        }

        footer h2 {
            margin-bottom: 10px;
        }

        footer ul {
            list-style-type: none;
            padding: 0;
        }

        footer li {
            margin: 5px 0;
        }
    </style>
</head>

<body>
    @include('home.header')

    <!-- Logo in the top right corner -->
    <div class="logo-container">
        <img src="{{ asset('Jobads.png') }}" alt="Logo" class="logo">
    </div>

    <div class="terms-and-conditions">
        <header class="terms-and-conditions-header">
            <h1>Terms & Conditions</h1>
        </header>
        <p><strong>Updated: 14th December 2024, Revision 5</strong></p>

        <!-- Dynamic Navigation Menu -->
        <nav>
            <h2> Terms and Conditions</h2>
            <p>Welcome to JOBADS.LK. 
                These Terms and Conditions govern your use of our website and the payment process for services provided through our platform. By accessing and using our website, you agree to comply with these terms. Please read them carefully before proceeding with any transactions.</p>
            <ul>
                @foreach ($terms as $term)
                    <li><a href="#term-{{ $term['number'] }}">Condition {{ $term['number'] }}</a></li>
                @endforeach
            </ul>
        </nav>

        <!-- Dynamic Content Sections -->
        @foreach ($terms as $term)
            <div id="term-{{ $term['number'] }}" class="section">
                <h2>{{ $term['number'] }}.</h2>
                <p>{{ $term['text'] }}</p>
            </div>
        @endforeach
    </div>

    <!-- Footer with contact information -->
    <footer>
        <h2>Contact Us</h2>
        <ul>
            @php
                use App\Models\Contact;
                $contacts = Contact::all();
            @endphp
            <li>Email: {{ $contacts->first()->email ?? 'Not Available' }}</li>
            @foreach ($contacts as $contact)
                <li>Phone: {{ $contact->phone }}</li>
            @endforeach
        </ul>
    </footer>

</body>

</html>
