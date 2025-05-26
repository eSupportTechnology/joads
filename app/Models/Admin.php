<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;

class Admin extends Authenticatable
{
    use HasFactory, Notifiable;

    protected $table = 'admins'; // Explicit table name

    // Mass-assignable attributes
    protected $fillable = [
        'name',
        'email',
        'password',
        'contact',
        'is_active',
        'role',
    ];

    // Attributes to hide from JSON serialization
    protected $hidden = [
        'password',
        'remember_token',
    ];

    // Attribute casting for specific data types
    protected $casts = [
        'is_active' => 'boolean',
    ];

    // Relationship with job postings
    public function jobPostings()
    {
        return $this->hasMany(JobPosting::class);
    }

    // Relationship with feedback
    public function feedback()
    {
        return $this->hasMany(Feedback::class);
    }
}
