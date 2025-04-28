<?php
// Get query parameters with proper fallbacks
$name = request()->query('name', auth()->user()->name);
$email = request()->query('email', auth()->user()->email);
$contact_number = request()->query('contact_number', $user->phone_number);
$message = request()->query('message', '');
$employer_id = request()->query('employer_id');
$job_posting_id = request()->query('job_posting_id');

// Default title color (only title colors will be changeable)
$titleColor = request()->query('title_color', '#1A355E');
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
            --title-color: <?=$titleColor ?>;
            --secondary-color: #1A355E;
            --text-color: #333;
            --light-gray: #fff;
        }

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

        .header {
            padding: 0px 0 0 0;
            background: var(--light-gray);
            border-radius: 8px;
            position: relative;
        }

        .header-content {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 0 32px;
        }

        .header-left {
            flex: 1;
            text-align: left;
        }

        .header h1 {
            color: var(--title-color);
            font-size: 2.5em;
            margin-left: 6px;
        }

        .title-section {
            margin-left: 8px;
        }

        .contact-info {
            display: flex;
            flex-direction: column;
            justify-content: center;
            gap: 20px;
            flex-wrap: wrap;
            margin: 10px 0;
        }

        .profile-image-container {
            width: 150px;
            height: 150px;
            margin: 0 auto 20px;
            border-radius: 50%;
            overflow: hidden;
            border: 4px solid var(--secondary-color);
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            position: relative;
        }

        .profile-image {
            width: 100%;
            height: 100%;
            object-fit: cover;
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
        }

        .contact-item {
            display: flex;
            align-items: center;
            gap: 8px;
            padding: 5px 10px;
            background-color: white;
            border-radius: 5px;
        }

        .contact-item i {
            color: var(--title-color);
        }

        .social-links i {
            color: var(--title-color);
        }

        .section {
            margin: 15px 0;
            padding: 0 20px;
        }

        .section-title {
            padding: 0 20px;
            color: #fff;
            font-size: 1.2em;
            border: 1px solid black;
            margin-bottom: 5px;
            background-color: var(--title-color);
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

        .experience-item,
        .education-item {
            padding: 8px 30px;
            background: var(--light-gray);
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.05);
        }

        .experience-header,
        .education-header {
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
        }

        .job-title,
        .degree {
            color: var(--title-color);
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
            background: white;
            padding: 5px 10px;
            border-radius: 4px;
            font-size: 0.9em;
        }

        .job-description {
            line-height: 1.6;
            color: #444;
        }

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

        @page {
            size: A4;
            margin: 1.54cm 1cm 1.5cm 1cm;
        }

        @media print {

            .download-btn,
            .title-color-selection {
                display: none;
            }

            html,
            body {
                margin: 0;
                padding: 0;
                width: 100%;
                height: 100%;
            }

            body {
                padding: 0;
                margin: 0;
                -webkit-print-color-adjust: exact !important;
                print-color-adjust: exact !important;
                color-adjust: exact !important;
            }

            .header {
                margin-top: 0;
            }

            .signature-section {
                margin-bottom: 0;
                page-break-inside: avoid;
            }

            .section {
                page-break-inside: avoid;
            }

            .experience-item,
            .education-item {
                page-break-inside: avoid;
            }

            .section-title {
                color: #fff !important;
                background-color: var(--title-color) !important;
                -webkit-print-color-adjust: exact !important;
                print-color-adjust: exact !important;
            }

            .header,
            .summary,
            .expertise,
            .experience-item,
            .education-item,
            .signature-section {
                -webkit-print-color-adjust: exact !important;
                print-color-adjust: exact !important;
            }
        }

        @media (max-width: 768px) {
            body {
                padding: 10px;
            }

            .profile-image-container {
                width: 120px;
                height: 120px;
            }

            .contact-info {
                flex-direction: column;
            }

            .experience-header,
            .education-header {
                flex-direction: column;
            }

            .date-range {
                margin-top: 10px;
            }
        }

        .title-color-selection {
            margin: 20px;
            text-align: center;
        }

        .title-color-selection label {
            margin-right: 15px;
            cursor: pointer;
        }

        .signature-section {
            background: var(--light-gray);
            border-radius: 8px;
            padding: 20px;
        }

        .signature-container {
            display: flex;
            justify-content: flex-start;
            padding: 20px;
            align-items: flex-start;
        }

        .signature-block {
            text-align: center;
            margin-right: 40px;
        }

        .signature-line {
            border-bottom: 1px solid var(--secondary-color);
            width: 200px;
            margin: 0 auto;
            margin-top: 10px;
        }

        .signature-label {
            margin-top: 5px;
            color: var(--title-color);
        }

        .social-links {
            display: flex;
            gap: 20px;
        }

        .social-link {
            color: var(--secondary-color);
            text-decoration: none;
            padding: 8px 15px;
            background: #fff;
            border-radius: 5px;
            transition: all 0.3s ease;
        }

        .social-link:hover {
            transform: translateY(-2px);
        }
    </style>
</head>

