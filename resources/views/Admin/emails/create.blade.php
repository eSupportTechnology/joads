@extends('layouts.admin.master')

@section('title', 'Create Email Template')

@section('css')
@endsection

@section('style')
@endsection

@section('breadcrumb-title')
    <h3>Create Email Template</h3>
@endsection

@section('breadcrumb-items')
    <li class="breadcrumb-item">Dashboard</li>
    <li class="breadcrumb-item">Email Template</li>
    <li class="breadcrumb-item active">Create Email Template</li>
@endsection

@section('content')
    <div class="container-fluid">
        <div class="row">
            <div class="col-sm-12">
                <div class="card">
                    <div class="card-body">
                        @if (session('success'))
                            <div class="alert alert-success">
                                {{ session('success') }}
                            </div>
                        @endif

                        <h2>{{ isset($emailTemplate) ? 'Edit' : 'Create' }} Email Template</h2>

                        <form method="POST"
                            action="{{ isset($emailTemplate) ? route('admin.mail-templates.update', $emailTemplate->id) : route('admin.mail-templates.store') }}">
                            @csrf
                            @if (isset($emailTemplate))
                                @method('PUT')
                            @endif

                            <div class="mb-3">
                                <label for="key" class="form-label">Template Key</label>
                                <input type="text" name="key" class="form-control"
                                    value="{{ old('key', $emailTemplate->key ?? '') }}"
                                    {{ isset($emailTemplate) ? 'readonly' : '' }}>
                            </div>

                            <div class="mb-3">
                                <label for="subject" class="form-label">Subject</label>
                                <input type="text" name="subject" class="form-control"
                                    value="{{ old('subject', $emailTemplate->subject ?? '') }}">
                            </div>

                            <div class="mb-3">
                                <label for="body" class="form-label">Body</label>
                                <textarea name="body" class="form-control" rows="10">{{ old('body', $emailTemplate->body ?? '') }}</textarea>
                            </div>

                            <button type="submit"
                                class="btn btn-success">{{ isset($emailTemplate) ? 'Update' : 'Create' }}</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
