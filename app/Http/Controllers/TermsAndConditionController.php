<?php

namespace App\Http\Controllers;

use App\Models\ContactUs;
use App\Models\TermsAndCondition;
use Illuminate\Http\Request;

class TermsAndConditionController extends Controller
{
    // Display the list of all terms and conditions
    public function index()
    {
        $terms = TermsAndCondition::all(); // Assuming only one record exists for terms and conditions

        return view('Admin.terms.index', compact('terms'));
    }

    public function indexhome()
    {
        $termsRecord = TermsAndCondition::first();

        $terms = [];

        if ($termsRecord && $termsRecord->content) {
            $content = $termsRecord->content;

            preg_match_all('/\d+\.\s(.*?)(?=\d+\.\s|$)/s', $content, $matches);

            if (!empty($matches[0])) {
                foreach ($matches[0] as $match) {
                    preg_match('/^(\d+)\.\s(.*)/s', $match, $conditionParts);
                    if (count($conditionParts) === 3) {
                        $terms[] = [
                            'number' => $conditionParts[1], 
                            'text' => trim($conditionParts[2]), 
                        ];
                    }
                }
            }
        }

        $contacts = ContactUs::all();

        return view('User.SideComponent.terms', compact('terms', 'contacts'));
    }    
    // Show the form for creating a new terms and condition
    public function create()
    {
        return view('Admin.terms.create');
    }

    // Store a newly created terms and condition
    public function store(Request $request)
    {
        $request->validate([
            'title' => 'required|string|max:255',
            'content' => 'required|string',
        ]);

        TermsAndCondition::create([
            'title' => $request->title,
            'content' => $request->content,
        ]);

        return redirect()->route('admin.terms.index')->with('success', 'Terms and Conditions added successfully');
    }

    // Show the form for editing the specified terms and condition
    public function edit(TermsAndCondition $termsAndCondition)
    {
        return view('Admin.terms.edit', compact('termsAndCondition'));
    }

    // Update the specified terms and condition
    public function update(Request $request, TermsAndCondition $termsAndCondition)
    {
        $request->validate([
            'title' => 'required|string|max:255',
            'content' => 'required|string',
        ]);

        $termsAndCondition->update([
            'title' => $request->title,
            'content' => $request->content,
        ]);

        return redirect()->route('admin.terms.index')->with('success', 'Terms and Conditions updated successfully');
    }

    // Remove the specified terms and condition
    public function destroy(TermsAndCondition $termsAndCondition)
    {
        $termsAndCondition->delete();
        return redirect()->route('admin.terms.index')->with('success', 'Terms and Conditions deleted successfully');
    }
}