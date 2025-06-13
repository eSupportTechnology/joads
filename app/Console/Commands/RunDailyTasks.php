<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Http;
use Carbon\Carbon;
use App\Models\Conversion;

class RunDailyTasks extends Command
{
    protected $signature = 'app:run-daily-tasks';

    protected $description = 'Run all daily tasks: post history update, reset counts, and fetch conversion rate';

    public function handle()
    {
        // 1. Post History Update
        $this->info('Running post-history-update...');
        $jobPostings = DB::table('job_postings')->select('id', 'update_count')->get();

        foreach ($jobPostings as $jobPosting) {
            DB::table('post_histories')->insert([
                'post_id' => $jobPosting->id,
                'daily_count' => $jobPosting->update_count,
                'created_at' => now(),
                'updated_at' => now(),
            ]);
        }
        $this->info('Post history update complete.');

        // 2. Reset Update Count
        $this->info('Resetting update counts...');
        DB::table('job_postings')->update([
            'update_count' => 0,
            'updated_at' => Carbon::now(),
        ]);
        $this->info('Update counts reset.');

        // 3. Fetch Conversion Rate
        $this->info('Fetching conversion rate...');
        $appId = config('services.openexchangerates.app_id');

        $response = Http::withOptions(['verify' => false])
            ->get("https://openexchangerates.org/api/latest.json", [
                'app_id' => $appId,
                'symbols' => 'LKR'
            ]);

        if (!$response->ok()) {
            $this->error('Failed to fetch exchange rate.');
            return 1;
        }

        $rate = $response['rates']['LKR'] ?? null;

        if (!$rate) {
            $this->error('Exchange rate for LKR not found.');
            return 1;
        }

        $usd = 1;
        $lkr = $usd * $rate;

        Conversion::updateOrCreate(
            ['usd_value' => $usd], // Unique constraint
            [
                'lkr_value' => $lkr,
                'exchange_rate' => $rate,
            ]
        );

        $this->info("Conversion updated/created: 1 USD = {$lkr} LKR at rate {$rate}");

        $this->info('All daily tasks completed successfully.');

        return 0;
    }
}
