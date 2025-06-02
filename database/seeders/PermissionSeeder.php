<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Carbon\Carbon;

class PermissionSeeder extends Seeder
{
    public function run(): void
    {
        $now = Carbon::now();

        $permissions = [
            ['id' => 1, 'name' => 'Admin List', 'route' => 'admin.list'],
            ['id' => 2, 'name' => 'Employer List', 'route' => 'employer.list'],
            ['id' => 3, 'name' => 'Edit Employer', 'route' => 'employer.listedit'],
            ['id' => 4, 'name' => 'User List', 'route' => 'user.list'],
            ['id' => 5, 'name' => 'Register Admin Employer', 'route' => 'register.adminemployer'],
            ['id' => 6, 'name' => 'Category Index', 'route' => 'admin.categories.index'],
            ['id' => 7, 'name' => 'Category Create', 'route' => 'admin.categories.create'],
            ['id' => 8, 'name' => 'Category Edit', 'route' => 'admin.categories.edit'],
            ['id' => 9, 'name' => 'Job Postings Index', 'route' => 'job_postings.index'],
            ['id' => 10, 'name' => 'Job Postings Show', 'route' => 'job_postings.show'],
            ['id' => 11, 'name' => 'Job Postings Create (Admin)', 'route' => 'admin.job_postings.create'],
            ['id' => 12, 'name' => 'Banners Index', 'route' => 'banners.index'],
            ['id' => 13, 'name' => 'Banners Create', 'route' => 'banners.create'],
            ['id' => 14, 'name' => 'Banners Edit', 'route' => 'banners.edit'],
            ['id' => 15, 'name' => 'Feedback Manage', 'route' => 'admin.feedback.manage'],
            ['id' => 16, 'name' => 'Countries Index', 'route' => 'countries.index'],
            ['id' => 17, 'name' => 'Countries Create', 'route' => 'countries.create'],
            ['id' => 18, 'name' => 'Countries Edit', 'route' => 'countries.edit'],
            ['id' => 19, 'name' => 'Package Contact Create', 'route' => 'package-contacts.create'],
            ['id' => 20, 'name' => 'Packages Index', 'route' => 'admin.packages.index'],
            ['id' => 21, 'name' => 'Packages Create', 'route' => 'admin.packages.create'],
            ['id' => 22, 'name' => 'Packages Edit', 'route' => 'admin.packages.edit'],
            ['id' => 23, 'name' => 'Banner Details Create', 'route' => 'bannerdetails.create'],
            ['id' => 24, 'name' => 'Banner Packages Index', 'route' => 'banner_packages.index'],
            ['id' => 25, 'name' => 'Banner Packages Create', 'route' => 'banner_packages.create'],
            ['id' => 26, 'name' => 'Banner Packages Edit', 'route' => 'banner_packages.edit'],
            ['id' => 27, 'name' => 'Durations Index', 'route' => 'durations.index'],
            ['id' => 28, 'name' => 'Durations Edit', 'route' => 'durations.edit'],
            ['id' => 29, 'name' => 'Press Releases Index', 'route' => 'press-releases.index'],
            ['id' => 30, 'name' => 'Press Releases Create', 'route' => 'press-releases.create'],
            ['id' => 31, 'name' => 'Press Releases Edit', 'route' => 'press-releases.edit'],
            ['id' => 32, 'name' => 'Bank Accounts Index', 'route' => 'admin.bank-accounts.index'],
            ['id' => 33, 'name' => 'Bank Accounts Create', 'route' => 'admin.bank-accounts.create'],
            ['id' => 34, 'name' => 'Bank Accounts Edit', 'route' => 'admin.bank-accounts.edit'],
            ['id' => 35, 'name' => 'Contacts Index', 'route' => 'contacts.index'],
            ['id' => 36, 'name' => 'Contacts Create', 'route' => 'contacts.create'],
            ['id' => 37, 'name' => 'Contacts Edit', 'route' => 'contactslist.edit'],
            ['id' => 38, 'name' => 'Reports Job Ads', 'route' => 'reports.job-ads'],
            ['id' => 39, 'name' => 'Employer Stats', 'route' => 'admin.employer.stats'],
            ['id' => 40, 'name' => 'Reports Customers', 'route' => 'reports.customers'],
            ['id' => 41, 'name' => 'Contact Us Edit', 'route' => 'contactus.edit'],
            ['id' => 42, 'name' => 'About Us Index', 'route' => 'admin.about-us.index'],
            ['id' => 43, 'name' => 'About Us Create', 'route' => 'admin.about-us.create'],
            ['id' => 44, 'name' => 'About Us Edit', 'route' => 'admin.about-us.edit'],
            ['id' => 45, 'name' => 'Terms Index', 'route' => 'admin.terms.index'],
            ['id' => 46, 'name' => 'Terms Create', 'route' => 'admin.terms.create'],
            ['id' => 47, 'name' => 'Terms Edit', 'route' => 'admin.terms.edit'],
            ['id' => 48, 'name' => 'Policy Index', 'route' => 'admin.policy.index'],
            ['id' => 49, 'name' => 'Policy Create', 'route' => 'admin.policy.create'],
            ['id' => 50, 'name' => 'Policy Edit', 'route' => 'admin.policy.edit'],
            ['id' => 51, 'name' => 'FAQs Index', 'route' => 'faqs.index'],
            ['id' => 52, 'name' => 'FAQs Create', 'route' => 'faqs.create'],
            ['id' => 53, 'name' => 'FAQs Show', 'route' => 'faqs.show'],
            ['id' => 54, 'name' => 'FAQs Edit', 'route' => 'faqs.edit'],
            ['id' => 55, 'name' => 'Vission Mission Index', 'route' => 'vissionmission.index'],
            ['id' => 56, 'name' => 'Vission Mission Create', 'route' => 'vissionmission.create'],
            ['id' => 57, 'name' => 'Vission Mission Show', 'route' => 'vissionmission.show'],
            ['id' => 58, 'name' => 'Vission Mission Edit', 'route' => 'vissionmission.edit'],
            ['id' => 59, 'name' => 'Email Templete List', 'route' => 'admin.mail-templates.index'],
            ['id' => 60, 'name' => 'Email Templete Create', 'route' => 'admin.mail-templates.create'],
            ['id' => 61, 'name' => 'Email Templete Edit', 'route' => 'admin.mail-templates.edit'],
            ['id' => 62, 'name' => 'Service List', 'route' => 'admin.services.index'],
            ['id' => 63, 'name' => 'Service Create', 'route' => 'admin.services.create'],
            ['id' => 64, 'name' => 'Servece Edit', 'route' => 'admin.services.edit'],
            ['id' => 65, 'name' => 'Service Gallery index', 'route' => 'admin.service-gallery.index'],
            ['id' => 66, 'name' => 'Service Gallery Create', 'route' => 'admin.service-gallery.create'],
            ['id' => 67, 'name' => 'Service Gallery Edit', 'route' => 'admin.service-gallery.edit'],
        ];

        // Add timestamps to each permission
        foreach ($permissions as &$permission) {
            $permission['created_at'] = $now;
            $permission['updated_at'] = $now;
        }

        // Insert all permissions
        DB::table('permissions')->insert($permissions);
    }
}
