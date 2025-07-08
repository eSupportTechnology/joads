<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class JobAcademicEducation extends Model
{
    protected $table = 'job_academic_educations';

    protected $fillable = [
        'job_seeker_id',
        'institution_name',
        'degree',
        'field_of_study',
        'start_date',
        'end_date',
    ];

    public function jobSeeker()
    {
        return $this->belongsTo(User::class, 'job_seeker_id');
    }
}
