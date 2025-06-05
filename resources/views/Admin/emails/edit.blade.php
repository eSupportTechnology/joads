@extends('layouts.admin.master')

@section('title', 'Edit Email Template')

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- Quill.js CSS -->
<link href="https://cdn.quilljs.com/1.3.6/quill.snow.css" rel="stylesheet">

<style>
    .ql-editor {
        min-height: 200px;
    }
</style>
@section('breadcrumb-title')
    <h3>Edit Email Template</h3>
@endsection

@section('breadcrumb-items')
    <li class="breadcrumb-item">Dashboard</li>
    <li class="breadcrumb-item">Email Template</li>
    <li class="breadcrumb-item active">Edit Email Template</li>
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

                        <h2>Edit Email Template</h2>

                        <form method="POST" action="{{ route('admin.mail-templates.update', $emailTemplate->id) }}">
                            @csrf
                            @method('PUT')

                            <div class="mb-3">
                                <label for="key" class="form-label">Template Key</label>
                                <input type="text" name="key" class="form-control"
                                    value="{{ old('key', $emailTemplate->key) }}" readonly>
                            </div>

                            <div class="mb-3">
                                <label for="subject" class="form-label">Subject</label>
                                <input type="text" name="subject" class="form-control"
                                    value="{{ old('subject', $emailTemplate->subject) }}">
                            </div>

                            <div class="mb-3">
                                <label for="body" class="form-label">Body</label>
                                <div id="editor">{!! old('body', $emailTemplate->body ?? '') !!}</div>
                                <input type="hidden" id="body-input" name="body"
                                    value="{{ old('body', $emailTemplate->body ?? '') }}">

                            </div>


                            <button type="submit" class="btn btn-success">Update</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    {{-- Quill JS --}}
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>

    <!-- Bootstrap 5 JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

    <!-- Quill.js -->
    <script src="https://cdn.quilljs.com/1.3.6/quill.min.js"></script>
    <script>
        document.addEventListener("DOMContentLoaded", function() {
            const quill = new Quill('#editor', {
                theme: 'snow',
                modules: {
                    toolbar: [ /* toolbar options */ ]
                }
            });

            // Set initial content from the hidden input
            const initialValue = document.getElementById('body-input').value;
            quill.root.innerHTML = initialValue;

            // On form submit, set the hidden input value
            document.querySelector('form').addEventListener('submit', function() {
                const content = quill.root.innerHTML.trim();
                document.getElementById('body-input').value = content;
            });
        });
    </script>

@endsection
