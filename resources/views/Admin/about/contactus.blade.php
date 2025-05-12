<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Our Services</title>
    <link rel="stylesheet" href="{{ asset('css/topemployees.css') }}">
    <link rel="icon" href="{{ asset('assets/images/favicon.ico') }}" type="image/x-icon">
    <link rel="shortcut icon" href="{{ asset('assets/images/favicon.ico') }}" type="image/x-icon">
</head>

<body>
    @include('home.header')

    <div class="container">
        <!-- Title & Buttons -->
        <div class="title-buttons-container">
            <h1 class="tit">Our Services</h1>
            <div class="button-container">
                <a href="{{ route('press-releases.frontend') }}" class="custom-button">Career Resources</a>
                <a href="{{ route('press-releases.frontend') }}" class="custom-button">Press Release</a>
            </div>
        </div>

        <!-- Services Section -->
        <div class="content-box">
            <div class="box">
                <h3>Advertising in <span class="email1">jobads.lk</span></h3>
                <ul class="styled-list">
                    <li>Job Vacancy advertising in <strong>www.jobads.lk</strong></li>
                    <li>Facilitates with free Job Vacancy advertisement formats</li>
                    <li>Advertisement design and publishing in the print media (optional)</li>
                    <li>Facilitates Candidates to Prepare Individual CVs</li>
                </ul>
            </div>
            <div class="box">
                <h3>Full Recruitment Services</h3>
                <ul class="styled-list">
                    <li>Job Vacancy advertising in <strong>www.jobads.lk</strong></li>
                    <li>Facilitates with free Job Vacancy advertisement formats</li>
                    <li>Advertisement design and publishing in the print media (optional)</li>
                    <li>Headhunting services and anonymized digital media advertising</li>
                    <li>Collection and screening of all profiles/CVs</li>
                    <li>Compile and submit a detailed candidate summary report</li>
                    <li>Timeline is 2 to 4 weeks from the date of signing of Engagement Acceptance</li>
                    <li>Facilitates Candidates to Prepare Individual CVs</li>
                </ul>
            </div>
        </div>

        <!-- Contact Section -->
        <div class="contact-section">
            <div class="contact-container">
                <div class="contact-logo">
                    <a href="/">
                        <img src="{{ asset('Jobads.png') }}" alt="Logo" class="unique-logo">
                    </a>
                </div>
                <h2>Contact Us for more details</h2>

                <div class="postcontent">
                    <table class="contact-table">
                        <tr>
                            <th class="emailth" style="background-color: #fad157;">Email</th>
                            <td class="email" colspan="2">jobs@jobads.lk</td>
                        </tr>
                        <tr>
                            <th rowspan="{{ count($contacts) + 1 }}" style="background-color: #fad157;">Call or WhatsApp
                            </th>
                        </tr>
                        @foreach ($contacts as $contact)
                            <tr style="background-color: #ffe599;">
                                <td class="contact-name">{{ $contact->name }}</td>
                                <td class="contact-phone">{{ $contact->phone }}</td>
                            </tr>
                        @endforeach
                        <tr>
                            <td colspan="3" style="background-color: #fad157;" class="tfooter">
                                <strong>For International:</strong> Prefix with '+94' e.g., +94 777 580 451
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3" style="background-color: #fad157;" class="tfooter">
                                <small style="color: #357ab7; font-style: normal">
                                    Working Hours Monday to Friday from 8.30am to 5.30pm
                                </small>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>

    </div>
</body>

