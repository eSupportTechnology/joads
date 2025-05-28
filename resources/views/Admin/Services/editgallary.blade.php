@extends('layouts.admin.master')

@section('title', 'Edit Our Services Gallary')

@section('css')
@endsection

@section('style')
    <link rel="stylesheet" type="text/css" href="{{ asset('assets/css/vendors/animate.css') }}">
@endsection

@section('breadcrumb-title')
    <h3>Edit Our Services Gallary</h3>
@endsection

@section('breadcrumb-items')
    <li class="breadcrumb-item">Dashboard</li>
    <li class="breadcrumb-item active">Edit Our Services Gallary</li>
@endsection

@section('content')
    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card">
                    <div class="card-header">Edit Our Services Gallary</div>

                    <div class="card-body">
                        @if (session('success'))
                            <div class="alert alert-success">
                                {{ session('success') }}
                            </div>
                        @endif
                        <form method="POST" action="{{ route('admin.service-gallery.update', $serviceGallary->id) }}" enctype="multipart/form-data">
                            @csrf
                            @method('PUT')
                            {{-- Image --}}
                            {{-- Image --}}
                            <div class="form-group mb-3">
                                <label for="image" class="form-label">Image</label>
                                <input type="file" name="image" id="image"
                                    class="form-control @error('image') is-invalid @enderror">
                                @error('image')
                                    <div class="invalid-feedback">{{ $message }}</div>
                                @enderror

                                @if (!empty($serviceGallary->image))
                                    <div class="mt-2">
                                        <img src="{{ asset('storage/' . $serviceGallary->image) }}" alt="Image"
                                            style="max-width: 150px;">
                                    </div>
                                @endif
                            </div>

                            {{-- Video --}}
                            <div class="form-group mb-3">
                                <label for="video" class="form-label">Video</label>
                                <input type="file" name="video" id="video"
                                    class="form-control @error('video') is-invalid @enderror">
                                @error('video')
                                    <div class="invalid-feedback">{{ $message }}</div>
                                @enderror

                                @if (!empty($serviceGallary->video))
                                    <div class="mt-2">
                                        <video width="320" height="240" controls>
                                            <source src="{{ asset('storage/' . $serviceGallary->video) }}" type="video/mp4">
                                            Your browser does not support the video tag.
                                        </video>
                                    </div>
                                @endif
                            </div>


                            {{-- Submit --}}
                            <div class="form-group">
                                <button type="submit" class="btn btn-primary">Update</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection

@section('script')
    <script src="{{ asset('assets/js/clock.js') }}"></script>
    <script src="{{ asset('assets/js/chart/apex-chart/moment.min.js') }}"></script>
    <script src="{{ asset('assets/js/notify/bootstrap-notify.min.js') }}"></script>
    <script src="{{ asset('assets/js/dashboard/default.js') }}"></script>
    <script src="{{ asset('assets/js/notify/index.js') }}"></script>
    <script src="{{ asset('assets/js/typeahead/handlebars.js') }}"></script>
    <script src="{{ asset('assets/js/typeahead/typeahead.bundle.js') }}"></script>
    <script src="{{ asset('assets/js/typeahead/typeahead.custom.js') }}"></script>
    <script src="{{ asset('assets/js/typeahead-search/handlebars.js') }}"></script>
    <script src="{{ asset('assets/js/typeahead-search/typeahead-custom.js') }}"></script>
    <script src="{{ asset('assets/js/height-equal.js') }}"></script>
    <script src="{{ asset('assets/js/animation/wow/wow.min.js') }}"></script>

    <script>
        document.getElementById('add-feature').addEventListener('click', function() {
            const wrapper = document.getElementById('features-wrapper');
            const count = wrapper.querySelectorAll('.input-group').length + 1;
            const div = document.createElement('div');
            div.className = 'input-group mb-2';
            div.innerHTML = `
            <textarea name="features[]" class="form-control" placeholder="Feature ${count}" required></textarea>
            <button type="button" class="btn btn-danger remove-feature">×</button>
        `;
            wrapper.appendChild(div);
        });

        document.addEventListener('click', function(e) {
            if (e.target.classList.contains('remove-feature')) {
                e.target.closest('.input-group').remove();
            }
        });
    </script>

@endsection
