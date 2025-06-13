<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use Illuminate\Support\Facades\Http;
use App\Models\Conversion;

class FetchConversionRate extends Command
{
    protected $signature = 'conversion:fetch-rate';
    protected $description = 'Fetch USD to LKR exchange rate and store conversion data';

    public function handle()
    {
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

        $conversion = Conversion::updateOrCreate(
            ['usd_value' => $usd], // Unique constraint
            [
                'lkr_value' => $lkr,
                'exchange_rate' => $rate,
            ]
        );

        $this->info("Conversion updated/created: 1 USD = {$lkr} LKR at rate {$rate}");


        return 0;
    }
}
