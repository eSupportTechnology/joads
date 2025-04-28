<?php
// Get query parameters with proper fallbacks
$name = request()->query('name', auth()->user()->name);
$email = request()->query('email', auth()->user()->email);
$contact_number = request()->query('contact_number', $user->phone_number);
$message = request()->query('message', '');
$employer_id = request()->query('employer_id');
$job_posting_id = request()->query('job_posting_id');
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CV - {{ $user->name }}</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        :root {
            --primary-color1: #2c3e50;
            --primary-color: #fff;
            --secondary-color: #1A355E;
            --text-color: #333;
            --light-gray: #fff;
        }

        /* Reset & Global Styles */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Arial', sans-serif;
        }

        body {
            color: var(--text-color);
            line-height: 1.6;
            max-width: 1000px;
            margin: 0 auto;
            padding: 20px;
            background: #fff;
        }

        /* Button & Print Settings */
        .download-btn-container {
            position: absolute;
            top: 20px;
            right: 20px;
            z-index: 100;
        }

        .download-btn {
            display: inline-block;
            background: #1a73e8;
            color: white;
            padding: 10px 20px;
            text-decoration: none;
            border-radius: 5px;
            border: none;
            cursor: pointer;
        }

        .download-btn:hover {
            background: #1a73e8;
        }

        /* Updated print styles with specific margins */
        @media print {

            .download-btn,
            .color-selection {
                display: none;
            }

            body {
                -webkit-print-color-adjust: exact !important;
                print-color-adjust: exact !important;
                color-adjust: exact !important;
                padding: 0;
                margin: 0;
            }

            .section-title {
                color: var(--primary-color) !important;
                background-color: var(--secondary-color) !important;
                -webkit-print-color-adjust: exact !important;
                print-color-adjust: exact !important;
            }

            .header h1 {
                color: var(--primary-color1) !important;
            }

            /* Add space at the top of the first printed page */


            /* Ensure content doesn't overflow to the bottom margin */
            .signature-section {
                margin-bottom: 0.5cm;
            }
        }

        /* Set specific page margins */
        @page {
            margin-top: 1.5cm;
            /* 1 inch top margin */
            margin-bottom: 1.5cm;
            /* 1.5 cm bottom margin */
            margin-left: 1cm;
            /* Standard side margins */
            margin-right: 1cm;
        }

        /* Header Section */
        .header {
            padding: 0px 0 0 0;
            background: var(--light-gray);
            border-radius: 8px;
            position: relative;
        }

        .header-content {
            display: flex;
            justify-content: space-between;
            padding: 0 12px;
            /* adjust padding as needed */
        }

        .header-left {
            flex: 1;
            text-align: left;
        }

        .header h1 {
            color: var(--primary-color1);
            font-size: 2.5em;
            margin-left: 30px;
        }

        /* Contact & Social Info */
        .contact-info {
            display: flex;
            flex-direction: column;
            justify-content: center;
            gap: 20px;
            flex-wrap: wrap;
            margin: 10px 0;
            padding: 0 20px;
        }

        .contact-item {
            display: flex;
            align-items: center;
            gap: 8px;
            padding: 5px 10px;
            border-radius: 5px;
        }

        .contact-item i {
            color: var(--secondary-color);
        }

        .social-links {
            display: flex;
            gap: 20px;
        }

        .social-link {
            color: var(--secondary-color);
            text-decoration: none;
            padding: 8px 15px;
            border-radius: 5px;
            transition: all 0.3s ease;
        }

        .social-link:hover {
            transform: translateY(-2px);
        }

        /* Section Styling */
        .section {
            margin: 15px 0;
            padding: 0 20px;
        }

        .section-title {
            padding: 0 20px;
            color: var(--primary-color);
            font-size: 1.2em;
            border: 1px solid black;
            margin-bottom: 5px;
            background-color: var(--secondary-color);
        }

        .expertise {
            text-align: justify;
            padding: 4px 30px 0 50px;
            background: var(--light-gray);
            border-radius: 8px;
            margin-bottom: 5px;
        }

        .summary {
            text-align: justify;
            padding: 4px 30px;
            background: var(--light-gray);
            border-radius: 8px;
            margin-bottom: 5px;
        }

        /* Experience & Education Items */
        .experience-item,
        .education-item {
            padding: 4px 30px;
            background: var(--light-gray);
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.05);

        }

        .experience-header,
        .education-header {
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
            flex-wrap: wrap;
        }

        .job-title,
        .degree {
            color: rgb(73, 103, 160);
            font-weight: bold;
            font-size: 1.2em;
        }

        .company-name,
        .institution {
            color: var(--secondary-color);
            font-weight: 600;
            font-size: 1.1em;
        }

        .date-range {
            color: #666;
            font-style: italic;
            background: #fff;
            padding: 5px 10px;
            border-radius: 4px;
            font-size: 0.9em;
            margin-top: 5px;
        }

        .job-description {
            line-height: 1.6;
            color: #444;
            margin-top: 10px;
        }

        /* Responsive Adjustments */
        @media (max-width: 768px) {
            body {
                padding: 10px;
            }

            .header {
                padding: 20px;
            }

            .experience-header,
            .education-header {
                flex-direction: column;
            }

            .date-range {
                margin-top: 10px;
            }
        }

        /* Rich Text Styling */
        .field-of-study,
        .job-description {
            line-height: 1.6;
            color: #444;
        }

        .field-of-study ul,
        .job-description ul {
            list-style-type: disc;
            margin-left: 20px;
            margin-bottom: 10px;
        }

        .field-of-study ol,
        .job-description ol {
            list-style-type: decimal;
            margin-left: 20px;
            margin-bottom: 10px;
        }

        .field-of-study p,
        .job-description p {
            margin-bottom: 10px;
        }

        .field-of-study strong,
        .job-description strong {
            font-weight: bold;
        }

        .field-of-study em,
        .job-description em {
            font-style: italic;
        }

        .field-of-study h1,
        .job-description h1 {
            font-size: 1.5em;
        }

        .field-of-study h2,
        .job-description h2 {
            font-size: 1.3em;
        }

        .field-of-study h3,
        .job-description h3 {
            font-size: 1.1em;
        }

        .field-of-study blockquote,
        .job-description blockquote {
            border-left: 3px solid #ccc;
            margin: 10px 0;
            padding-left: 15px;
            color: #666;
        }

        .field-of-study code,
        .job-description code {
            background-color: #f5f5f5;
            padding: 2px 4px;
            border-radius: 3px;
            font-family: monospace;
        }

        /* Signature Section */
        .signature-section {
            background: var(--light-gray);
            border-radius: 8px;
            padding: 20px;
            text-align: left;
        }

        .signature-line {
            position: relative;
            margin-bottom: 5px;
        }

        .title-section {
            margin-left: 30px;
        }
    </style>
