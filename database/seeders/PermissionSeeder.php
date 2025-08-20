<?php

namespace Database\Seeders;

use App\Models\Permission;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Carbon\Carbon;

class PermissionSeeder extends Seeder
{
    public function run(): void
    {
        $permissions = [
            // Admin Management
            ['id' => 1, 'name' => 'Admin List', 'route' => 'admin.list', 'category' => 'Admin Management'],

            // Employer Management
            ['id' => 2, 'name' => 'Employer List', 'route' => 'employer.list', 'category' => 'Employer Management'],
            ['id' => 3, 'name' => 'Edit Employer', 'route' => 'employer.listedit', 'category' => 'Employer Management'],
            ['id' => 4, 'name' => 'User List', 'route' => 'user.list', 'category' => 'Employer Management'],
            ['id' => 5, 'name' => 'Register Admin Employer', 'route' => 'register.adminemployer', 'category' => 'Employer Management'],

            // Category Management
            ['id' => 6, 'name' => 'Category Index', 'route' => 'admin.categories.index', 'category' => 'Category Management'],
            ['id' => 7, 'name' => 'Category Create', 'route' => 'admin.categories.create', 'category' => 'Category Management'],
            ['id' => 8, 'name' => 'Category Edit', 'route' => 'admin.categories.edit', 'category' => 'Category Management'],

            // Job Posting Management
            ['id' => 9, 'name' => 'Job Postings Index', 'route' => 'job_postings.index', 'category' => 'Job Postings'],
            ['id' => 10, 'name' => 'Job Postings Show', 'route' => 'job_postings.show', 'category' => 'Job Postings'],
            ['id' => 11, 'name' => 'Job Postings Create (Admin)', 'route' => 'admin.job_postings.create', 'category' => 'Job Postings'],

            // Banner Management
            ['id' => 12, 'name' => 'Banners Index', 'route' => 'banners.index', 'category' => 'Banner Management'],
            ['id' => 13, 'name' => 'Banners Create', 'route' => 'banners.create', 'category' => 'Banner Management'],
            ['id' => 14, 'name' => 'Banners Edit', 'route' => 'banners.edit', 'category' => 'Banner Management'],

            // Feedback Management
            ['id' => 15, 'name' => 'Feedback Manage', 'route' => 'admin.feedback.manage', 'category' => 'Feedback Management'],

            // Country Management
            ['id' => 16, 'name' => 'Countries Index', 'route' => 'countries.index', 'category' => 'Country Management'],
            ['id' => 17, 'name' => 'Countries Create', 'route' => 'countries.create', 'category' => 'Country Management'],
            ['id' => 18, 'name' => 'Countries Edit', 'route' => 'countries.edit', 'category' => 'Country Management'],

            // Package Management
            ['id' => 19, 'name' => 'Package Contact Create', 'route' => 'package-contacts.create', 'category' => 'Package Management'],
            ['id' => 20, 'name' => 'Packages Index', 'route' => 'admin.packages.index', 'category' => 'Package Management'],
            ['id' => 21, 'name' => 'Packages Create', 'route' => 'admin.packages.create', 'category' => 'Package Management'],
            ['id' => 22, 'name' => 'Packages Edit', 'route' => 'admin.packages.edit', 'category' => 'Package Management'],

            // Banner Package Management
            ['id' => 23, 'name' => 'Banner Details Create', 'route' => 'bannerdetails.create', 'category' => 'Banner Packages'],
            ['id' => 24, 'name' => 'Banner Packages Index', 'route' => 'banner_packages.index', 'category' => 'Banner Packages'],
            ['id' => 25, 'name' => 'Banner Packages Create', 'route' => 'banner_packages.create', 'category' => 'Banner Packages'],
            ['id' => 26, 'name' => 'Banner Packages Edit', 'route' => 'banner_packages.edit', 'category' => 'Banner Packages'],

            // Duration Management
            ['id' => 27, 'name' => 'Durations Index', 'route' => 'durations.index', 'category' => 'Duration Management'],
            ['id' => 28, 'name' => 'Durations Edit', 'route' => 'durations.edit', 'category' => 'Duration Management'],
            ['id' => 68, 'name' => 'Durations Create', 'route' => 'durations.create', 'category' => 'Duration Management'],

            // Press Release Management
            ['id' => 29, 'name' => 'Press Releases Index', 'route' => 'press-releases.index', 'category' => 'Press Releases'],
            ['id' => 30, 'name' => 'Press Releases Create', 'route' => 'press-releases.create', 'category' => 'Press Releases'],
            ['id' => 31, 'name' => 'Press Releases Edit', 'route' => 'press-releases.edit', 'category' => 'Press Releases'],

            // Bank Account Management
            ['id' => 32, 'name' => 'Bank Accounts Index', 'route' => 'admin.bank-accounts.index', 'category' => 'Bank Accounts'],
            ['id' => 33, 'name' => 'Bank Accounts Create', 'route' => 'admin.bank-accounts.create', 'category' => 'Bank Accounts'],
            ['id' => 34, 'name' => 'Bank Accounts Edit', 'route' => 'admin.bank-accounts.edit', 'category' => 'Bank Accounts'],

            // Contacts
            ['id' => 35, 'name' => 'Contacts Index', 'route' => 'contacts.index', 'category' => 'Contacts'],
            ['id' => 36, 'name' => 'Contacts Create', 'route' => 'contacts.create', 'category' => 'Contacts'],
            ['id' => 37, 'name' => 'Contacts Edit', 'route' => 'contactslist.edit', 'category' => 'Contacts'],

            // Reports
            ['id' => 38, 'name' => 'Reports Job Ads', 'route' => 'reports.job-ads', 'category' => 'Reports'],
            ['id' => 39, 'name' => 'Employer Stats', 'route' => 'admin.employer.stats', 'category' => 'Reports'],
            ['id' => 40, 'name' => 'Reports Customers', 'route' => 'reports.customers', 'category' => 'Reports'],

            // Settings
            ['id' => 41, 'name' => 'Contact Us Edit', 'route' => 'contactus.edit', 'category' => 'Settings'],
            ['id' => 42, 'name' => 'About Us Index', 'route' => 'admin.about-us.index', 'category' => 'Settings'],
            ['id' => 43, 'name' => 'About Us Create', 'route' => 'admin.about-us.create', 'category' => 'Settings'],
            ['id' => 44, 'name' => 'About Us Edit', 'route' => 'admin.about-us.edit', 'category' => 'Settings'],
            ['id' => 45, 'name' => 'Terms Index', 'route' => 'admin.terms.index', 'category' => 'Settings'],
            ['id' => 46, 'name' => 'Terms Create', 'route' => 'admin.terms.create', 'category' => 'Settings'],
            ['id' => 47, 'name' => 'Terms Edit', 'route' => 'admin.terms.edit', 'category' => 'Settings'],
            ['id' => 48, 'name' => 'Policy Index', 'route' => 'admin.policy.index', 'category' => 'Settings'],
            ['id' => 49, 'name' => 'Policy Create', 'route' => 'admin.policy.create', 'category' => 'Settings'],
            ['id' => 50, 'name' => 'Policy Edit', 'route' => 'admin.policy.edit', 'category' => 'Settings'],
            ['id' => 51, 'name' => 'FAQs Index', 'route' => 'faqs.index', 'category' => 'Settings'],
            ['id' => 52, 'name' => 'FAQs Create', 'route' => 'faqs.create', 'category' => 'Settings'],
            ['id' => 53, 'name' => 'FAQs Show', 'route' => 'faqs.show', 'category' => 'Settings'],
            ['id' => 54, 'name' => 'FAQs Edit', 'route' => 'faqs.edit', 'category' => 'Settings'],
            ['id' => 55, 'name' => 'Vission Mission Index', 'route' => 'vissionmission.index', 'category' => 'Settings'],
            ['id' => 56, 'name' => 'Vission Mission Create', 'route' => 'vissionmission.create', 'category' => 'Settings'],
            ['id' => 57, 'name' => 'Vission Mission Show', 'route' => 'vissionmission.show', 'category' => 'Settings'],
            ['id' => 58, 'name' => 'Vission Mission Edit', 'route' => 'vissionmission.edit', 'category' => 'Settings'],

            // Mail Management
            ['id' => 59, 'name' => 'Email Template List', 'route' => 'admin.mail-templates.index', 'category' => 'Mail Management'],
            ['id' => 60, 'name' => 'Email Template Create', 'route' => 'admin.mail-templates.create', 'category' => 'Mail Management'],
            ['id' => 61, 'name' => 'Email Template Edit', 'route' => 'admin.mail-templates.edit', 'category' => 'Mail Management'],

            // Services
            ['id' => 62, 'name' => 'Service List', 'route' => 'admin.services.index', 'category' => 'Services'],
            ['id' => 63, 'name' => 'Service Create', 'route' => 'admin.services.create', 'category' => 'Services'],
            ['id' => 64, 'name' => 'Service Edit', 'route' => 'admin.services.edit', 'category' => 'Services'],

            // Service Gallery
            ['id' => 65, 'name' => 'Service Gallery Index', 'route' => 'admin.service-gallery.index', 'category' => 'Service Gallery'],
            ['id' => 66, 'name' => 'Service Gallery Create', 'route' => 'admin.service-gallery.create', 'category' => 'Service Gallery'],
            ['id' => 67, 'name' => 'Service Gallery Edit', 'route' => 'admin.service-gallery.edit', 'category' => 'Service Gallery'],

            // Duration Management
            ['id' => 68, 'name' => 'Durations Create', 'route' => 'durations.create', 'category' => 'Duration Management'],
            ['id' => 69, 'name' => 'Durations Index', 'route' => 'durations.index', 'category' => 'Duration Management'],
            ['id' => 70, 'name' => 'Durations Edit', 'route' => 'durations.edit', 'category' => 'Duration Management'],
        ];


        foreach ($permissions as $permission) {
            Permission::updateOrCreate(
                ['route' => $permission['route']],
                [
                    'name' => $permission['name'],
                    'route' => $permission['route'],
                    'category' => $permission['category'],
                ]
            );
        }

        $this->command->info('Permissions seeded successfully!');
    }
}
