<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Privacy Policy of topjobs.lk">
    <title>Privacy Policy</title>
    <link rel="stylesheet" href="styles.css">
    <link rel="stylesheet" href="{{ asset('css/privacy.css') }}">
    <style>
        /* Logo positioning */
        .logo-container {
            position: absolute;
            top: 140px; /* Adjust for spacing */
            right: 50px;
            z-index: 1000;
        }
        .logo {
            width: 100px;
            height: auto;
        }

        /* Header margin adjustment */
        .terms-and-conditions-header {
            margin-top: 100px;
        }

        /* Footer styling */
        footer {
            background-color: #f8f9fa; /* Light grey background */
            padding: 20px;
            text-align: center;
            margin-top: 40px; /* Spacing from main content */
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
<body class="privacy-policy-body">
    <!-- Logo in the top right corner -->
    <div class="logo-container">
        <img src="{{ asset('Jobads.png') }}" alt="Logo" class="logo">
    </div>

    <header class="privacy-policy-header">
        <h1>Privacy Policy</h1>
    </header>

    <main class="privacy-policy-main">
        <section class="privacy-policy-section">
            <h2>Introduction</h2>
            <p>This site is committed to protecting your privacy. This Statement of Privacy applies to the jobads.lk website and governs data collection and usage at this site. Please read the Statement of Privacy below.</p>
        </section>
        <section class="privacy-policy-section">
            <h2>Scope of Coverage</h2>
            <p>This Statement of Privacy covers how topjobs.lk treats personal information collected and received, including information relating to the past use of our products and services. "Personal Information" refers to information that personally identifies you by your name, email address, phone number, and other information that is not otherwise publicly available.</p>
            <p>This Statement of Privacy applies only to the practices of topjobs.lk and the people we employ or manage. Other websites or services linked to/from this website will have their own privacy statements, which can be viewed by clicking on their respective privacy links.</p>
        </section>
        <section class="privacy-policy-section">
            <h2>Use of Your Personal Information</h2>
            <p>This site does not sell, rent, or share your personal information with other people or non-affiliated third parties except to provide you with the products or services you have requested, or when you give us permission, or under the following circumstances:</p>
            <ul class="privacy-policy-list">
                <li>When you apply to jobs through our services, your resume data in your account and any other information disclosed during your job applications will be made available to the companies you are applying to.</li>
                <li>You may opt to make your resume searchable by any companies using this site to recruit. These companies may retain a copy of your resume in their own files or databases.</li>
                <li>Personal information collected on this site may be stored and processed in any country where this site or its business partners, subsidiaries, or agents maintain facilities. By using this site, you consent to such transfer of information outside your country.</li>
            </ul>
            <p>While we endeavor to ensure that companies comply with relevant privacy laws, topjobs.lk is not responsible for the retention, use, or privacy practices of resumes by these companies or any third parties associated with them.</p>
        </section>
        <section class="privacy-policy-section">
            <h2>Control of Your Personal Information</h2>
            <p>This site offers you various choices for the use and sharing of your personal information. You may go to your account page to edit your personal information and preferences at any time. You will be asked to make your requests while logged into your account, so that we can associate your preferences with your specific profile. This security safeguard prevents unauthorized changes to the usage and control of your personal information.</p>
            <p>There are certain site services that send periodic emails to inform you of technical service issues, new vacancies, and updates about our products and services. You will be unable to unsubscribe from these emails as they are considered an integral part of the service you have chosen.</p>
        </section>
        <section class="privacy-policy-section">
            <h2>Data Breach Notification Policy</h2>
            <p>We are committed to safeguarding your personal information. In the unlikely event of a data breach that may compromise your personal information, we will take prompt action to assess the impact and notify affected users without undue delay.</p>
            <p>This notification will include details of the incident, the data affected, potential risks, and the steps we are taking to mitigate the impact. We will also provide guidance on the actions you may take to protect your information. Our incident response process ensures compliance with applicable data protection regulations.</p>
            <p>We prioritize transparency and user safety, and we will keep you informed throughout the resolution process.</p>
        </section>
    </main>

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
