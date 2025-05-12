<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact Us</title>
    <style>
        .popup {
            position: fixed;
            top: 80px;
            left: 0;
            width: 100%;
            height: 100%;
            z-index: 1000;
            background-color: rgba(0, 0, 0, 0.5);
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 10px;
            box-sizing: border-box;
        }

        .wrapper {

            max-width: 800px;
            margin: auto;
            background: white;
            border-radius: 10px;
            padding: 20px;
            position: relative;
            max-height: 90vh;
            overflow-y: auto;
        }

        .popup-content {
            max-width: 800px;
            width: 100%;
            box-sizing: border-box;
        }

        .close {
            position: absolute;
            top: 10px;
            right: 15px;
            font-size: 28px;
            cursor: pointer;
            z-index: 1001;
        }

        .contact-logo {
            text-align: center;
            margin-bottom: 20px;
        }

        .unique-logo {
            max-width: 200px;
            height: auto;
        }

        .contact-table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }


        .contact-table th,
        .contact-table td {
            padding: 10px;
            border: 1px solid #ddd;
            word-wrap: break-word;
            width: auto;
        }

        .contact-table th,
        {
        padding-left: 20px;
        }

        .contact-table td {
            text-align: left;
            padding-left: 30px;

        }

        .contact-name {
            width: 40%;
        }

        .contact-phone {
            width: 60%;
        }

        @media (max-width: 600px) {
            .popup {}

            .wrapper {
                padding: 15px;

                margin: 10px;
                max-height: 85vh;
            }

            .popup-content {
                padding: 0;
            }

            .contact-table {
                font-size: 14px;
            }

            .contact-table th,
            .contact-table td {
                padding: 8px 5px;
            }

            h2 {
                font-size: 20px;
                margin-top: 40px !important;
            }

            .unique-logo {
                max-width: 150px;
            }
        }

        @media (max-width: 480px) {
            .popup-content {
                max-width: 400px;
                padding: 0px;
            }
        }

        @media (max-width: 400px) {
            .popup-content {
                max-width: 360px !important;
                padding: 0px;
            }
        }

        @media (max-width: 768px) {
            .popup-content {
                max-width: 400px;
                padding: 0px;
            }
        }
    </style>
</head>

<body>
    <div id="contactPopup" class="popup">
        <div class="wrapper">
            <div class="popup-content">
                <span class="close">&times;</span>
                <div class="contact-logo">
                    <a href="/">
                        <img src="{{ asset('Jobads.png') }}" alt="Logo" class="unique-logo">
                    </a>
                </div>
                <h2 style="color: green; ">
                    Contact Us for more details
                </h2>

                <table class="contact-table">
                    <tr>
                        <th rowspan="{{ count($contacts) + 2 }}" style="padding-left: 20px; background-color: #fad157;">
                            Call or WhatsApp
                        </th>
                    </tr>
                    @foreach ($contacts as $contact)
                        <tr style="background-color: #ffe599;">
                            <td class="contact-name">{{ $contact->name }}</td>
                            <td class="contact-phone">{{ $contact->phone }}</td>
                        </tr>
                    @endforeach
                    <tr>
                        <td colspan="2" style="background-color: #ffe599;">
                            <small style="color: #357ab7">
                                <strong>For International:</strong> Prefix the number with '+94' e.g., +94 777 580 451
                            </small>
                        </td>
                    </tr>
                    <tr style="background-color: #fad157;">
                        <th style="padding-left: 20px;background-color: #fad157;">Email</th>
                        <td class="email" colspan="2" style="color: red;">jobs@jobads.lk</td>
                    </tr>
                    <tr style="background-color: #fad157;">
                        <td></td>
                        <td colspan="2">
                            <small style="color: #357ab7; font-style: normal">
                                Working Hours Monday to Friday from 8.30am to 5.30pm
                            </small>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </div>

    <script>
        document.querySelector(".close").addEventListener("click", function() {
            document.getElementById("contactPopup").style.display = "none";
        });

        window.onclick = function(event) {
            if (event.target === document.getElementById("contactPopup")) {
                document.getElementById("contactPopup").style.display = "none";
            }
        };
    </script>
</body>

</html>