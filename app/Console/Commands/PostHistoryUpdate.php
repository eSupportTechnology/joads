<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use Illuminate\Support\Facades\DB;

class PostHistoryUpdate extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'app:post-history-update';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Insert daily view counts from job postings into post histories';

    /**
     * Execute the console command.
     */
    public function handle()
    {
        $this->info('Inserting daily view counts into post histories...');

        // Fetch all job postings
        $jobPostings = DB::table('job_postings')->select('id', 'view_count')->get();

        foreach ($jobPostings as $jobPosting) {
            // Insert a new record for each job posting
            DB::table('post_histories')->insert([
                'post_id' => $jobPosting->id,
                'daily_count' => $jobPosting->view_count,
                'created_at' => now(),
                'updated_at' => now(),
            ]);
        }

        $this->info('Daily view counts inserted successfully!');
    }
}
