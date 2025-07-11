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

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Arial', sans-serif;
        }

        body {
            color: var(--text-color);
            line-height: 1.6;
            width: 210mm;
            min-height: 297mm;
            margin: auto;
            padding: 20mm 15mm;
            background: #fff;
        }
        h2 {
            font-size:16px;
        }

        @media print {
            .header{
                margin-top: -18px;
            }
            @page {
                size: A4;
                margin: 20mm 15mm;
            }

            body {
                width: auto;
                height: auto;
                margin: 0;
                padding: 0;
                -webkit-print-color-adjust: exact !important;
                print-color-adjust: exact !important;
                color-adjust: exact !important;
            }

            .download-btn,
            .color-selection {
                display: none !important;
            }

            .it-secction, .experience-item, .signature-container {
                page-break-inside: avoid;
                break-inside: avoid;
                display: block;
            }
            .experience-item * {
            margin-top: 0 !important;
            margin-bottom: 0 !important;
            padding-top: 0;
            padding-bottom: 0;
        }

        .experience-item p {
            margin: 0 !important;
            padding: 0;
        }

        .experience-item {
            margin-top: 12px;
        }

        .experience-item:first-of-type {
            margin-top: 0;
        }
        .section {
            margin-top: 25px;
        }
        .education-item {
            margin-bottom: 15px;
        }
        }

        .download-btn-container {
            position: fixed;
            top: 20px;
            right: 20px;
            z-index: 1000;
        }

        .download-btn {
            background: #1a73e8;
            color: white;
            padding: 10px 20px;
            border-radius: 5px;
            border: none;
            cursor: pointer;
            text-decoration: none;
        }

        .section {
        }

        .section-title {
            color: var(--primary-color);
            background-color: var(--secondary-color);
            padding-left: 10px;
            font-weight: bold;
        }

        .header h1 {
            font-size: 2.5em;
            color: var(--primary-color1);
        }

        .summary,
        .expertise,
        .experience-item,
        .education-item {
            padding-left: 10px;
            background: var(--light-gray);
        }

        .experience-header, .academic-header {
            display: flex;
            justify-content: space-between;
            flex-wrap: wrap;
        }

        .contact-item,
        .social-link {
            display: flex;
            align-items: center;
            gap: 8px;
        }

        .contact-item i,
        .social-link i {
            color: var(--secondary-color);
        }

        .signature-section {
            background: var(--light-gray);
            border-radius: 8px;
        }

        table {
            width: 100%;
        }

        td {
            padding: 4px;
        }
        .main-top {
            margin-left:20px;
        }
        .mobile-email {
            display: flex;
            justify-content: start;
            gap: 25px;
        }

        .experience-item * {
            margin-top: 0 !important;
            margin-bottom: 0 !important;
            padding-top: 0;
            padding-bottom: 0;
        }

        .experience-item p {
            margin: 0 !important;
            padding: 0;
        }

        .experience-item {
            margin-top: 12px;
        }

        .experience-item:first-of-type {
            margin-top: 0;
        }
        .section {
            margin-top: 16px;
        }
        .education-item {
            margin-bottom: 15px;
        }
        .ql-align-justify {
            text-align: justify !important;
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
                <div class="main-top">
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
                            <div class="social-links mobile-email">
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
                <div class="summary" style="margin-top:5px;">
                    <table style="width: 100%; line-height: normal;">
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
                <div class="summary" style="text-align: justify; margin-top:5px;">
                    {{ $user->summary }}
                </div>
            </div>
        @endif

        @if ($user->skills)
            <div class="section">
                <h2 class="section-title">EXPERTISE</h2>
                <div class=" expertise" style="margin-left: 20px; margin-top:5px;">
                    {!! $user->skills !!}
                </div>
            </div>
        @endif

        @if ($user->certifications)
            <div class="section it-secction">
                <h2 class="section-title">IT & COMPUTER SKILLS</h2>
                <div class="expertise" style="margin-left: 20px; margin-top:5px;">
                    {!! $user->certifications !!}
                </div>
            </div>
        @endif

        @if ($experiences && $experiences->count() > 0)
            <div class="section">
                <h2 class="section-title">Work Experience</h2>
                @foreach ($experiences as $key => $experience)
                    <div class="experience-item" @if ($key == 0)
                        style="margin-top:5px;"
                    @endif>
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
                        <div class="job-description" style="text-align: justify;">
                            {!! $experience->job_description !!}
                        </div>
                    </div>
                @endforeach

            </div>
        @endif

        @if ($educations && $educations->count() > 0)
            <div class="section" style="margin-top: 25px;">
                <h2 class="section-title">Professional Qualifications</h2>
                @foreach ($educations as $ekey => $education)
                    <div class="education-item" @if ($ekey == 0)
                        style="margin-top:5px;"
                    @endif>
                        <div class="education-header academic-header">
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

        @if ($academicEducations && $academicEducations->count() > 0)
            <div class="section">
                <h2 class="section-title">Academic Qualifications</h2>
                @foreach ($academicEducations as $akey => $education)
                    <div class="education-item" @if ($akey == 0)
                        style="margin-top:5px;"
                    @endif>
                        <div class="education-header">
                            <div>
                                <div class="degree">{{ $education->degree }} in {{ $education->institution_name }}
                                </div>
                                <div class="field-of-study">
                                    {!! $education->field_of_study !!}
                                </div>
                            </div>
                            <div style="display: flex; justify-content: space-between;">
                                <div class="institution">{{ $education->institution_name }}</div>
                                <div class="date-range">
                                    {{ \Carbon\Carbon::parse($education->start_date)->format('M Y') }} -
                                    {{ $education->end_date ? \Carbon\Carbon::parse($education->end_date)->format('M Y') : 'Present' }}
                                </div>
                            </div>
                        </div>
                    </div>
                @endforeach
            </div>
        @endif

        @if ($user->referees && $user->referees2)
            <div class="section">
                <h2 class="section-title">REFEREES</h2>
                <div style="display: flex; justify-content: space-between; margin-top:5px;">
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
            <p style="text-align: justify; margin-left: 10px; margin-top:-60px;">
                I confirm that the above-mentioned particulars are true and accurate to the best of my knowledge and
                belief.
            </p>
            <div class="signature-container"
                style="display: flex; justify-content: space-between; padding: 9px; align-items: flex-start;">
                <div class="signature-block" style="margin-right: 40px;">
                    <p style="margin-top: 10px; display:flex; justify-content:center;">
                        {{ $user->name }}
                    </p>
                    <div class="signature-line" style="border-bottom: 1px solid var(--primary-color1); width: auto;">
                    </div>
                    <div class="signature-label" style="display:flex; justify-content:center;">Name and Signature</div>
                </div>
                <div class="date-block">
                    <p style="margin-top: 10px; display:flex; justify-content:center;">
                        {{ date('d/m/Y') }}
                    </p>
                    <div class="signature-line" style="border-bottom: 1px solid var(--primary-color1); width: auto;">
                    </div>
                    <div class="signature-label" style="display:flex; justify-content:center;">Date</div>
                </div>
            </div>
        </div>


    <script>
        function handlePrint() {
            window.print();
        }

        window.onafterprint = function () {
            window.location.href = "/profile/cv";
        };

        function updatePrimaryColor(newColor) {
            document.documentElement.style.setProperty('--primary-color', newColor);
            document.getElementById('primaryColorInput').value = newColor;
        }

        function updateSecondaryColor(newColor) {
            document.documentElement.style.setProperty('--secondary-color', newColor);
            document.getElementById('secondaryColorInput').value = newColor;
        }
    </script>
</body>

</html>
