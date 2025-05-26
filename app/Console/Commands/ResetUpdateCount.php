<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use Illuminate\Support\Facades\DB;

class ResetUpdateCount extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'reset:update-count';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Resets the update_count column in the job_postings table daily';

    /**
     * Execute the console command.
     *
     * @return int
     */
    public function handle()
    {
        DB::table('job_postings')->update(['update_count' => 0]);

        $this->info('Update count reset successfully.');
        return 0;
    }
}

