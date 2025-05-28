@extends('layouts.admin.master')

@section('title', 'Create Our Services')

@section('css')
@endsection

@section('style')
    <link rel="stylesheet" type="text/css" href="{{ asset('assets/css/vendors/animate.css') }}">
@endsection

@section('breadcrumb-title')
    <h3>Create Our Services</h3>
@endsection

@section('breadcrumb-items')
    <li class="breadcrumb-item">Dashboard</li>
    <li class="breadcrumb-item active">Create Our Services</li>
@endsection

@section('content')
    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card">
                    <div class="card-header">Create Our Services</div>

                    <div class="card-body">
                        @if (session('success'))
                            <div class="alert alert-success">
                                {{ session('success') }}
                            </div>
                        @endif
                        <form method="POST" action="{{ route('admin.services.store') }}">
                            @csrf
                            {{-- Title --}}
        <div class="form-group mb-3">
            <label for="title" class="form-label">Title</label>
            <input type="text" id="title" name="title"
                class="form-control @error('title') is-invalid @enderror" value="{{ old('title') }}" required>
            @error('title')
                <div class="invalid-feedback">{{ $message }}</div>
            @enderror
        </div>

        {{-- Features --}}
        <div class="form-group mb-3">
            <label class="form-label">Features</label>
            <div id="features-list">
                <div class="input-group mb-2">
                    <input type="text" name="features[]" class="form-control @error('features.*') is-invalid @enderror"
                        placeholder="Enter a feature" required>
                    <button type="button" class="btn btn-danger remove-feature">×</button>
                </div>
            </div>
            <button type="button" id="add-feature" class="btn btn-sm btn-secondary">Add Feature</button>
            @error('features.*')
                <div class="invalid-feedback d-block">{{ $message }}</div>
            @enderror
        </div>
                            {{-- Submit --}}
        <div class="form-group">
            <button type="submit" class="btn btn-primary">Save Service</button>
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
    document.getElementById('add-feature').addEventListener('click', function () {
        const container = document.getElementById('features-list');
        const inputGroup = document.createElement('div');
        inputGroup.className = 'input-group mb-2';
        inputGroup.innerHTML = `
            <input type="text" name="features[]" class="form-control" placeholder="Enter a feature" required>
            <button type="button" class="btn btn-danger remove-feature">×</button>
        `;
        container.appendChild(inputGroup);
    });

    document.addEventListener('click', function (e) {
        if (e.target && e.target.classList.contains('remove-feature')) {
            e.target.closest('.input-group').remove();
        }
    });
</script>
@endsection
