<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>WhatsApp Icon</title>
    <style>
        .whatsapp-icon {
            position: fixed;
            bottom: 30px;
            right: 30px;
            z-index: 1000;
            opacity: 1; /* Make sure the icon is fully visible */
            transition: opacity 0.3s ease-in-out;
        }
        .whatsapp-icon img {
            width: 60px;
            height: 60px;
            border-radius: 50%;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            transition: transform 0.3s, box-shadow 0.3s;
        }
        .whatsapp-icon img:hover {
            transform: scale(1.1);
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.3);
        }
        @media (max-width: 575px) {
            .whatsapp-icon {
                
                position: fixed;
                bottom: 150px;
                right: 70px;
                z-index: 1000;
            }
            .whatsapp-icon img {
                width: 40px;
                height: 40px;
            }
        }
                @media (max-width: 375px) {
            .whatsapp-icon {
                position: fixed;
                bottom: 150px;
                right: 120px;
                z-index: 1000;
            }
            .whatsapp-icon img {
                width: 40px;
                height: 40px;
            }
        }
    </style>
</head>
<body>
    <!-- WhatsApp Icon -->
    <div class="whatsapp-icon">
        <a href="https://wa.me/94777580451" target="_blank" aria-label="Chat on WhatsApp">
            <img src="{{ asset('whatsapp.jpeg') }}" alt="WhatsApp Icon">
        </a>
    </div>
</body>
</html>
