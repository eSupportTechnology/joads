<?php

namespace App\Http\Controllers;

use App\Models\Country;
use Illuminate\Http\Request;

class CountryController extends Controller
{

    public function index()
    {
        $countries = Country::select('countries.id', 'countries.name')
            ->leftJoin('job_postings', 'countries.id', '=', 'job_postings.country_id')
            ->selectRaw('SUM(job_postings.view_count) as total_view_count')
            ->selectRaw('SUM(job_postings.update_count) as total_update_count')
            ->groupBy('countries.id', 'countries.name')
            ->get();

        return view('Admin.country.index', compact('countries'));
    }


    public function create()
    {
        return view('Admin.country.Create');
    }

    public function store(Request $request)
    {
        $validated = $request->validate([
            'name' => 'required|string|max:255|unique:countries',
        ]);

        Country::create($validated);

        return redirect()
            ->route('countries.index')
            ->with('success', 'Country created successfully');
    }

    public function edit(Country $country)
    {
        return view('Admin.country.edit', compact('country'));
    }

    public function update(Request $request, Country $country)
    {
        $validated = $request->validate([
            'name' => 'required|string|max:255|unique:countries,name,' . $country->id,
        ]);

        $country->update($validated);

        return redirect()
            ->route('countries.index')
            ->with('success', 'Country updated successfully');
    }

    public function destroy(Country $country)
    {
        $country->delete();

        return redirect()
            ->route('countries.index')
            ->with('success', 'Country deleted successfully');
    }
}
