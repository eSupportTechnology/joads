<?php

namespace App\Console;

use Illuminate\Console\Scheduling\Schedule;
use Illuminate\Foundation\Console\Kernel as ConsoleKernel;

class Kernel extends ConsoleKernel
{
    /**
     * Register the commands for the application.
     *
     * @return void
     */
    protected function commands()
    {
        $this->load(__DIR__.'/Commands');

        require base_path('routes/console.php');
    }

    /**
     * Define the application's command schedule.
     *
     * @param  \Illuminate\Console\Scheduling\Schedule  $schedule
     * @return void
     */
        protected function schedule(Schedule $schedule)
        {
            $schedule->command('app:run-daily-tasks')->dailyAt('00:00');
        }


    /**
     * The commands to be registered.
     *
     * @var array
     */
    protected $commands = [
        Commands\RunDailyTasks::class,
        Commands\ResetUpdateCount::class,
        Commands\PostHistoryUpdate::class,   
        \App\Console\Commands\FetchConversionRate::class,
    ];
}
