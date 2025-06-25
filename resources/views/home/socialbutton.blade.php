<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>WhatsApp Icon</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            overflow-x: hidden;
        }
        .whatsapp-icon {
            position: fixed;
            bottom: 20px;
            right: 20px;
            z-index: 9999;
            padding: 0;
            box-sizing: border-box;
        }

        /* Image styling */
        .whatsapp-icon img {
            width: 60px;
            height: 60px;
            border-radius: 50%;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            transition: transform 0.3s, box-shadow 0.3s;
        }

        /* Hover effect */
        .whatsapp-icon img:hover {
            transform: scale(1.1);
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.3);
        }

        /* Mobile Fix */
        @media (max-width: 576px) {
            .whatsapp-icon {
                bottom: 15px;
                right: 15px; /* <- Not too tight to the edge */
                margin-right: 20px;
            }

            .whatsapp-icon img {
                width: 50px;
                height: 50px;
            }
        }

    </style>
</head>
<body>
    <div class="whatsapp-icon">
        <a href="https://wa.me/94777580451" target="_blank" aria-label="Chat on WhatsApp">
            <img src="{{ asset('whatsapp.jpeg') }}" alt="WhatsApp Icon">
        </a>
    </div>
</body>
</html>