<body>
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

    <!-- Title Color Selection Section -->
    <div class="title-color-selection">
        <p>Select Title Color:</p>
        <label for="title_color_blue">
            <input type="radio" name="title_color_radio" id="title_color_blue" value="#2c3e50" checked
                onchange="updateTitleColor(this.value)">
            <span style="color: #2c3e50;">Blue</span>
        </label>
        <label for="title_color_red">
            <input type="radio" name="title_color_radio" id="title_color_red" value="rgb(31, 138, 165)"
                onchange="updateTitleColor(this.value)">
            <span style="color: rgb(31, 138, 165);">Gradient Blue</span>
        </label>
        <label for="title_color_green">
            <input type="radio" name="title_color_radio" id="title_color_green" value="#27ae60"
                onchange="updateTitleColor(this.value)">
            <span style="color: #27ae60;">Green</span>
        </label>
    </div>

    <div class="download-btn-container">
        <form action="{{ route('generate.cv2') }}" method="POST">
            @csrf
            <input type="hidden" name="name" value="{{ old('name', $name) }}">
            <input type="hidden" name="email" value="{{ old('email', $email) }}">
            <input type="hidden" name="contact_number" value="{{ old('contact_number', $contact_number) }}">
            <input type="hidden" name="employer_id" value="{{ old('employer_id', $employer_id) }}">
            <input type="hidden" name="job_posting_id" value="{{ old('job_posting_id', $job_posting_id) }}">
            <input type="hidden" name="message" value="{{ old('message', $message) }}">
            <input type="hidden" name="title_color" id="titleColorInput" value="{{ $titleColor }}">

            @if (session('success'))
                <div class="alert alert-success">
                    {{ session('success') }}
                </div>
            @endif
            @if ($name && $email && $contact_number && $message && $employer_id && $job_posting_id)
                <button type="submit" class="download-btn"
                    style="{{ isset($hideButton) && $hideButton ? 'display: none;' : '' }}">
                    Submit
                </button>
            @else
                @if (!isset($hideButton) || !$hideButton)
                    <a class="download-btn" onclick="handlePrint()">
                        <i class="fas fa-download"></i> Download CV
                    </a>
                @endif
            @endif
        </form>
    </div>

    <div class="header">
        <div class="header-content">
            <div class="header-left">
                <h1>{{ $user->name }}</h1>
                <div class="title-section">
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
            <div class="header-right">
                <?php if ($imageSrc): ?>
                <div class="profile-image-container">
                    <img src="{{ $imageSrc }}" alt="Profile Image" class="profile-image">
                </div>
                <?php endif; ?>
            </div>
        </div>
    </div>

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
                                <td style="width: 150px; text-align: left; padding-right: 10px;"><strong>Gender</strong>
                                </td>
                                <td>:</td>
                                <td>{{ $user->gender }}</td>
                            </tr>
                        @endif
                        @if ($user->nationality)
                            <tr>
                                <td style="width: 150px; text-align: left; padding-right: 10px;">
                                    <strong>Nationality</strong>
                                </td>
                                <td>:</td>
                                <td>{{ $user->nationality }}</td>
                            </tr>
                        @endif
                        @if ($user->nic_no)
                            <tr>
                                <td style="width: 150px; text-align: left; padding-right: 10px;"><strong>NIC No</strong>
                                </td>
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
            <div>
                <h2 class="section-title">EXPERTISE</h2>
                <div class="expertise">
                    @if ($user->skills)
                        {!! $user->skills !!}
                    @endif
                </div>
            </div>
            <div>
                <h2 class="section-title">IT & COMPUTER SKILLS</h2>
                <div class="expertise">
                    @if ($user->certifications)
                        {!! $user->certifications !!}
                    @endif
                </div>
            </div>
        </div>
    @endif

    @if (isset($experiences) && $experiences->count() > 0)
        <div class="section">
            <h2 class="section-title">WORK EXPERIENCE</h2>
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

    @if (isset($educations) && $educations->count() > 0)
        <div class="section">
            <h2 class="section-title">EDUCATION</h2>
            @foreach ($educations as $education)
                <div class="education-item">
                    <div class="education-header">
                        <div>
                            <div class="degree">{{ $education->degree }} in {{ $education->institution_name }}</div>
                            <div class="field-of-study">{!! $education->field_of_study !!}</div>
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
            <div style="display: flex; justify-content: space-between; padding-left: 20px;">
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
            I confirm that the above-mentioned particulars are true and accurate to the best of my knowledge and belief.
        </p>
        <div class="signature-container"
            style="display: flex; justify-content: space-between; padding: 20px; align-items: flex-start;">
            <div class="signature-block" style="margin-right: 40px;">
                <p style="margin-top: 10px;">
                    {{ $user->name }}
                </p>
                <div class="signature-line" style="border-bottom: 1px solid var(--secondary-color); width: 200px;">
                </div>
                <div class="signature-label">Name and Signature</div>
            </div>
            <div class="date-block">
                <p style="margin-top: 10px;">
                    {{ date('d/m/Y') }}
                </p>
                <div class="signature-line" style="border-bottom: 1px solid var(--secondary-color); width: 200px;">
                </div>
                <div class="signature-label">Date</div>
            </div>
        </div>
    </div>

    <script>
        function handlePrint() {
            window.print();
        }

        function updateTitleColor(newColor) {
            document.documentElement.style.setProperty('--title-color', newColor);
            document.getElementById('titleColorInput').value = newColor;
        }

        window.onafterprint = function() {
            window.location.href = "/profile/cv2";
        };
    </script>
</body>

</html>