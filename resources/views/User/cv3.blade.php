<?php
// Get query parameters with proper fallbacks
$name = request()->query('name', auth()->user()->name);
$email = request()->query('email', auth()->user()->email);
$contact_number = request()->query('contact_number', $user->phone_number);
$message = request()->query('message', '');
$employer_id = request()->query('employer_id');
$job_posting_id = request()->query('job_posting_id');

// New dynamic color variables. You can change these as needed.
$primaryColor = request()->query('primary_color', $user->theme_color ?? '#3498db');
$sidebarColor = request()->query('sidebar_color', $user->sidebar_color ?? '#0A4D2E');
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
            --primary-color: <?=$primaryColor ?>;
            --sidebar-color: <?=$sidebarColor ?>;
        }

        @page {
            size: A4;
            margin: 0;
            background: var(--primary-color);
        }


        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: Arial, sans-serif;
            line-height: 1.6;
            color: #333;
            background: white;
            width: 100%;
            height: 100%;
        }

        .page-container {
            width: 210mm;
            max-width: 210mm;
            margin: 0 auto;
            position: relative;
        }

        .main-grid {
            display: flex;
            width: 100%;
            border-collapse: collapse;
        }

        .sidebar {
            /* width: 75mm; */
            background-color: var(--sidebar-color);
            padding: 10mm;
            color: #000000;
            box-sizing: border-box;
            height: 13rem;
            width: 48rem;
        }

        .main-content {
            position: relative;
            display: flex;
            flex-direction: column;
            padding: 10mm;
            max-width: 135mm;
            width: 125mm;
            box-sizing: border-box;
            padding-left: 10px;
            break-inside: avoid-page;
        }

        .main-content .section-title {
            color: #000;
        }

        /* .profile-image-container {
            width: 200px;
            height: 200px;
            margin: 0 auto 20px;
            border-radius: 50%;
            overflow: hidden;
            border: 3px solid var(--primary-color);
            position: absolute;
            top: 2rem;
            left: 2rem;
        } */

        /* .profile-image {
            width: 100%;
            height: 100%;
            object-fit: cover;
        } */

        .section-title {
            font-size: 14px;
            font-weight: bold;
            color: #000000;
            margin: 15px 0;
            border-bottom: 2px solid var(--primary-color);
            page-break-inside: avoid;
            page-break-before: avoid;
        }

        .contact-info ul,
        .personal-details-list {
            list-style: none;
            margin-bottom: 20px;
            padding: 0;
        }

        .contact-info li,
        .personal-details-list .contact-item {
            margin-bottom: 8px;
            word-wrap: break-word;
        }

        .contact-item {
            display: flex;
            align-items: flex-start;
            /* Align items to the top */
            gap: 10px;
            margin-bottom: 8px;
            page-break-inside: avoid;
        }

        .contact-item i {
            width: 20px;
            /* Fixed width for icons */
            text-align: center;
            font-size: 16px;
            color: var(--primary-color);
            flex-shrink: 0;
            margin-top: 2px;
            /* Slight adjustment for vertical alignment */
        }

        .contact-text {
            font-size: 14px;
            /* Slightly smaller for better fit */
            flex: 1;
            /* Takes remaining space */
            word-break: break-word;
        }

        /* .name-title {
            font-size: 24px;
            color: #ffffff;
            font-weight: bold;
            position: absolute;
            top: -12.5rem;
        } */

        .profile-text {
            background-color: white;
            border-radius: 5px;
            text-align: left;
            width: 100%;
        }

        .experience-item,
        .education-item {
            margin-bottom: 10px;
            page-break-inside: avoid;
        }

        .job-title {
            font-size: 16px;
            font-weight: bold;
            color: #2c3e50;
        }

        .company-name {
            color: var(--primary-color);
            font-weight: bold;
        }

        .date-range {
            color: #666;
            font-style: italic;
            margin: 0px 0;
        }

        .job-description {
            margin-left: 0px;
        }

        .job-description ul {
            margin-left: 20px;
        }

        .expertise-list ul {
            margin-bottom: 15px;
            padding-left: 16px;
        }

        .expertise-list li {
            margin-bottom: 5px;
            padding: 5px;
            border-radius: 4px;
        }

        .download-btn-container {
            position: absolute;
            top: 20px;
            right: 20px;
            z-index: 100;
        }

        .download-btn {
            display: inline-block;
            background: var(--primary-color);
            color: white;
            padding: 10px 20px;
            text-decoration: none;
            border-radius: 5px;
            border: none;
            cursor: pointer;
        }

        .color-selection,
        .sidebar-color-selection {
            margin: 20px;
            text-align: center;
        }

        .color-selection label,
        .sidebar-color-selection label {
            margin-right: 15px;
            cursor: pointer;
        }

        .signature-section {
            position: relative;
            top: 1rem;
            left: -19.5rem;
            margin-top: 20px;
            padding-top: 30px;
            text-align: center;
            page-break-inside: avoid;
        }

        .signature-container {
            display: flex;
            justify-content: space-between;
            align-items: flex-end;
            max-width: 600px;
            margin: 0 auto;
        }

        .signature-block {
            flex: 1;
            margin: 0 10px;
        }

        .signature-line {
            border-bottom: 1px solid #000;
            width: fit-content;
            min-width: 50px;
            align-self: flex-start;
            margin: 4px 0;
            height: 1px;
        }

        .signature-value {
            font-size: 16px;
            color: #333;
            display: inline-block;
        }

        .signature-label {
            font-size: 14px;
            color: #2c3e50;
            /* margin-top: 5px; */
        }

        .main-content-area {
            position: absolute;
            top: 24.2rem;
            left: 20rem;
        }

        .header {
            display: flex;
            align-items: flex-start;
            gap: 20px;
            position: relative;
            top: -1rem;
            /* left: 23rem; */
            z-index: 1000;
        }

        .left {
            flex-shrink: 0;
        }

        .profile-image-container {
            width: 170px;
            height: 170px;
            overflow: hidden;
            border-radius: 50%;
        }

        .profile-image {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .right {
            position: relative;
            top: 2rem;
            left: 2rem;
            display: flex;
            flex-direction: column;
            justify-content: flex-start;
        }

        .name-title {
            font-size: 1.5rem;
            font-weight: bold;
            color: #ffffff;
            text-transform: uppercase;
        }

        .title-section {
            font-size: 1rem;
            color: #555;
        }

        .section1 {
            position: relative;
            top: -0.5rem;
            left: -0.4rem;
            text-align: wrap;
            width: 17rem;
            page-break-inside: avoid;

        }

        .section2 {
            top: 0.5rem;
            position: relative;
            page-break-inside: avoid;
        }

        .title-section {
            position: relative;
            top: 0.3rem;
            width: 100%;
            color: #ffffff;
            text-align: wrap;
            page-break-inside: avoid;
        }

        .referees-list {
            display: flex;
            flex-direction: row;
            justify-content: space-between;
            gap: 20px;
            margin-bottom: 5rem;
            padding-left: 16px;
            /* width: 150%; */
            text-align: justify
        }

        .second {
            position: relative;
            left: 17rem;
            display: flex;
            flex-direction: column;
        }

        .referees-section {
            position: relative;
            left: -11rem;
        }

        .third {
            position: relative;
            text-align: left;
            left: 0.35rem;
        }

        .fourth {
            position: relative;
            left: 17rem;
            display: flex;
            flex-direction: column;
            align-items: flex-start;
        }

        @media print {
            @page {
                size: A4;
                margin-top: 4rem;
                margin-bottom: 5mm;
                break-inside: avoid-page;
                page-break-before: avoid;
            }

            @page :first {
                margin-top: 0;
                margin-bottom: 5mm;
            }

            body {
                margin: -1rem;
                padding: 0;
                -webkit-print-color-adjust: exact !important;
                print-color-adjust: exact !important;
            }

            .page-container {
                height: auto !important;
            }

            .main-grid {
                height: auto !important;
                break-inside: avoid;
            }

            .sidebar {
                /* padding: 10mm; */
                /* height: auto !important; */
                width: 52rem;
                break-inside: avoid-page;
            }

            .main-content {
                height: auto !important;
                top: -0.3rem;
                width: 50rem;
                break-inside: avoid-page;
            }

            .section-title {
                margin: 6mm 0;
                page-break-before: avoid;
                /* page-break-after: avoid; */
            }

            .download-btn,
            .color-selection,
            .sidebar-color-selection {
                display: none;
            }

            .page-break {
                page-break-before: always;
                break-before: page;
                margin-top: 10mm;
            }

            .section1 {
                top: -0.6rem;
            }

            .signature-section {
                left: -19.5rem;
            }

            .referees-list {
                position: relative;
                display: flex;
                flex-direction: row;
                gap: 2rem;
                margin-bottom: 5rem;
                padding-left: 16px;
                text-align: justify
            }

            .referees-section {
                position: relative;
                left: -12.3rem;

            }
        }

        .content-wrapper {
            margin-top: -14rem !important;
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

    <div class="color-selection">
        <p>Select Primary Color:</p>
        <label for="color1">
            <input type="radio" name="primary_color_radio" id="color1" value="#3498db" checked
                onchange="updatePrimaryColor(this.value)">
            <span style="color: #3498db;">Blue</span>
        </label>
        <label for="color2">
            <input type="radio" name="primary_color_radio" id="color2" value="#e74c3c"
                onchange="updatePrimaryColor(this.value)">
            <span style="color: #e74c3c;">Red</span>
        </label>
        <label for="color3">
            <input type="radio" name="primary_color_radio" id="color3" value="#27ae60"
                onchange="updatePrimaryColor(this.value)">
            <span style="color: #27ae60;">Green</span>
        </label>
    </div>

    <div class="sidebar-color-selection">
        <p>Select Sidebar Color:</p>
        <label for="sidebar_color1">
            <input type="radio" name="sidebar_color_radio" id="sidebar_color1" value="#0A4D2E" checked
                onchange="updateSidebarColor(this.value)">
            <span style="color: #0A4D2E;">Dark Green</span>
        </label>
        <label for="sidebar_color2">
            <input type="radio" name="sidebar_color_radio" id="sidebar_color2" value="#7f8c8d"
                onchange="updateSidebarColor(this.value)">
            <span style="color: #7f8c8d;">Dark Gray</span>
        </label>
        <label for="sidebar_color3">
            <input type="radio" name="sidebar_color_radio" id="sidebar_color3" value="#1A355E"
                onchange="updateSidebarColor(this.value)">
            <span style="color: #1A355E">Blue</span>
        </label>
        <label for="sidebar_color4">
            <input type="radio" name="sidebar_color_radio" id="sidebar_color4" value="#5C1A1B"
                onchange="updateSidebarColor(this.value)">
            <span style="color: #5C1A1B">Red</span>
        </label>
    </div>

    <div class="download-btn-container">
        <form action="{{ route('generate.cv3') }}" method="POST">
            @csrf
            <input type="hidden" name="name" value="{{ old('name', $name) }}">
            <input type="hidden" name="email" value="{{ old('email', $email) }}">
            <input type="hidden" name="contact_number" value="{{ old('contact_number', $contact_number) }}">
            <input type="hidden" name="employer_id" value="{{ old('employer_id', $employer_id) }}">
            <input type="hidden" name="job_posting_id" value="{{ old('job_posting_id', $job_posting_id) }}">
            <input type="hidden" name="message" value="{{ old('message', $message) }}">
            <input type="hidden" name="primary_color" id="primaryColorInput" value="{{ $primaryColor }}">
            <input type="hidden" name="sidebar_color" id="sidebarColorInput" value="{{ $sidebarColor }}">

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

    <div class="page-container">
        <div class="main-grid">
            <div class="main-sidear-area">
                <div class="sidebar">
                    <div class="header">
                        <div class="left">
                            @if ($imageSrc)
                                <div class="profile-image-container">
                                    <img src="{{ $imageSrc }}" alt="Profile Image" class="profile-image">
                                </div>
                            @endif
                        </div>
                        <div class="right">
                            <h1 class="name-title">{{ $user->name }}</h1>
                            <div class="title-section">
                                {!! $user->title !!}
                            </div>
                        </div>
                    </div>
                    <div class="section1">
                        <div class="contact-section">
                            <h2 class="section-title">CONTACT</h2>
                            <div class="contact-info">
                                <ul>
                                    <li>
                                        @if ($user->address)
                                            <div class="contact-item">
                                                <i class="fas fa-map-marker-alt"></i>
                                                <div class="contact-text">{{ $user->address }}</div>
                                            </div>
                                        @endif
                                    </li>
                                    <li>
                                        @if ($user->phone_number)
                                            <div class="contact-item">
                                                <i class="fas fa-phone"></i>
                                                <div class="contact-text">{{ $user->phone_number }}</div>
                                            </div>
                                        @endif
                                    </li>
                                    <li>
                                        @if ($user->email)
                                            <div class="contact-item">
                                                <i class="fas fa-envelope"></i>
                                                <div class="contact-text">{{ $user->email }}</div>
                                            </div>
                                        @endif
                                    </li>
                                    <li>
                                        @if ($user->linkedin)
                                            <div class="contact-item">
                                                <i class="fab fa-linkedin"></i>
                                                <div class="contact-text">{{ $user->linkedin }}</div>
                                            </div>
                                        @endif
                                    </li>
                                    <li>
                                        @if ($user->portfolio_link)
                                            <div class="contact-item">
                                                <i class="fas fa-globe"></i>
                                                <div class="contact-text">{{ $user->portfolio_link }}</div>
                                            </div>
                                        @endif
                                    </li>
                                </ul>
                            </div>
                        </div>

                        @if (
                            $user->fullname ||
                                $user->marital_status ||
                                $user->date_of_birth ||
                                $user->gender ||
                                $user->nationality ||
                                $user->nic_no)
                            <div class="personal-details-section">
                                <h2 class="section-title">PERSONAL DETAILS</h2>
                                <div class="personal-details-list">
                                    @if ($user->fullname)
                                        <div class="contact-item">
                                            <i class="fas fa-user"></i>
                                            <div class="contact-text"><strong>Full Name:</strong>
                                                {{ $user->fullname }}
                                            </div>
                                        </div>
                                    @endif
                                    @if ($user->marital_status)
                                        <div class="contact-item">
                                            <i class="fas fa-heart"></i>
                                            <div class="contact-text"><strong>Marital:</strong>
                                                {{ $user->marital_status }}
                                            </div>
                                        </div>
                                    @endif
                                    @if ($user->date_of_birth)
                                        <div class="contact-item">
                                            <i class="fas fa-birthday-cake"></i>
                                            <div class="contact-text"><strong>DOB:</strong>
                                                {{ \Carbon\Carbon::parse($user->date_of_birth)->format('d M, Y') }}
                                            </div>
                                        </div>
                                    @endif
                                    @if ($user->gender)
                                        <div class="contact-item">
                                            <i class="fas fa-venus-mars"></i>
                                            <div class="contact-text"><strong>Gender:</strong> {{ $user->gender }}
                                            </div>
                                        </div>
                                    @endif
                                    @if ($user->nationality)
                                        <div class="contact-item">
                                            <i class="fas fa-flag"></i>
                                            <div class="contact-text"><strong>Nationality:</strong>
                                                {{ $user->nationality }}
                                            </div>
                                        </div>
                                    @endif
                                    @if ($user->nic_no)
                                        <div class="contact-item">
                                            <i class="fas fa-id-card"></i>
                                            <div class="contact-text"><strong>NIC:</strong> {{ $user->nic_no }}</div>
                                        </div>
                                    @endif
                                </div>
                            </div>
                        @endif

                        <div class="expertise-section">
                            <h2 class="section-title">EXPERTISE</h2>
                            <div class="expertise-list">
                                @if ($user->skills)
                                    {!! $user->skills !!}
                                @endif
                            </div>
                        </div>

                        <div class="certifications-section">
                            <h2 class="section-title">IT & COMPUTER SKILLS</h2>
                            <div class="expertise-list">
                                @if ($user->certifications)
                                    {!! $user->certifications !!}
                                @endif
                            </div>
                        </div>


                    </div>
                </div>
            </div>
            <div class="main-content-area">
                <div class="main-content">
                    <div class="content-wrapper">
                        @if ($user->summary)
                            <div class="profile-section">
                                <h2 style="margin-bottom: 5px;" class="section-title">PROFILE</h2>
                                <div class="experience-item">
                                    <div class="profile-text">
                                        <p style="text-align: justify;">{{ $user->summary }}</p>
                                    </div>
                                </div>
                            </div>
                        @endif

                        @if (isset($experiences) && $experiences->count() > 0)
                            <div class="experience-section">
                                <h2 style="margin-bottom: 5px;" class="section-title">WORK EXPERIENCE</h2>
                                @foreach ($experiences as $experience)
                                    <div class="experience-item">
                                        <div class="job-title">{{ $experience->job_title }}</div>
                                        <div class="" style="display: flex; justify-content: space-between;">
                                            <div class="company-name">{{ $experience->company_name }}</div>
                                            <div class="date-range" style="white-space: nowrap;">
                                                {{ \Carbon\Carbon::parse($experience->start_date)->format('Y') }} -
                                                {{ $experience->end_date ? \Carbon\Carbon::parse($experience->end_date)->format('Y') : 'Present' }}
                                            </div>
                                        </div>
                                        <div class="job-description" style="text-align: justify;">
                                            {!! $experience->job_description !!}
                                        </div>
                                    </div>
                                @endforeach
                            </div>
                        @endif

                        @if (isset($educations) && $educations->count() > 0)
                            <div class="education-section">
                                <h2 style="margin-bottom: 5px;" class="section-title">Professional Qualification
                                </h2>
                                @foreach ($educations as $education)
                                    <div class="education-item">
                                        <div class="degree job-title">{{ $education->degree }} in
                                            {{ $education->institution_name }}</div>
                                        @if ($education->field_of_study)
                                            <div class="job-description">{!! $education->field_of_study !!}</div>
                                        @endif
                                        <div class="institution">{{ $education->institution_name }}</div>
                                    </div>
                                @endforeach
                            </div>
                        @endif

                        @if (isset($academicEducations) && $academicEducations->count() > 0)
                            <div class="education-section">
                                <h2 style="margin-bottom: 5px;" class="section-title">Academic Qualifications</h2>
                                @foreach ($academicEducations as $education)
                                    <div class="education-item">
                                        <div class="degree job-title">{{ $education->degree }} in
                                            {{ $education->institution_name }}</div>
                                        @if ($education->field_of_study)
                                            <div class="job-description">{!! $education->field_of_study !!}</div>
                                        @endif
                                        <div class="institution">{{ $education->institution_name }}</div>
                                    </div>
                                @endforeach
                            </div>
                        @endif
                    </div>
                </div>

                <div class="signature-section">
                    <h4 class="referees-section">REFEREES</h4>
                    <div class="referees-list">
                        <div class="first">
                            @if ($user->referees)
                                {!! $user->referees !!}
                            @endif
                        </div>
                        <div class="second">
                            @if ($user->referees2)
                                {!! $user->referees2 !!}
                            @endif
                        </div>
                    </div>
                    <p
                        style="text-align: left; width: 155%; margin-bottom: 25px; margin-top:-60px; margin-left: 18px;">
                        I hereby certify that the
                        particulars given above are true and correct to the best of my knowledge.</p>
                    <div class="signature-container">
                        <div class="signature-block">
                            <div class="third">
                                <div class="signature-value">{{ $user->name }}</div>
                                <div class="signature-line"></div>
                                <div class="signature-label">Name and Signature</div>
                            </div>
                        </div>
                        <div class="signature-block">
                            <div class="fourth">
                                <div class="signature-value">{{ date('d/m/Y') }}</div>
                                <div class="signature-line"></div>
                                <div class="signature-label">Date</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </div>

    <script>
        function adjustSidebarHeight() {
            const mainContent = document.querySelector('.main-content');
            const sidebar = document.querySelector('.sidebar');
            const totalHeight = mainContent.offsetHeight;
            if (totalHeight <= 1122) {
                sidebar.classList.remove('tall');
            } else if (totalHeight > 1122 && totalHeight < 2244) {
                sidebar.classList.remove('tall2');
                sidebar.classList.remove('tall3');
                sidebar.classList.add('tall');
            } else if (totalHeight > 2244 && totalHeight < 3300) {
                sidebar.classList.add('tall2');
                sidebar.classList.remove('tall');
                sidebar.classList.remove('tall3');
            } else if (totalHeight > 3300 && totalHeight < 4488) {
                sidebar.classList.remove('tall2');
                sidebar.classList.remove('tall');
                sidebar.classList.add('tall3');
            }
            // sidebar.style.height = totalHeight + 'px';
        }

        window.addEventListener('load', adjustSidebarHeight);
        window.onbeforeprint = adjustSidebarHeight;

        function handlePrint() {
            adjustSidebarHeight();
            window.print();
        }

        window.onafterprint = function() {
            window.location.href = "/profile/cv3";
        };

        function updatePrimaryColor(newColor) {
            document.documentElement.style.setProperty('--primary-color', newColor);
            document.getElementById('primaryColorInput').value = newColor;
        }

        function updateSidebarColor(newColor) {
            document.documentElement.style.setProperty('--sidebar-color', newColor);
            document.getElementById('sidebarColorInput').value = newColor;
        }

        document.addEventListener("DOMContentLoaded", function() {
            const signatureBlocks = document.querySelectorAll('.signature-value');
            const signatureLines = document.querySelectorAll('.signature-line');

            signatureBlocks.forEach((el, index) => {
                if (signatureLines[index]) {
                    signatureLines[index].style.width = el.offsetWidth + 'px';
                }
            });
        });
    </script>


</body>

</html>
