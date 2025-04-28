@extends('layouts.admin.master')

@section('title', 'Create Press Releases')

@section('css')
@endsection

@section('style')
    <link rel="stylesheet" type="text/css" href="{{ asset('assets/css/vendors/animate.css') }}">
@endsection

@section('breadcrumb-title')
    <h3>Create Press Releases</h3>
@endsection

@section('breadcrumb-items')
    <li class="breadcrumb-item">Dashboard</li>
    <li class="breadcrumb-item active">Create Press Releases</li>
@endsection

@section('content')
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-header">
                        <h5>Create Press Releases</h5>
                    </div>
                    <div class="card-body">
                        @if (session('success'))
                            <div class="alert alert-success">
                                {{ session('success') }}
                            </div>
                        @endif

                        <form action="{{ route('press-releases.store-multiple') }}" method="POST" enctype="multipart/form-data" id="pressReleasesForm">
                            @csrf
                            <div id="press-releases-container">
                                <div class="press-release-item">
                                    <div class="form-group mb-3">
                                        <label for="title">Title</label>
                                        <input type="text" name="press_releases[0][title]" class="form-control" required>
                                    </div>
                                    <div class="form-group mb-3">
                                        <label for="description">Description</label>
                                        <textarea name="press_releases[0][description]" class="form-control" required></textarea>
                                    </div>
                                    <div class="form-group mb-3">
                                        <label for="image">Image</label>
                                        <input type="file" name="press_releases[0][image]" class="form-control" required>
                                    </div>
                                    <div class="form-group mb-3">
                                        <label for="link">Full Article Link (Optional)</label>
                                        <input type="url" name="press_releases[0][link]" class="form-control">
                                    </div>
                                </div>
                            </div>
                            <button type="button" id="addPressRelease" class="btn btn-success">Add Another Press Release</button>
                            <button type="submit" class="btn btn-primary ">Submit</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection

@section('script')
    <script>
        document.addEventListener("DOMContentLoaded", function() {
            let pressReleaseIndex = 1;

            document.getElementById('addPressRelease').addEventListener('click', function() {
                const container = document.getElementById('press-releases-container');
                const newPressRelease = `
                    <div class="press-release-item mt-3">
                        <div class="form-group mb-3">
                            <label for="title">Title</label>
                            <input type="text" name="press_releases[${pressReleaseIndex}][title]" class="form-control" required>
                        </div>
                        <div class="form-group mb-3">
                            <label for="description">Description</label>
                            <textarea name="press_releases[${pressReleaseIndex}][description]" class="form-control" required></textarea>
                        </div>
                        <div class="form-group mb-3">
                            <label for="image">Image</label>
                            <input type="file" name="press_releases[${pressReleaseIndex}][image]" class="form-control" required>
                        </div>
                        <div class="form-group mb-3">
                            <label for="link">Full Article Link (Optional)</label>
                            <input type="url" name="press_releases[${pressReleaseIndex}][link]" class="form-control">
                        </div>
                        <button type="button" class="btn btn-danger remove-press-release">Remove</button>
                    </div>`;
                container.insertAdjacentHTML('beforeend', newPressRelease);
                pressReleaseIndex++;
            });

            document.getElementById('press-releases-container').addEventListener('click', function(e) {
                if (e.target.classList.contains('remove-press-release')) {
                    e.target.closest('.press-release-item').remove();
                }
            });
        });
    </script>
@endsection
