@extends('layouts.admin.master')

@section('title', 'Create Email Template')

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Quill.js CSS -->
    <link href="https://cdn.quilljs.com/1.3.6/quill.snow.css" rel="stylesheet">

    <style>
        .ql-editor {
            min-height: 200px;
        }
    </style>

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
                                <div id="editor-one" style="height: 200px;"></div>
                                <input type="hidden" id="hidden-input-one" name="body">
                                {{-- <textarea name="body" class="form-control" rows="10">{{ old('body', $emailTemplate->body ?? '') }}</textarea> --}}
                            </div>


                            <button type="submit" class="btn btn-success">{{ isset($emailTemplate) ? 'Update' : 'Create' }}</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- jQuery (If Needed) -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>

    <!-- Bootstrap 5 JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

    <!-- Quill.js -->
    <script src="https://cdn.quilljs.com/1.3.6/quill.min.js"></script>

    <script>
        $(document).ready(function () {
    var toolbarOptions = [
        [{ 'font': [] }],
        [{ 'size': ['small', false, 'large', 'huge'] }],
        ['bold', 'italic', 'underline', 'strike'],
        [{ 'color': [] }, { 'background': [] }],
        [{ 'script': 'sub' }, { 'script': 'super' }],
        [{ 'header': [1, 2, 3, 4, 5, 6, false] }],
        [{ 'align': [] }],
        ['blockquote', 'code-block'],
        [{ 'list': 'ordered' }, { 'list': 'bullet' }],
        [{ 'indent': '-1' }, { 'indent': '+1' }],
        ['link', 'image', 'video'],
        ['clean']
    ];

    // Initialize only editor-one
    var quill = new Quill('#editor-one', {
        theme: 'snow',
        modules: { toolbar: toolbarOptions }
    });

    // Preload content if editing
    quill.root.innerHTML = @json(old('body', $emailTemplate->body ?? ''));

    // Save content on submit
    $('form').on('submit', function () {
        $('#hidden-input-one').val(quill.root.innerHTML.trim());
    });
});

    </script>
@endsection
