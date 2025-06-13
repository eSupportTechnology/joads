<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class PostHistory extends Model
{
    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = [
        'post_id',
        'daily_count',
    ];

    /**
     * Define the relationship to the `JobPosting` model.
     */
    public function jobPosting()
    {
        return $this->belongsTo(JobPosting::class, 'post_id');
    }
}