<style>
    /* Base Styles */
    * {

        margin: 0;
        padding: 0;
    }

    body {
        font-family: Arial, sans-serif;
        line-height: 1.6;
        background-color: white;
    }

    .container {
        max-width: 100%;
        margin: 0px auto 20px;
        padding: 0 50px;
        background: white;

        border-radius: 5px;
    }

    /* Title & Buttons */
    .title-buttons-container {
        display: flex;
        width: 100%;
        justify-content: space-between;
        align-items: center;
        padding: 25px 0;
        gap: 20px;
    }

    .tit {
        color: #333 !important;
        font-size: 2rem;
        flex: 1 1 100%;
    }

    .button-container {
        display: flex;
        gap: 10px;

    }

    .custom-button {
        background: #e47520;
        color: white;
        padding: 10px 5px;
        width: 180px;
        border-radius: 5px;
        text-decoration: none;
        transition: background 0.3s ease;
        text-align: center;
        flex: 1 1 auto;
    }

    .custom-button:hover {
        background: #d0631e;
    }

    /* Services Section */
    .content-box {
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
        gap: 25px;
        padding: 20px 0;
    }

    .box {
        background: white;
        border: 1px solid #ddd;
        border-radius: 5px;
        padding: 5px 10px;

        box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
    }

    .box h3 {
        color: green;
        font-size: 1.3rem;
        margin-bottom: 15px;
        margin-left: 10px
    }

    .styled-list {
        padding-left: 20px;
        list-style-type: none;
    }

    .styled-list li {
        margin-bottom: 12px;
        padding-left: 15px;
        position: relative;
    }

    .styled-list li::before {
        content: "•";
        color: #e47520;
        position: absolute;
        left: 0;
    }

    /* Contact Section */
    .contact-section {
        padding: 30px 0;
        border-top: 2px solid #ddd;
        margin-top: 30px;
    }

    .contact-container {
        text-align: center;
        max-width: 800px;
        margin: 0 auto;
    }

    .contact-logo {
        text-align: center;
        margin-bottom: 20px;
    }

    .contact-logo img {
        max-height: 60px;
    }

    .postcontent {
        padding: 15px;

        margin-top: -10px;
        margin: 0 auto;
    }

    /* Contact Table Styles */
    .contact-table {
        width: 90%;
        border-collapse: collapse;
        background-color: #f9f9f9;
        table-layout: fixed;
    }

    .contact-table th,
    .contact-table td {
        border: 1px solid #ddd;
        padding: 8px;
        text-align: left;
    }

    .contact-table th {
        font-weight: bold;
        padding-left: 30px;
    }

    .contact-table td {
        padding-left: 30px;
    }

    .emailth {
        background-color: #ffe599;
    }

    .email {
        font-style: italic;
        color: red;
        font-weight: bold;
        background-color: #ffe599;
    }

    .contact-name {
        width: 40%;
    }

    .contact-phone {
        width: 55%;
    }

    .tfooter {
        background-color: #ffe599;
        color: blue;
    }

    /* Responsive Design */
    @media screen and (max-width: 768px) {
        .postcontent {
            width: 100%;
            padding: 10px 5px;
        }

        .contact-table th,
        .contact-table td {
            padding: 4px;
        }
    }

    @media screen and (max-width: 480px) {
        .contact-table {
            font-size: 12px;
        }
    }

    /* Responsive Design */
    @media (max-width: 768px) {
        .container {
            margin: 60px auto 20px;
            padding: 0 15px;
        }

        .title-buttons-container {
            flex-wrap: wrap;
            align-items: center;
            padding: 10px 0;
            justify-content: center;
        }

        .tit {
            font-size: 1.7rem;
            text-align: center;
        }

        .button-container {
            justify-content: center;
            flex-wrap: wrap;
        }

        .content-box {
            grid-template-columns: 1fr;
            gap: 20px;
        }

        .contact-table {
            display: block;
            overflow-x: auto;
        }

        .contact-table th,
        .contact-table td {
            min-width: 120px;
            font-size: 0.9em;
            padding: 12px;
        }
    }

    @media (max-width: 480px) {
        .custom-button {
            width: 100%;
        }

        .contact-table {
            font-size: 0.85em;
        }

        .contact-logo img {
            max-height: 50px;
        }
    }
</style>

</html>