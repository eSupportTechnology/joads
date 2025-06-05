<?php

namespace App\Http\Controllers;

use App\Models\EmailTemplate;
use Illuminate\Http\Request;

class AdminEmailTemplateController extends Controller
{
    public function index()
    {
        $templates = EmailTemplate::all();
        return view('Admin.emails.index', compact('templates'));
    }

    public function create()
    {
        return view('Admin.emails.create');
    }

    public function store(Request $request)
    {
        $request->validate([
            'key' => 'required|unique:email_templates',
            'subject' => 'required',
            'body' => 'required',
        ]);

        EmailTemplate::create($request->only(['key', 'subject', 'body']));

        return redirect()->route('admin.mail-templates.index')->with('success', 'Email template created.');
    }

    public function edit(EmailTemplate $emailTemplate)
    {
        return view('Admin.emails.edit', compact('emailTemplate'));
    }

    public function update(Request $request, EmailTemplate $emailTemplate)
    {
        dd($request);
        $request->validate([
            'subject' => 'required',
            'body' => 'required',
        ]);

        $emailTemplate->update($request->only(['subject', 'body']));

        return redirect()->route('admin.mail-templates.index')->with('success', 'Email template updated.');
    }
    public function destroy(EmailTemplate $emailTemplate)
    {
        $emailTemplate->delete();
        return redirect()->route('admin.mail-templates.index')->with('success', 'Email template deleted.');
    }
}
