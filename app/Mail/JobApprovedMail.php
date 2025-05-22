<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;

class JobApprovedMail extends Mailable
{
    use Queueable, SerializesModels;

    public $job;
    public $employer;

    public function __construct($job)
    {
        $this->job = $job;
        $this->employer = \App\Models\Employer::find($job->employer_id);
    }

    public function build()
    {
        return $this->subject('🎉 Your Job Posting Has Been Approved!')
            ->view('Admin.emails.job_approved');
    }
}
