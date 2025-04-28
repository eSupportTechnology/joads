<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>HomePage</title>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    <link rel="stylesheet" href="{{ asset('css/home.css') }}">
    <link rel="stylesheet" href="{{ asset('css/footer.css') }}">
    <link rel="stylesheet" href="{{ asset('css/header.css') }}">
    <!-- Swiper CSS -->
    <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css">


</head>

<body>
    @include('home.header')

    
<div class="container">
        <h1 class="page-title">Press Releases</h1>

        <div class="press-releases-grid">
            @foreach ($pressReleases as $pressRelease)
                <div class="press-card">
                    <div class="press-image">
                        @if($pressRelease->image)
                            <img src="{{ asset('storage/app/public/' . $pressRelease->image) }}" alt="{{ $pressRelease->title }}">
                        @else
                            <img src="{{ asset('images/default-placeholder.png') }}" alt="Default Image">
                        @endif
                    </div>
                    <div class="press-content">
                        <h3>{{ $pressRelease->title }}</h3>
                        <p>{{ Str::limit($pressRelease->description, 150) }}</p>
                        <div class="press-footer">
                            @if($pressRelease->link)
                                <a href="{{ $pressRelease->link }}" target="_blank" class="btn read-more">Read Full Article</a>
                            @endif
                        </div>
                    </div>
                </div>
            @endforeach
        </div>



    </main><br /><br /><br /><br />





</body>

<style>
    body {
    font-family: Arial, sans-serif;
    background-color: #f8f9fa;
    margin: 0;
    padding: 0;
}

.container {
    max-width: 1200px;
    margin: auto;
    padding: 20px;
}

.page-title {
    text-align: center;
    font-size: 28px;
    font-weight: bold;
    margin-bottom: 20px;
}

.press-releases-grid {
    display: flex;
    flex-wrap: wrap;
    gap: 20px;
    justify-content: center;
}

.press-card {
    background: white;
    width: 30%;
    border-radius: 10px;
    overflow: hidden;
    box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
    transition: transform 0.3s ease-in-out;
}

.press-card:hover {
    transform: translateY(-5px);
}

.press-image img {
    width: 100%;
    height: auto;
    border-bottom: 4px solid #ff5722;
}

.press-content {
    padding: 15px;
}

.press-content h3 {
    font-size: 20px;
    margin-bottom: 10px;
    color: #333;
}

.press-content p {
    color: #555;
    font-size: 14px;
}

.press-footer {
    margin-top: 10px;
    text-align: center;
}

.btn.read-more {
    background-color: #28a745;
    color: white;
    text-decoration: none;
    padding: 10px 15px;
    border-radius: 5px;
    display: inline-block;
    transition: background 0.3s ease-in-out;
}

.btn.read-more:hover {
    background-color: #218838;
}

/* Responsive */
@media (max-width: 1024px) {
    .press-card {
        width: 45%;
    }
}

@media (max-width: 768px) {
    .press-card {
        width: 100%;
    }
}

</style>
</html>