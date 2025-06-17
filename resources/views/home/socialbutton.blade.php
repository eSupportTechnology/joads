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
    /* Extra Small Devices (xs: max-width 575px) */
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

    /* Small Devices (sm: 576px to 767px) */
    @media (min-width: 576px) and (max-width: 767px) {
        .whatsapp-icon {
            position: fixed;
            bottom: 120px;
            right: 50px;
            z-index: 1000;
        }
        .whatsapp-icon img {
            width: 45px;
            height: 45px;
        }
    }

    /* Medium Devices (md: 768px to 991px) */
    @media (min-width: 768px) and (max-width: 991px) {
        .whatsapp-icon {
            position: fixed;
            bottom: 100px;
            right: 40px;
            z-index: 1000;
        }
        .whatsapp-icon img {
            width: 50px;
            height: 50px;
        }
    }

    /* Large Devices (lg: 992px to 1199px) */
    @media (min-width: 992px) and (max-width: 1199px) {
        .whatsapp-icon {
            position: fixed;
            bottom: 80px;
            right: 30px;
            z-index: 1000;
        }
        .whatsapp-icon img {
            width: 55px;
            height: 55px;
        }
    }

    /* Extra Large Devices (xl: 1200px and up) */
    @media (min-width: 1200px) {
        .whatsapp-icon {
            position: fixed;
            bottom: 60px;
            right: 20px;
            z-index: 1000;
        }
        .whatsapp-icon img {
            width: 60px;
            height: 60px;
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
