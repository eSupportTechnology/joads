<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Job Posting Platform</title>

    <link rel="stylesheet" href="{{ asset('css/header.css') }}">
    <link rel="stylesheet" href="{{ asset('css/home.css') }}">
    <link rel="stylesheet" href="{{ asset('css/footer.css') }}">

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <style>
        .container {
            display: grid;
            gap: 20px;
            padding: 20px;
            max-width: 1400px;
            margin: 0 auto;
        }

        .postcontainer {
            border: 1px solid #409cf1;
            border-radius: 5px;
            background-color: #ffffff;
            padding: 15px;
        }

        .postheader {
            background-color: #e0f0ff;
            color: #000;
            font-weight: bold;
            padding: 10px 15px;
            font-size: 1.1em;
            border-radius: 5px 5px 5px 5px;
        }

        .postheader2 {
            background-color: darkblue;
            color: #fff;
            font-weight: bold;
            padding: 10px 15px;
            font-size: 1.1em;
            border-radius: 5px;

        }

        .postcontent {
            padding: 15px;
           

        }

       .postcontent2 {
            padding: 15px;
            display: flex;
            justify-content: flex-start;
            align-items: center;
        }

        .grid-row {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 20px;
        }

        .contact-table {
            width: 100%;
            border-collapse: collapse;
            background-color: #f9f9f9;
        }

        .contact-table th, .contact-table td {
    padding: 8px 20px;
    border: 1px solid #ddd;
    text-align: left;
}

        .contact-table th {
            font-weight: bold;
        }
        
        .table-align {

            display: flex;
            justify-content: flex-start;
            align-items: center;
        }

        .contact-table .emailth,
        .email,
        .tfooter {
            background-color: #ffe599;
        }

        .contact-table .tfooter {
            color: blue;
        }

        .email {
            font-style: italic;
            color: red;
            font-weight: bold;
        }

        .rate-table {
            width: 100%;
            border-collapse: collapse;
            text-align: center;
        }

        .rate-table th,
        .rate-table td {
            border: 1px solid #ddd;
            padding: 8px;
        }

        .rate-table th {
            background-color: #ffe599;
            font-weight: bold;
        }

        .rate-table .package {
            background-color: #ac0c0c;
            color: white;
            font-weight: bold;
        }

        .rate-table .lkrprice {
            background-color: rgb(162, 185, 226);
        }

        .rate-table .usdprice {
            background-color: rgb(150, 148, 148);
        }

        .rate-table .pricetitle {
            color: white;
        }

        .payment-scroll-wrapper {
           
            overflow-x: auto;
            -webkit-overflow-scrolling: touch;
            /* Smooth scrolling on iOS */
            margin-bottom: 20px;
        }

        /* Style the scrollbar */
        .payment-scroll-wrapper::-webkit-scrollbar {
            height: 8px;
        }

        .payment-scroll-wrapper::-webkit-scrollbar-track {
            background: #f1f1f1;
            border-radius: 4px;
        }

        .payment-scroll-wrapper::-webkit-scrollbar-thumb {
            background: #888;
            border-radius: 4px;
        }

        .payment-table {
            width: 100%;
            border-collapse: collapse;
            text-align: left;
        }

        .payment-table2 {
            width: 400px;
            border-collapse: collapse;
            text-align: left;
        }


        .payment-table th,
        .payment-table td {
            border: 1px solid #ddd;
            padding: 8px;
        }

        .payment-table2 th,
        .payment-table2 td {
            border: 1px solid #ddd;
            padding: 4px;
        }

        .payment-header {
            background-color: #ac0c0c;
            color: white;
            text-align: center;
            font-weight: bold;
            padding: 10px;
        }

        .payment-header2 {
            width: 77%;
            background-color: #ac0c0c;
            color: white;
            text-align: center;
            font-weight: bold;
            padding: 10px;
        }

       .payment-table .title1 {
            background-color: #ac0c0c;
            padding: 0 20px 0 30px;
            color: white;
            width: 170px;
        }

        .payment-table2 .title1 {
            background-color: #ac0c0c;
            padding: 0 20px 0 30px;
            color: white;
            width: 170px;
        }

        .payment-table .bgcolor {
            background-color: rgb(150, 198, 238);
        }

        .payment-table2 .bgcolor {
            background-color: rgb(150, 198, 238);
        }

        .section-button {
            padding: 10px 20px;
            margin-right: 10px;
            background-color: rgb(31, 138, 165);
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            position: relative;
            /* Add this */
        }

        /* Add these new styles for triangle */
        .active-button::after {
            content: '';
            position: absolute;
            bottom: -8px;
            left: 50%;
            transform: translateX(-50%);
            width: 0;
            height: 0;
            border-left: 8px solid transparent;
            border-right: 8px solid transparent;
            border-top: 8px solid darkblue;
            /* Same color as button */
        }

        .section-button:hover {
            background-color: #357ab7;
        }

        .btn-section {
            display: flex;
            justify-content: center;
            margin-top: 20px;


        }

        .active-button {
            background-color: darkblue !important;
            color: white;
        }

        .contact-table {
            width: 100%;
            border-collapse: collapse;
            table-layout: fixed;
            /* Fix column sizes */
        }

        

        .contact-name {
            width: 40%;
            /* Adjust width for Name */
        }

        .separator {
            width: 5%;
            /* Adjust width for ":" */
            text-align: center;
            /* Center align ":" */
        }

        .contact-phone {
            width: 55%;
            /* Adjust width for Phone */
        }

        .rate-scroll-wrapper {
            width: 100%;
            overflow-x: auto;
            -webkit-overflow-scrolling: touch;
            margin-bottom: 20px;
        }

        .rate-scroll-wrapper::-webkit-scrollbar {
            height: 8px;
        }

        .rate-scroll-wrapper::-webkit-scrollbar-track {
            background: #f1f1f1;
            border-radius: 4px;
        }

        .rate-scroll-wrapper::-webkit-scrollbar-thumb {
            background: #888;
            border-radius: 4px;
        }

        /* Rate table specific styles */
        .rate-table {
            min-width: 96%;
            /* Forces horizontal scroll on mobile */
            width: 100%;
            border-collapse: collapse;
            text-align: center;
        }

        /* Remove horizontal scroll from other tables */
        .contact-table,
        .payment-table,
        {
        width: 100%;
        overflow-x: visible;
        }

        .payment-table2 {
            overflow-x: visible;
        }
        
        .active::after {
            content: '';
            position: absolute;
            bottom: -8px;
            left: 50%;
            transform: translateX(-50%);
            width: 0;
            height: 0;
            border-left: 8px solid transparent;
            border-right: 8px solid transparent;
            border-top: 8px solid darkblue;
            /* Same color as button */
        }
        
        

        /* Mobile specific styles */
        @media (max-width: 768px) {

            /* Show scroll indicator only for rate table */
            .rate-scroll-wrapper .scroll-indicator {
                display: block;
                text-align: center;
                color: #666;
                font-size: 0.9rem;
                margin-bottom: 10px;
            }

            /* Prevent horizontal scroll on other tables */
            .contact-table,
            .payment-table,
            .payment-table2 {
                width: 100%;
                overflow-x: visible;
            }

            /* Stack cells in other tables for better mobile view */
            .contact-table td,
            .payment-table td,
            .payment-table2 td {
                display: table-cell;
                width: auto;
            }

            /* Keep rate table scrollable */
            .rate-table th,
            .rate-table td {
                white-space: nowrap;
                padding: 6px;
            }
        }

        .payment-buttons {
            text-align: left;
            margin: 20px 0;
        }

       .payment-type-btn {
            padding: 10px 20px;
            margin: 0 10px;
            background-color: rgb(31, 138, 165);
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .payment-type-btn.active {
            background-color: darkblue !important;
            color: white;
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }

        .table-container {
            width: 100%;
            overflow-x: auto;
            margin: 20px 0;
        }

        .payment-table {
            width: 100%;
            max-width: 1000px;
            margin: 0 auto;
            border-collapse: collapse;
        }
    </style>
</head>

<body>
    @include('home.header')

    <!-- Section buttons -->
    <div class="btn-section">
        <button class="section-button active-button" id="job-button">Job Ads</button>
        <button class="section-button" id="banner-button">Banners</button>
        <a href="{{ route('employer.login') }}" class="category-btn"
            style="text-decoration: none; padding: 6px 6px; border-radius: 5px; box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
     transition: all 0.3s ease;  background: linear-gradient(to bottom, #28adce, #18799c);; color: white; "
            onmouseover=" this.style.transform='translateY(-3px)'; this.style.boxShadow='0 12px 24px rgba(0, 0, 0, 0.3)'; this.style.backgroundColor='#6c9dbd';"
            onmouseout=" this.style.transform='translateY(0)'; this.style.boxShadow='0 8px 16px rgba(0, 0, 0, 0.2)'; this.style.backgroundColor=' #6bbed4';">
            EMPLOYER LOGIN
        </a>
    </div>

    <!-- job section -->
    <div id="job-section" class="container">
        <!-- First Row -->
        @if (!empty($packageDetails->description_one))
            <div class="grid-row">
                <div class="postcontainer">
                    <div class="postheader2">
                        jobads.lk is the most trusted and effective way to advertise your vacancy and recruit talent
                        from Sri Lanka.
                        Select any of the following options.
                    </div>
                    <div class="postcontent">
                        {!! $packageDetails->description_one !!}
                    </div>
                </div>
            </div>
        @endif

        <div class="grid-row">
            @if (!empty($contactsList) && count($contactsList) > 0)
                <div class="postcontainer">
                    <div class="postheader">
                        Send your Job vacancy to - E-Mail/Call/WhatsApp
                    </div>
                    <div class="postcontent">
                        <table class="contact-table">
                            <tr>
                                <th class="emailth" style="background-color: #fad157;">Email:</th>
                                <td class="email" colspan="2">{{ $packageDetails->email }}</td>
                            </tr>
                            <tr>
                                <th rowspan="{{ count($contactsList) + 1 }}" style="background-color: #fad157;">
                                    Call or WhatsApp</th>
                            </tr>
                            @foreach ($contactsList as $contact)
                                <tr style="background-color: #ffe599;">
                                    <td class="contact-name">{{ $contact->name }}</td>

                                    <td class="contact-phone">{{ $contact->phone }}</td>
                                </tr>
                            @endforeach
                            <tr>
                                <td colspan="3" style="background-color: #fad157;" class="tfooter">
                                    <strong>For International:</strong> Prefix the number with '+94' e.g., +94 777 580 451
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
                    <div class="postcontent">
                        {!! $packageDetails->description_two !!}
                    </div>
                </div>
            @endif
            @if ($packages->isNotEmpty())
                <div class="postcontainer">
                    <div class="postheader">
                        Rate Card for Vacancy Advertising : effective from {{ $packageDetails->effective_date }}
                    </div>
                    <div class="postcontent">

                        <div class="rate-scroll-wrapper">



                            <table class="rate-table">
                                <tr>
                                    <th class="package">Package size (Duration)</th>
                                    @php
                                        $duration1 = $durations->firstWhere('id', 1); // Get duration where id = 1
                                        $duration2 = $durations->firstWhere('id', 2); // Get duration where id = 2
                                    @endphp

                                    <th class="package" colspan="2">
                                        {{ $duration1 ? $duration1->duration : '0' }} Days
                                    </th>
                                    <th class="package" colspan="2">
                                        {{ $duration2 ? $duration2->duration : '0' }} Days
                                    </th>
                                </tr>
                                <tr>
                                    <th class="package"> Per ads</th>
                                    <th class="lkrprice pricetitle">LKR Price</th>
                                    <th class="usdprice pricetitle"> USD Price</th>
                                    <th class="lkrprice pricetitle">LKR Price</th>
                                    <th class="usdprice pricetitle"> USD Price</th>
                                </tr>

                                @php
                                    $groupedPackages = $packages->groupBy('package_size');
                                @endphp

                                @foreach ($groupedPackages as $packageSize => $packageGroup)
                                    <tr>
                                        <td class="package">Per ads</td> @php
                                            $twentyDays = $packageGroup->firstWhere('duration_id', 1);
                                            $thirtyDays = $packageGroup->firstWhere('duration_id', 2);
                                        @endphp
                                        <td class="lkrprice">
                                            {{ isset($twentyDays->lkr_price) ? intval($twentyDays->lkr_price) : 'N/A' }}
                                        </td>
                                        <td class="usdprice">
                                            {{ isset($twentyDays->usd_price) ? intval($twentyDays->usd_price) : 'N/A' }}
                                        </td>
                                        <td class="lkrprice">
                                            {{ isset($thirtyDays->lkr_price) ? intval($thirtyDays->lkr_price) : 'N/A' }}
                                        </td>
                                        <td class="usdprice">
                                            {{ isset($thirtyDays->usd_price) ? intval($thirtyDays->usd_price) : 'N/A' }}
                                        </td>

                                    </tr>
                                @endforeach

                                <tr>
                                    <td class="package">10 or more ads per month:</td>
                                    <td class="lkrprice" colspan="4">
                                        1. Email OR<br />
                                        2. Request a special quotation
                                    </td>
                                </tr>
                            </table>

                        </div>

                    </div>

                </div>
            @endif
        </div>
        <!-- Third Row -->
        @if (!empty($packageDetails->description_three))
            <div class="grid-row">
                <div class="postcontainer">
                    <div class="postheader">
                        Method of Advertising Your Job Vacancy:
                    </div>
                    <div class="postcontent">
                        {!! $packageDetails->description_three !!}
                    </div>
                </div>
            </div>
        @endif

        <div class="payment-buttons">
            <button class="payment-type-btn active" id="localPaymentBtn">Local Payments (LKR)</button>
            <button class="payment-type-btn" id="foreignPaymentBtn">Foreign Payments (USD)</button>
            <button class="payment-type-btn" style="background-color: #00B050; color: white; ">IPG</button>
        </div>

        <!-- Fourth Row -->
        <div class="grid-row">
            <div id="localPaymentSection">
                @if ($localBanks->isNotEmpty())
                    <div class="postcontainer">
                        <div class="postheader">
                            Local Payments:
                        </div>
                        <div class="postcontent">
                            <div class="table-align">
                            <div class="payment-scroll-wrapper">
                                <table class="payment-table">
                                    <tr>
                                        <th class="title1" colspan="{{ count($localBanks) * 2 }}"
                                            style="padding: 10px 20px; text-align:center;">
                                            Online Fund Transfers or Direct Deposits</th>
                                    </tr>
                                    <tr>
                                        <th class="title1"> LKR Payments</th>
                                        @foreach ($localBanks as $lb)
                                            <th colspan="2" style="text-align:center;">
                                                @if ($lb->logo)
                                                    <img src="{{ asset('storage/app/public/' . $lb->logo) }}"
                                                        style="height:50px; width:100px;"
                                                        alt="{{ $lb->bank_name }} Logo" class="logo-thumbnail">
                                                @else
                                                    <span
                                                        class="text-muted"><strong>{{ $lb->bank_name }}</strong></span>
                                                @endif
                                            </th>
                                        @endforeach
                                    </tr>
                                    <tr>
                                        <td class="title1"><strong>Bank Name</strong></td>
                                        @foreach ($localBanks as $lb)
                                            <td class="bgcolor" colspan="2"><strong>{{ $lb->bank_name }}</strong>
                                            </td>
                                        @endforeach
                                    </tr>
                                    <tr>
                                        <td class="title1"><strong>Account Name</strong></td>
                                        @foreach ($localBanks as $lb)
                                            <td class="bgcolor" colspan="2">{{ $lb->account_name }}</td>
                                        @endforeach
                                    </tr>
                                    <tr>
                                        <td class="title1"><strong>Account No</strong></td>
                                        @foreach ($localBanks as $lb)
                                            <td class="bgcolor" colspan="2">{{ $lb->account_no }}</td>
                                        @endforeach
                                    </tr>
                                    <tr>
                                        <td class="title1"><strong>Bank Code</strong></td>
                                        @foreach ($localBanks as $lb)
                                            <td class="bgcolor" colspan="2">{{ $lb->bank_code }}</td>
                                        @endforeach
                                    </tr>
                                    <tr>
                                        <td class="title1"><strong>Branch</strong></td>
                                        @foreach ($localBanks as $lb)
                                            <td class="bgcolor" colspan="2">{{ $lb->branch_name }}</td>
                                        @endforeach
                                    </tr>
                                    <tr>
                                        <td class="title1"><strong>Branch Code</strong></td>
                                        @foreach ($localBanks as $lb)
                                            <td class="bgcolor" colspan="2">{{ $lb->branch_code }}</td>
                                        @endforeach
                                    </tr>
                                    <tr>
                                        <td class="title1"><strong>SWIFT Code</strong></td>
                                        @foreach ($localBanks as $lb)
                                            <td class="bgcolor" colspan="2">{{ $lb->swift_code }}</td>
                                        @endforeach
                                    </tr>
                                    <tr>
                                        <td class="title1"><strong>Currency</strong></td>
                                        @foreach ($localBanks as $lb)
                                            <td class="bgcolor" colspan="2">{{ $lb->currency }}</td>
                                        @endforeach
                                    </tr>
                                </table>
                            </div>
                            </div>
                        </div>
                    </div>
                @endif
            </div>

            <div id="foreignPaymentSection" style="display: none;">
                @if ($foreignBanks->isNotEmpty())
                    <div class="postcontainer">
                        <div class="postheader">
                            Foreign Payments:
                        </div>
                        <div class="postcontent2">
                            <table class="payment-table2">
                                <tr>
                                    <th class="title1" colspan="2" style="padding: 10px 20px; text-align:center;">
                                        Online Fund Transfers or Direct Deposits</th>
                                </tr>
                                <tr>
                                    <th class="title1 subhead"> USD Payments</th>
                                    @foreach ($foreignBanks as $fb)
                                        <th style="text-align:center;">
                                            @if ($fb->logo)
                                                <img src="{{ asset('storage/app/public/' . $fb->logo) }}"
                                                    style="height:50px; width:100px;" alt="{{ $fb->bank_name }} Logo"
                                                    class="logo-thumbnail">
                                            @else
                                                <span class="text-muted"><strong>{{ $fb->bank_name }}</strong></span>
                                            @endif
                                        </th>
                                    @endforeach
                                </tr>
                                <tr>
                                    <td class="title1 subhead"><strong>Bank Name</strong></td>
                                    @foreach ($foreignBanks as $fb)
                                        <td class="bgcolor" colspan="2"><strong>{{ $fb->bank_name }}</strong></td>
                                    @endforeach
                                </tr>
                                <tr>
                                    <td class="title1 subhead"><strong>Account Name</strong></td>
                                    @foreach ($foreignBanks as $fb)
                                        <td class="bgcolor" colspan="2">{{ $fb->account_name }}</td>
                                    @endforeach
                                </tr>
                                <tr>
                                    <td class="title1 subhead"><strong>Account No</strong></td>
                                    @foreach ($foreignBanks as $fb)
                                        <td class="bgcolor" colspan="2">{{ $fb->account_no }}</td>
                                    @endforeach
                                </tr>
                                <tr>
                                    <td class="title1 subhead"><strong>Bank Code</strong></td>
                                    @foreach ($foreignBanks as $fb)
                                        <td class="bgcolor" colspan="2">{{ $fb->bank_code }}</td>
                                    @endforeach
                                </tr>
                                <tr>
                                    <td class="title1 subhead"><strong>Branch</strong></td>
                                    @foreach ($foreignBanks as $fb)
                                        <td class="bgcolor" colspan="2">{{ $fb->branch_name }}</td>
                                    @endforeach
                                </tr>
                                <tr>
                                    <td class="title1 subhead"><strong>Branch Code</strong></td>
                                    @foreach ($foreignBanks as $fb)
                                        <td class="bgcolor" colspan="2">{{ $fb->branch_code }}</td>
                                    @endforeach
                                </tr>
                                <tr>
                                    <td class="title1 subhead"><strong>SWIFT Code</strong></td>
                                    @foreach ($foreignBanks as $fb)
                                        <td class="bgcolor" colspan="2">{{ $fb->swift_code }}</td>
                                    @endforeach
                                </tr>
                                <tr>
                                    <td class="title1 subhead"><strong>Currency</strong></td>
                                    @foreach ($foreignBanks as $fb)
                                        <td class="bgcolor" colspan="2">{{ $fb->currency }}</td>
                                    @endforeach
                                </tr>
                            </table>
                        </div>
                    </div>
                @endif
            </div>
        </div>

        <!-- Fifth Row -->
        <div class="grid-row">
            <div class="postcontainer">
                <div class="postcontent" style="background-color:orange; border-radius:15px">
                    <span style="color:red; font-weight:bold">Special:</span>
                    <p>Once the payment is made, Please send the scanned copy/photo of the deposited slip via email or
                        to WhatsApp number above.</p>
                    <p>For payments using fund transfer, You can send the screenshot of the receipt.</p>
                </div>
            </div>
        </div>
    </div>

    <!-- banner section -->

    <div id="banner-section" class="container">


        <!-- First Row -->
        @if (!empty($packageDetailsBanners->description_one))
            <div class="grid-row">
                <div class="postcontainer">
                    <div class="postheader2">
                        www.jobads.lk Web Site Banner Advertising
                    </div>
                    <div class="postcontent">
                        {!! $packageDetailsBanners->description_one !!}
                        {!! $packageDetailsBanners->description_two !!}
                    </div>
                </div>
            </div>
        @endif

       <!-- Second Row -->
        <div class="grid-row">
            @if (!empty($contactsList) && count($contactsList) > 0)
                <div class="postcontainer">
                    <div class="postheader">
                        Send your Job vacancy to - E-Mail/Call/WhatsApp
                    </div>
                    <div class="postcontent">
                        <table class="contact-table">
                            <tr>
                                <th class="emailth" style="background-color: #fad157;">Email:</th>
                                <td class="email" colspan="2">{{ $packageDetails->email }}</td>
                            </tr>
                            <tr>
                                <th rowspan="{{ count($contactsList) + 1 }}" style="background-color: #fad157;">
                                    Call or WhatsApp</th>
                            </tr>
                            @foreach ($contactsList as $contact)
                                <tr style="background-color: #ffe599;">
                                    <td class="contact-name">{{ $contact->name }}</td>

                                    <td class="contact-phone">{{ $contact->phone }}</td>
                                </tr>
                            @endforeach
                            <tr>
                                <td colspan="3" style="background-color: #fad157;" class="tfooter">
                                    <strong>For International:</strong> Prefix the number with '+94' e.g., +94 777 580 451
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
            @endif
            @if ($packagesBanners->isNotEmpty())
                <div class="postcontainer">
                    <div class="postheader">
                        Rate Card for Banner Posts Advertising : effective from
                        {{ $packageDetailsBanners->effective_date }}
                    </div>
                    <div class="postcontent">
                        <div class="rate-scroll-wrapper">
  
                        <table class="rate-table">
                        <tr>
                            <th class="package">Package size (Banner Posts)</th>
                            @php
                                $duration1 = $durations->firstWhere('id', 3); // Get duration where id = 1
                                $duration2 = $durations->firstWhere('id', 4); // Get duration where id = 2
                            @endphp

                            <th class="package" colspan="2">
                                {{ $duration1 ? $duration1->duration : '0' }} Days
                            </th>
                            <th class="package" colspan="2">
                                {{ $duration2 ? $duration2->duration : '0' }} Days
                            </th>
                        </tr>
                        <tr>
                           <th class="package"> Per ads</th>
                            <th class="lkrprice pricetitle">LKR Price</th>
                            <th class="usdprice pricetitle">USD Price</th>
                            <th class="lkrprice pricetitle">LKR Price</th>
                            <th class="usdprice pricetitle">USD Price</th>
                        </tr>

                        @php
                        // Map prices based on duration
                        $du_id = $packagesBanners->keyBy('duration_id');
                        @endphp

                        <tr>
                            <td class="package">HOME PAGE (Landing Page)</td>
                            <td class="lkrprice">{{ $du_id[3]->price_lkr ?? 'N/A' }}</td>
                            <td class="usdprice">{{ $du_id[3]->price_usd ?? 'N/A' }}</td>
                            <td class="lkrprice">{{ $du_id[4]->price_lkr ?? 'N/A' }}</td>
                            <td class="usdprice">{{ $du_id[4]->price_usd ?? 'N/A' }}</td>
                        </tr>

                        <tr>
                            <td class="package">CATEGORY PAGE (When a user visits a specific job category)</td>
                            <td class="lkrprice">{{ $du_id[3]->price_lkr ?? 'N/A' }}</td>
                            <td class="usdprice">{{ $du_id[3]->price_usd ?? 'N/A' }}</td>
                            <td class="lkrprice">{{ $du_id[4]->price_lkr ?? 'N/A' }}</td>
                            <td class="usdprice">{{ $du_id[4]->price_usd ?? 'N/A' }}</td>
                        </tr>

                    </table>
                    </div>
                    </div>
                </div>
            @endif

        </div>

        <!-- Third Row -->
        @if (!empty($packageDetailsBanners->description_three))
            <div class="grid-row">
                <div class="postcontainer">
                    <div class="postheader">
                        Method of Advertising Your Banner Posts: Via Email / WhatsApp
                    </div>
                    <div class="postcontent">
                        {!! $packageDetailsBanners->description_three !!}
                    </div>
                </div>
            </div>
        @endif



        <!-- Third Row -->
        @if (!empty($packageDetails->description_three))
            <div class="grid-row">
                <div class="postcontainer">
                    <div class="postheader">
                        Method of Advertising Your Job Vacancy:
                    </div>
                    <div class="postcontent">
                        {!! $packageDetails->description_three !!}
                    </div>
                </div>
            </div>
        @endif



        <div class="payment-buttons">

            <button class="payment-type-btn active" id="localPaymentBtnb">Local Payments (LKR)</button>
            <button class="payment-type-btn" id="foreignPaymentBtnb">Foreign Payments (USD)</button>
            <button class="payment-type-btn" style="background-color: #00B050; color: white; ">IPG</button>
        </div>
        <!-- fourth Row -->
        <div class="grid-row">
            <div id="localPaymentSectionb">
                @if ($localBanks->isNotEmpty())
                    <div class="postcontainer">
                        <div class="postheader">
                            Local Payments:
                        </div>
                        <div class="postcontent">
                            {{-- <div class="payment-header">
                            Online Fund Transfers or Direct Deposits
                        </div> --}}
                        <div class="table-align">
                            <div class="payment-scroll-wrapper">
                                <table class="payment-table">
                                    <tr>
                                        <th class="title1" colspan="{{ count($localBanks) * 2 }}"
                                            style="padding: 10px 20px; text-align:center;">
                                            Online Fund Transfers or Direct Deposits</th>
                                    </tr>
                                    <tr>
                                        <th class="title1"> LKR Payments</th>
                                        @foreach ($localBanks as $lb)
                                            <th colspan="2" style="text-align:center;">
                                                @if ($lb->logo)
                                                    <img src="{{ asset('storage/app/public/' . $lb->logo) }}"
                                                        style="height:50px; width:100px;"
                                                        alt="{{ $lb->bank_name }} Logo" class="logo-thumbnail">
                                                @else
                                                    <span
                                                        class="text-muted"><strong>{{ $lb->bank_name }}</strong></span>
                                                @endif
                                            </th>
                                        @endforeach
                                    </tr>
                                    <tr>
                                        <td class="title1"><strong>Bank Name</strong></td>
                                        @foreach ($localBanks as $lb)
                                            <td class="bgcolor" colspan="2"><strong>{{ $lb->bank_name }}</strong>
                                            </td>
                                        @endforeach
                                    </tr>
                                    <tr>
                                        <td class="title1"><strong>Account Name</strong></td>
                                        @foreach ($localBanks as $lb)
                                            <td class="bgcolor" colspan="2">{{ $lb->account_name }}</td>
                                        @endforeach
                                    </tr>
                                    <tr>
                                        <td class="title1"><strong>Account No</strong></td>
                                        @foreach ($localBanks as $lb)
                                            <td class="bgcolor" colspan="2">{{ $lb->account_no }}</td>
                                        @endforeach
                                    </tr>
                                    <tr>
                                        <td class="title1"><strong>Bank Code</strong></td>
                                        @foreach ($localBanks as $lb)
                                            <td class="bgcolor" colspan="2">{{ $lb->bank_code }}</td>
                                        @endforeach
                                    </tr>
                                    <tr>
                                        <td class="title1"><strong>Branch</strong></td>
                                        @foreach ($localBanks as $lb)
                                            <td class="bgcolor" colspan="2">{{ $lb->branch_name }}</td>
                                        @endforeach
                                    </tr>
                                    <tr>
                                        <td class="title1"><strong>Branch Code</strong></td>
                                        @foreach ($localBanks as $lb)
                                            <td class="bgcolor" colspan="2">{{ $lb->branch_code }}</td>
                                        @endforeach
                                    </tr>
                                    <tr>
                                        <td class="title1"><strong>SWIFT Code</strong></td>
                                        @foreach ($localBanks as $lb)
                                            <td class="bgcolor" colspan="2">{{ $lb->swift_code }}</td>
                                        @endforeach
                                    </tr>
                                    <tr>
                                        <td class="title1"><strong>Currency</strong></td>
                                        @foreach ($localBanks as $lb)
                                            <td class="bgcolor" colspan="2">{{ $lb->currency }}</td>
                                        @endforeach
                                    </tr>
                                </table>
                            </div>
                        </div>
                    </div>
                    </div>
                @endif
            </div>
            <div id="foreignPaymentSectionb" style="display: none;">
                @if ($foreignBanks->isNotEmpty())
                    <div class="postcontainer">
                        <div class="postheader">
                            Foreign Payments:
                        </div>
                        <div class="postcontent2">
                            {{-- <div class="payment-header2">
                            Online Fund Transfers or Direct Deposits
                        </div> --}}
                            <table class="payment-table2">
                                <tr>
                                    <th class="title1" colspan="2" style="padding: 10px 20px; text-align:center;">
                                        Online Fund Transfers or Direct Deposits</th>
                                </tr>
                                <tr>
                                    <th class="title1 subhead"> USD Payments</th>
                                    @foreach ($foreignBanks as $fb)
                                        <th style="text-align:center;">
                                            @if ($fb->logo)
                                                <img src="{{ asset('storage/app/public/' . $fb->logo) }}"
                                                    style="height:50px; width:100px;" alt="{{ $fb->bank_name }} Logo"
                                                    class="logo-thumbnail">
                                            @else
                                                <span class="text-muted"><strong>{{ $fb->bank_name }}</strong></span>
                                            @endif
                                        </th>
                                    @endforeach
                                </tr>
                                <tr>
                                    <td class="title1 subhead"><strong>Bank Name</strong></td>
                                    @foreach ($foreignBanks as $fb)
                                        <td class="bgcolor" colspan="2"><strong>{{ $fb->bank_name }}</strong></td>
                                    @endforeach
                                </tr>
                                <tr>
                                    <td class="title1 subhead"><strong>Account Name</strong></td>
                                    @foreach ($foreignBanks as $fb)
                                        <td class="bgcolor" colspan="2">{{ $fb->account_name }}</td>
                                    @endforeach
                                </tr>
                                <tr>
                                    <td class="title1 subhead"><strong>Account No</strong></td>
                                    @foreach ($foreignBanks as $fb)
                                        <td class="bgcolor" colspan="2">{{ $fb->account_no }}</td>
                                    @endforeach
                                </tr>
                                <tr>
                                    <td class="title1 subhead"><strong>Bank Code</strong></td>
                                    @foreach ($foreignBanks as $fb)
                                        <td class="bgcolor" colspan="2">{{ $fb->bank_code }}</td>
                                    @endforeach
                                </tr>
                                <tr>
                                    <td class="title1 subhead"><strong>Branch</strong></td>
                                    @foreach ($foreignBanks as $fb)
                                        <td class="bgcolor" colspan="2">{{ $fb->branch_name }}</td>
                                    @endforeach
                                </tr>
                                <tr>
                                    <td class="title1 subhead"><strong>Branch Code</strong></td>
                                    @foreach ($foreignBanks as $fb)
                                        <td class="bgcolor" colspan="2">{{ $fb->branch_name }}</td>
                                    @endforeach
                                </tr>
                                <tr>
                                    <td class="title1 subhead"><strong>SWIFT Code</strong></td>
                                    @foreach ($foreignBanks as $fb)
                                        <td class="bgcolor" colspan="2">{{ $fb->swift_code }}</td>
                                    @endforeach
                                </tr>
                                <tr>
                                    <td class="title1 subhead"><strong>Currency</strong></td>
                                    @foreach ($foreignBanks as $fb)
                                        <td class="bgcolor" colspan="2">{{ $fb->currency }}</td>
                                    @endforeach
                                </tr>
                            </table>
                        </div>
                    </div>
                @endif
            </div>
        </div>

        <!-- fifth Row -->
        <div class="grid-row">
            <div class="postcontainer">
                <div class="postcontent" style="background-color:orange; border-radius:15px">
                    <span style="color:red; font-weight:bold">Special:</span>
                    <p>Once the payment is made, Please send the scanned copy/photo of the deposited slip via email or
                        to WhatsApp number above.</p>
                    <p>For payments using fund transfer, You can send the screenshot of the receipt.</p>
                </div>
            </div>
        </div>

    </div>




    </div>

    @include('home.footer')

    <script>
        $(document).ready(function() {
            // Initially show the Job section and hide the Banner section
            $('#job-section').show();
            $('#banner-section').hide();
            $('#job-button').addClass('active-button');

            // When clicking the 'Jobs' button
            $('#job-button').click(function() {
                $('#job-section').show();
                $('#banner-section').hide();

                // Change button colors
                $('#job-button').addClass('active-button');
                $('#banner-button').removeClass('active-button');
            });

            // When clicking the 'Banners' button
            $('#banner-button').click(function() {
                $('#job-section').hide();
                $('#banner-section').show();

                // Change button colors
                $('#banner-button').addClass('active-button');
                $('#job-button').removeClass('active-button');
            });
            // Payment Methods
            $('#IPG').on('click', function() {
                $('#componentContainer-payment').load('{{ route('user.postvacancy.paymentmethod.ipg') }}');
            });

            $('#onlinefundtransfer').on('click', function() {
                $('#componentContainer-payment').load(
                    '{{ route('user.postvacancy.paymentmethod.onlinefundtransfer') }}');
            });

            $('#Overthecounter').on('click', function() {
                $('#componentContainer-payment').load(
                    '{{ route('user.postvacancy.paymentmethod.overthecounter') }}');
            });

            $('#QRCodeforjobads').on('click', function() {
                $('#componentContainer-payment').load(
                    '{{ route('user.postvacancy.paymentmethod.qrcodeforjobads') }}');
            });
        });
    </script>
    <script>
        $(document).ready(function() {
            // Payment type toggle
            $('#localPaymentBtn').click(function() {
                $('#localPaymentSection').show();
                $('#foreignPaymentSection').hide();
                $(this).addClass('active');
                $('#foreignPaymentBtn').removeClass('active');
            });

            $('#foreignPaymentBtn').click(function() {
                $('#localPaymentSection').hide();
                $('#foreignPaymentSection').show();
                $(this).addClass('active');
                $('#localPaymentBtn').removeClass('active');
            });

            // Make tables responsive
            function handleTableResponsive() {
                $('.payment-table').each(function() {
                    const table = $(this);
                    const container = table.parent();
                    if (container.width() < table.width()) {
                        container.addClass('scrollable');
                    } else {
                        container.removeClass('scrollable');
                    }
                });
            }

            // Initial check
            handleTableResponsive();
            // Update on window resize
            $(window).resize(handleTableResponsive);
        });
    </script>

    <script>
        $(document).ready(function() {
            // Payment type toggle
            $('#localPaymentBtnb').click(function() {
                $('#localPaymentSectionb').show();
                $('#foreignPaymentSectionb').hide();
                $(this).addClass('active');
                $('#foreignPaymentBtnb').removeClass('active');
            });

            $('#foreignPaymentBtnb').click(function() {
                $('#localPaymentSectionb').hide();
                $('#foreignPaymentSectionb').show();
                $(this).addClass('active');
                $('#localPaymentBtnb').removeClass('active');
            });

            // Make tables responsive
            function handleTableResponsive() {
                $('.payment-table').each(function() {
                    const table = $(this);
                    const container = table.parent();
                    if (container.width() < table.width()) {
                        container.addClass('scrollable');
                    } else {
                        container.removeClass('scrollable');
                    }
                });
            }

            // Initial check
            handleTableResponsive();
            // Update on window resize
            $(window).resize(handleTableResponsive);
        });
    </script>
</body>

</html>