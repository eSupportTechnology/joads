<?php

namespace App\Mail;

use App\Models\EmailTemplate;
use App\Models\Employer;
use Illuminate\Bus\Queueable;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;
use Illuminate\Support\Facades\Log;

class JobApprovedMail extends Mailable
{
    use Queueable, SerializesModels;

    public $job;
    public $employer;
    public $template;

    public function __construct($job, $template)
    {
        $this->job = $job;
        $this->template = $template;
        $this->employer = Employer::find($job->employer_id);
    }

    public function build()
    {
        $jobUrl = route('job.details', $this->job->id);

        $body = str_replace(
            ['{{ company_name }}', '{{ job_title }}', '{{ job_url }}'],
            [
                $this->employer?->company_name ?? 'Company',
                $this->job->title,
                $jobUrl
            ],
            $this->template->body
        );


        return $this->subject($this->template->subject)
            ->view('Admin.emails.job_approved')
            ->with([
                'body' => $body,
                'job_url' => $jobUrl
            ]);

    }
}
