@extends('layouts.admin.master')

@section('title', 'Edit Vision & Mission')

@section('breadcrumb-title')
    <h3 class="">Edit Vision & Mission</h3>
@endsection

@section('breadcrumb-items')
    <li class="breadcrumb-item">Dashboard</li>
    <li class="breadcrumb-item active" aria-current="page">Edit Vision & Mission</li>
@endsection

@section('content')
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-10">
                <div class="card">
                    <div class="card-header">Edit Vision & Mission</div>
                    <div class="card-body">
                        <form action="{{ route('admin.vissionmission.update', $vissionMission->id) }}" method="POST">
                            @csrf
                            @method('PUT')
                            <div class="mb-3">
                                <label for="vission" class="form-label">Vision</label>
                                <input type="text" name="vission" class="form-control" value="{{ $vissionMission->vission }}" required>
                            </div>
                            <div class="mb-3">
                                <label for="mission" class="form-label">Mission</label>
                                <textarea name="mission" class="form-control" rows="5" required>{{ $vissionMission->mission }}</textarea>
                            </div>
                            <button type="submit" class="btn btn-primary">Update</button>
                            <a href="{{ route('admin.vissionmission.index') }}" class="btn btn-secondary">Cancel</a>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
