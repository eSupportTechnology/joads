<!-- resources/views/top-employers.blade.php -->
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Top Employers</title>

    <link rel="stylesheet" href="{{ asset('css/topemployees.css') }}">
    
    <style>
        
        .contact-table th, .contact-table td {
    padding: 10px;
    border: 1px solid #ddd;
    word-wrap: break-word;
    width: auto;
    text-align: left;
}

    </style>
  
</head>

<body>
    @include('home.header')
    <div class="container">
        <h1 class="title">Top Employers</h1>
        <!-- <div class="filter-options">
            <label><input type="radio" name="filter" checked> All</label>
            <label><input type="radio" name="filter"> With Open Jobs</label>
            <label><input type="radio" name="filter"> By Industry</label>
            <label><input type="radio" name="filter"> Alphabetical</label>
        </div> -->
        <div class="employers-grid">

            @foreach ($topEmployers as $employer)
                <div class="employer-card">
                    <a style="text-decoration:none; color:black;" href="{{ route('top.employers.jobs', $employer->id) }}">
                        @if ($employer->logo==null)
                        <div>
                        {{ $employer->company_name }}
                        </div>
                        @else
                        <img src="{{ $employer->logo ? asset('storage/app/public/' . $employer->logo) : asset('images/default-logo.png') }}"
                        alt="{{ $employer['alt'] }}">
                        @endif
                        
                    </a>
                </div>
            @endforeach

        </div>
    </div>
</body>

</html>