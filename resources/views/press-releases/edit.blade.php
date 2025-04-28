@extends('layouts.admin.master')

@section('title', 'Edit Press Release')

@section('css')
@endsection

@section('style')
    <link rel="stylesheet" type="text/css" href="{{ asset('assets/css/vendors/animate.css') }}">
    <style>
        .preview-img {
            max-width: 150px;
            margin-top: 10px;
            border-radius: 5px;
        }
    </style>
@endsection

@section('breadcrumb-title')
    <h3>Edit Press Release</h3>
@endsection

@section('breadcrumb-items')
    <li class="breadcrumb-item"><a href="{{ route('press-releases.index') }}">Press Releases</a></li>
    <li class="breadcrumb-item active">Edit Press Release</li>
@endsection

@section('content')
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-header">
                        <h5>Edit Press Release</h5>
                    </div>
                    <div class="card-body">
                        @if (session('success'))
                            <div class="alert alert-success">
                                {{ session('success') }}
                            </div>
                        @endif

                        <form action="{{ route('press-releases.update', $pressRelease->id) }}" method="POST" enctype="multipart/form-data">
                            @csrf
                            @method('PUT')

                            <div class="form-group mb-3">
                                <label for="title">Title</label>
                                <input type="text" name="title" class="form-control" value="{{ old('title', $pressRelease->title) }}" required>
                            </div>

                            <div class="form-group mb-3">
                                <label for="description">Description</label>
                                <textarea name="description" class="form-control" required>{{ old('description', $pressRelease->description) }}</textarea>
                            </div>

                            <div class="form-group mb-3">
                                <label for="image">Current Image</label><br>
                                @if($pressRelease->image)
                                    <img src="{{ asset('storage/app/public/' . $pressRelease->image) }}" class="preview-img" alt="Press Release Image">
                                @else
                                    <p>No Image Available</p>
                                @endif
                            </div>

                            <div class="form-group mb-3">
                                <label for="image">Upload New Image (Optional)</label>
                                <input type="file" name="image" class="form-control" accept="image/*" id="imageInput">
                                <img id="imagePreview" class="preview-img" style="display:none;">
                            </div>

                            <div class="form-group mb-3">
                                <label for="link">Full Article Link (Optional)</label>
                                <input type="url" name="link" class="form-control" value="{{ old('link', $pressRelease->link) }}">
                            </div>

                            <button type="submit" class="btn btn-primary">Update</button>
                            <a href="{{ route('press-releases.index') }}" class="btn btn-secondary">Cancel</a>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection

@section('script')
    <script>
        document.getElementById('imageInput').addEventListener('change', function(event) {
            const file = event.target.files[0];
            if (file) {
                const reader = new FileReader();
                reader.onload = function(e) {
                    const preview = document.getElementById('imagePreview');
                    preview.src = e.target.result;
                    preview.style.display = 'block';
                };
                reader.readAsDataURL(file);
            }
        });
    </script>
@endsection