</head>

<body>
    <!-- Color Selection Section -->
    <div class="color-selection" style="text-align: center; margin: 20px 0;">
        <p><strong>Select Secondary (Accent) Color:</strong></p>
        <label for="secondary_blue">
            <input type="radio" name="secondary_color_radio" id="secondary_blue" value="#1A355E" checked
                onchange="updateSecondaryColor(this.value)">
            <span style="color: #1A355E;">Blue</span>
        </label>
        <label for="secondary_orange">
            <input type="radio" name="secondary_color_radio" id="secondary_orange" value=" rgb(31, 138, 165)"
                onchange="updateSecondaryColor(this.value)">
            <span style="color:  rgb(31, 138, 165);">Gradient Blue</span>
        </label>
        <label for="secondary_teal">
            <input type="radio" name="secondary_color_radio" id="secondary_teal" value="#16a085"
                onchange="updateSecondaryColor(this.value)">
            <span style="color: #16a085;">Teal</span>
        </label>
    </div>

    <!-- Header & Profile Section -->
    <div class="download-btn-container">
        <form action="{{ route('generate.cv') }}" method="POST">
            @csrf
            <!-- Hidden Fields -->
            <input type="hidden" name="name" value="{{ old('name', $name) }}">
            <input type="hidden" name="email" value="{{ old('email', $email) }}">
            <input type="hidden" name="contact_number" value="{{ old('contact_number', $contact_number) }}">
            <input type="hidden" name="employer_id" value="{{ old('employer_id', $employer_id) }}">
            <input type="hidden" name="job_posting_id" value="{{ old('job_posting_id', $job_posting_id) }}">
            <input type="hidden" name="message" value="{{ old('message', $message) }}">
            <!-- Hidden Color Inputs -->
            <input type="hidden" name="primary_color" id="primaryColorInput" value="#2c3e50">
            <input type="hidden" name="secondary_color" id="secondaryColorInput" value="#3498db">

            @if ($errors->any())
                <div class="alert alert-danger">
                    <ul>
                        @foreach ($errors->all() as $error)
                            <li>{{ $error }}</li>
                        @endforeach
                    </ul>
                </div>
            @endif
            @if (session('success'))
                <div class="alert alert-success">
                    {{ session('success') }}
                </div>
            @endif

            @if ($name && $email && $contact_number && $message && $employer_id && $job_posting_id)
                <button type="submit" class="download-btn">Submit</button>
            @else
                <a class="download-btn" onclick="handlePrint()">
                    <i class="fas fa-download"></i> Download CV
                </a>
            @endif
        </form>
    </div>
    <div class="header">
        <!-- Profile Image & Main Title -->
        <?php
        use Illuminate\Support\Facades\Storage;
        $profileImagePath = $user->profile_image ? 'profile_images/' . $user->profile_image : null;
        $imageSrc = null;
        if ($profileImagePath && Storage::disk('public')->exists($profileImagePath)) {
            $imageFile = Storage::disk('public')->get($profileImagePath);
            $mimeType = Storage::disk('public')->mimeType($profileImagePath);
            $base64 = base64_encode($imageFile);
            $imageSrc = "data:$mimeType;base64,$base64";
        } else {
            $defaultPath = public_path('images/default-profile.png');
            if (file_exists($defaultPath)) {
                $defaultImage = file_get_contents($defaultPath);
                $base64 = base64_encode($defaultImage);
                $imageSrc = "data:image/png;base64,$base64";
            }
        }
        ?>

        <div class="header-content">
            <div class="header-left">
                <h1>{{ $user->name }}</h1>
                <div class="title-section ">
                    {!! $user->title !!}
                </div>
                <div class="contact-info">
                    <div>
                        <?php if ($user->address): ?>
                        <div class="contact-item">
                            <i class="fas fa-map-marker-alt"></i> {{ $user->address }}
                        </div>
                        <?php endif; ?>
                        <div class="social-links">
                            <?php if ($user->phone_number): ?>
                            <div class="contact-item">
                                <i class="fas fa-phone"></i> {{ $user->phone_number }}
                            </div>
                            <?php endif; ?>
                            <?php if ($user->email): ?>
                            <div class="contact-item">
                                <i class="fas fa-envelope"></i> {{ $user->email }}
                            </div>
                            <?php endif; ?>
                        </div>
                        <div class="social-links">
                            @if ($user->linkedin)
                                <a href="{{ $user->linkedin }}" class="social-link">
                                    <i class="fab fa-linkedin"></i> LinkedIn
                                </a>
                            @endif
                            @if ($user->portfolio_link)
                                <a href="{{ $user->portfolio_link }}" class="social-link">
                                    <i class="fas fa-globe"></i> Portfolio
                                </a>
                            @endif
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Additional Sections -->
        @if (
            $user->fullname ||
                $user->marital_status ||
                $user->date_of_birth ||
                $user->gender ||
                $user->nationality ||
                $user->nic_no)
            <div class="section">
                <h2 class="section-title">PERSONAL DETAILS</h2>
                <div class="summary">
                    <table style="width: 100%;">
                        <tbody>
                            @if ($user->fullname)
                                <tr>
                                    <td style="width: 150px; text-align: left; padding-right: 10px;"><strong>Full
                                            Name</strong></td>
                                    <td>:</td>
                                    <td>{{ $user->fullname }}</td>
                                </tr>
                            @endif
                            @if ($user->marital_status)
                                <tr>
                                    <td style="width: 150px; text-align: left; padding-right: 10px;"><strong>Marital
                                            Status</strong></td>
                                    <td>:</td>
                                    <td>{{ $user->marital_status }}</td>
                                </tr>
                            @endif
                            @if ($user->date_of_birth)
                                <tr>
                                    <td style="width: 150px; text-align: left; padding-right: 10px;"><strong>Date of
                                            Birth</strong></td>
                                    <td>:</td>
                                    <td>{{ \Carbon\Carbon::parse($user->date_of_birth)->format('d M, Y') }}</td>
                                </tr>
                            @endif
                            @if ($user->gender)
                                <tr>
                                    <td style="width: 150px; text-align: left; padding-right: 10px;">
                                        <strong>Gender</strong>
                                    <td>:</td>
                                    </td>
                                    <td>{{ $user->gender }}</td>
                                </tr>
                            @endif
                            @if ($user->nationality)
                                <tr>
                                    <td style="width: 150px; text-align: left; padding-right: 10px;">
                                        <strong>Nationality</strong>
                                    <td>:</td>
                                    </td>
                                    <td>{{ $user->nationality }}</td>
                                </tr>
                            @endif
                            @if ($user->nic_no)
                                <tr>
                                    <td style="width: 150px; text-align: left; padding-right: 10px;"><strong>NIC
                                            No</strong></td>
                                    <td>:</td>
                                    <td>{{ $user->nic_no }}</td>
                                </tr>
                            @endif
                        </tbody>
                    </table>
                </div>
            </div>
        @endif

        @if ($user->summary)
            <div class="section">
                <h2 class="section-title">PROFESSIONAL SUMMARY</h2>
                <div class="summary">
                    {{ $user->summary }}
                </div>
            </div>
        @endif

        @if ($user->skills)
            <div class="section">
                <h2 class="section-title">EXPERTISE</h2>
                <div class=" expertise">
                    {!! $user->skills !!}
                </div>
            </div>
        @endif

        @if ($user->certifications)
            <div class="section">
                <h2 class="section-title">IT & COMPUTER SKILLS</h2>
                <div class="expertise">
                    {!! $user->certifications !!}
                </div>
            </div>
        @endif

        @if ($experiences && $experiences->count() > 0)
            <div class="section">
                <h2 class="section-title">Work Experience</h2>
                @foreach ($experiences as $experience)
                    <div class="experience-item">
                        <div class="experience-header">
                            <div>
                                <div class="job-title">{{ $experience->job_title }}</div>
                                <div class="company-name">{{ $experience->company_name }}</div>
                            </div>
                            <div class="date-range">
                                {{ \Carbon\Carbon::parse($experience->start_date)->format('M Y') }} -
                                {{ $experience->end_date ? \Carbon\Carbon::parse($experience->end_date)->format('M Y') : 'Present' }}
                            </div>
                        </div>
                        <div class="job-description">
                            {!! $experience->job_description !!}
                        </div>
                    </div>
                @endforeach
            </div>
        @endif

        @if ($educations && $educations->count() > 0)
            <div class="section">
                <h2 class="section-title">Education</h2>
                @foreach ($educations as $education)
                    <div class="education-item">
                        <div class="education-header">
                            <div>
                                <div class="degree">{{ $education->degree }} in {{ $education->institution_name }}
                                </div>
                                <div class="field-of-study">
                                    {!! $education->field_of_study !!}
                                </div>
                                <div class="institution">{{ $education->institution_name }}</div>
                            </div>
                            <div class="date-range">
                                {{ \Carbon\Carbon::parse($education->start_date)->format('M Y') }} -
                                {{ $education->end_date ? \Carbon\Carbon::parse($education->end_date)->format('M Y') : 'Present' }}
                            </div>
                        </div>
                    </div>
                @endforeach
            </div>
        @endif

        @if ($user->referees && $user->referees2)
            <div class="section">
                <h2 class="section-title">REFEREES</h2>
                <div style="display: flex; justify-content: space-between;padding: 0px 20px">
                    <div class="education-item">
                        {!! $user->referees !!}
                    </div>
                    <div class="education-item">
                        {!! $user->referees2 !!}
                    </div>
                </div>
            </div>
        @endif

        <!-- Signature Section -->
        <div class="section signature-section">
            <p style="text-align: left; margin-left: 10px;">
                I confirm that the above-mentioned particulars are true and accurate to the best of my knowledge and
                belief.
            </p>
            <div class="signature-container"
                style="display: flex; justify-content: space-between; padding: 20px; align-items: flex-start;">
                <div class="signature-block" style="margin-right: 40px;">
                    <p style="margin-top: 10px;">
                        {{ $user->name }}
                    </p>
                    <div class="signature-line" style="border-bottom: 1px solid var(--primary-color1); width: 200px;">
                    </div>
                    <div class="signature-label">Name and Signature</div>
                </div>
                <div class="date-block">
                    <p style="margin-top: 10px;">
                        {{ date('d/m/Y') }}
                    </p>
                    <div class="signature-line" style="border-bottom: 1px solid var(--primary-color1); width: 200px;">
                    </div>
                    <div class="signature-label">Date</div>
                </div>
            </div>
        </div>

        <script>
            function handlePrint() {
                window.print();
            }
            window.onafterprint = function() {
                window.location.href = "/profile/cv";
            };
            // Function to update primary (title) color
            function updatePrimaryColor(newColor) {
                document.documentElement.style.setProperty('--primary-color', newColor);
                document.getElementById('primaryColorInput').value = newColor;
            }
            // Function to update secondary (accent) color
            function updateSecondaryColor(newColor) {
                document.documentElement.style.setProperty('--secondary-color', newColor);
                document.getElementById('secondaryColorInput').value = newColor;
            }
        </script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.5.1/jspdf.umd.min.js"></script>
        <script>
            document.querySelector('.download-btn').addEventListener('click', function() {
                const {
                    jsPDF
                } = window.jspdf;
                const doc = new jsPDF();
                doc.html(document.body, {
                    callback: function(doc) {
                        doc.save('cv.pdf');
                    },
                    x: 10,
                    y: 10
                });
            });
        </script>
</body>

</html>