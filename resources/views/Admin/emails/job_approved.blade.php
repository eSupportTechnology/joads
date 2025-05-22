<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Job Approved</title>
</head>
<body style="font-family: Arial, sans-serif; background-color: #f4f4f4; padding: 30px;">

    <table width="100%" cellpadding="0" cellspacing="0" style="max-width: 600px; margin: auto; background-color: #ffffff; padding: 20px; border-radius: 8px;">
        <tr>
            <td>
                <h2 style="color: #2d3748;">🎉 Congratulations, {{ $employer->company_name }}!</h2>

                <p style="font-size: 16px; color: #4a5568;">
                    Your job posting titled <strong>{{ $job->title }}</strong> has been <span style="color: green;"><strong>approved</strong></span> and is now live on our platform.
                </p>

                <p style="font-size: 16px; color: #4a5568;">
                    This is a great opportunity to connect with potential candidates. Make sure your company profile is up to date to attract the best talent!
                </p>

                {{-- Optional: Job link --}}
                {{-- <p style="margin-top: 20px;">
                    <a href="{{ url('/jobs/' . $job->id) }}" style="background-color: #4CAF50; color: white; padding: 10px 20px; text-decoration: none; border-radius: 5px;">View Job Posting</a>
                </p> --}}

                <hr style="margin: 30px 0;">

                <p style="font-size: 14px; color: #718096;">
                    Thank you for using our platform!<br>
                    - The {{ config('app.name') }} Team
                </p>
            </td>
        </tr>
    </table>

</body>
</html>
