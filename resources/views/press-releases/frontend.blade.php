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

        <!-- Alpine.js for modal functionality -->
        <script defer src="https://cdn.jsdelivr.net/npm/alpinejs@3.x.x/dist/cdn.min.js"></script>
        <style>
            [x-cloak] {
                display: none !important;
            }
        </style>

        <div x-data="{ open: false, videoUrl: '' }" class="press-releases-grid">

            @foreach ($pressReleases as $pressRelease)
                <div class="press-card border p-4 rounded shadow mb-6 bg-white">
                    <div class="press-image mb-4">
                        <img src="{{ asset('storage/' . ($pressRelease->image ?? 'images/default-placeholder.png')) }}"
                            alt="{{ $pressRelease->title }}" class="w-full h-48 object-cover rounded">
                    </div>

                    <div class="press-content">
                        <h3 class="text-lg font-semibold mb-2">{{ $pressRelease->title }}</h3>
                        <p class="mb-4">{{ Str::limit($pressRelease->description, 150) }}</p>
                        <div class="press-footer flex gap-4">
                            @if ($pressRelease->link)
                                <a href="{{ $pressRelease->link }}" target="_blank"
                                    class="bg-blue-600 text-white px-4 py-2 rounded hover:bg-blue-700 transition">
                                    Read Full Article
                                </a>
                            @endif

                            @if ($pressRelease->video)
                                <button
                                    @click="videoUrl = '{{ asset('storage/' . $pressRelease->video) }}'; open = true"
                                    class="bg-green-600 text-white px-4 py-2 rounded hover:bg-green-700 transition">
                                    Watch the Video
                                </button>
                            @endif
                        </div>
                    </div>
                </div>
            @endforeach

            <!-- Modal Popup -->
            <div x-show="open" x-cloak
                class="fixed inset-0 z-50 flex items-center justify-center bg-black bg-opacity-75">
                <div class="bg-white p-4 rounded-lg max-w-3xl w-full relative">
                    <button @click="open = false"
                        class="absolute top-2 right-3 text-gray-700 text-2xl hover:text-red-600 font-bold">
                        &times;
                    </button>
                    <video :src="videoUrl" controls autoplay class="w-full rounded-md"></video>
                </div>
            </div>
        </div>





        </main><br /><br /><br /><br />



        <script defer src="https://cdn.jsdelivr.net/npm/alpinejs@3.x.x/dist/cdn.min.js"></script>


</body>

<style>
    [x-cloak] {
        display: none !important;
    }

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
        height: 18rem;
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
    /* Button Styles */
.bg-blue-600 {
    background: linear-gradient(135deg, #2563eb, #1d4ed8);
    color: white;
    padding: 12px 20px;
    border: none;
    border-radius: 6px;
    text-decoration: none;
    font-size: 14px;
    font-weight: 500;
    cursor: pointer;
    transition: all 0.3s ease;
    display: inline-block;
    box-shadow: 0 2px 4px rgba(37, 99, 235, 0.2);
    min-width: 140px;
    text-align: center;
}

.bg-blue-600:hover {
    background: linear-gradient(135deg, #1d4ed8, #1e40af);
    transform: translateY(-1px);
    box-shadow: 0 4px 8px rgba(37, 99, 235, 0.3);
    text-decoration: none;
    color: white;
}

.bg-blue-600:active {
    transform: translateY(0);
    box-shadow: 0 2px 4px rgba(37, 99, 235, 0.2);
}

.bg-green-600 {
    background: linear-gradient(135deg, #16a34a, #15803d);
    color: white;
    padding: 12px 20px;
    border: none;
    border-radius: 6px;
    font-size: 14px;
    font-weight: 500;
    cursor: pointer;
    transition: all 0.3s ease;
    box-shadow: 0 2px 4px rgba(22, 163, 74, 0.2);
    min-width: 140px;
    text-align: center;
}

.bg-green-600:hover {
    background: linear-gradient(135deg, #15803d, #166534);
    transform: translateY(-1px);
    box-shadow: 0 4px 8px rgba(22, 163, 74, 0.3);
}

.bg-green-600:active {
    transform: translateY(0);
    box-shadow: 0 2px 4px rgba(22, 163, 74, 0.2);
}

/* Modal Overlay Styles */
.fixed.inset-0.z-50.flex.items-center.justify-center.bg-black.bg-opacity-75 {
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background: rgba(0, 0, 0, 0.85);
    display: flex;
    align-items: center;
    justify-content: center;
    z-index: 1000;
    backdrop-filter: blur(4px);
}

/* Modal Container Styles */
.bg-white.p-4.rounded-lg.max-w-3xl.w-full.relative {
    background: white;
    padding: 20px;
    border-radius: 12px;
    max-width: 48rem;
    width: 90%;
    position: relative;
    box-shadow: 0 20px 40px rgba(0, 0, 0, 0.3);
    animation: modalFadeIn 0.3s ease-out;
    max-height: 90vh;
    overflow: hidden;
}

@keyframes modalFadeIn {
    from {
        opacity: 0;
        transform: scale(0.95) translateY(-20px);
    }
    to {
        opacity: 1;
        transform: scale(1) translateY(0);
    }
}

/* Modal Close Button Styles */
.absolute.top-2.right-3.text-gray-700.text-2xl.hover\:text-red-600.font-bold {
    position: absolute;
    top: 15px;
    right: 20px;
    background: rgba(0, 0, 0, 0.7);
    color: white;
    border: none;
    border-radius: 50%;
    width: 35px;
    height: 35px;
    font-size: 18px;
    font-weight: bold;
    cursor: pointer;
    z-index: 1001;
    display: flex;
    align-items: center;
    justify-content: center;
    transition: all 0.3s ease;
    line-height: 1;
}

.absolute.top-2.right-3.text-gray-700.text-2xl.hover\:text-red-600.font-bold:hover {
    background: rgba(220, 53, 69, 0.9);
    transform: scale(1.05);
    color: white;
}

/* Modal Video Styles */
.w-full.rounded-md {
    width: 100%;
    border-radius: 8px;
    outline: none;
    max-height: 70vh;
}

/* Responsive Adjustments for Modal */
@media (max-width: 768px) {
    .bg-white.p-4.rounded-lg.max-w-3xl.w-full.relative {
        width: 95%;
        padding: 15px;
        margin: 20px;
    }

    .w-full.rounded-md {
        max-height: 60vh;
    }
}

    /* Responsive */
    @media (max-width: 1024px) {
        .press-card {
            width: 45%;
        }
    }


</style>

</html>
