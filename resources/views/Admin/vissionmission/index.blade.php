@extends('layouts.admin.master')

@section('title', 'Vision & Mission Details')

@section('css')
    <link rel="stylesheet" type="text/css" href="{{ asset('assets/css/vendors/animate.css') }}">
@endsection

@section('style')
@endsection

@section('breadcrumb-title')
    <h3 class="">Vision & Mission Details</h3>
@endsection

@section('breadcrumb-items')
    <li class="breadcrumb-item">Dashboard</li>
    <li class="breadcrumb-item active" aria-current="page">Vision & Mission</li>
@endsection

@section('content')
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-10">
                <div class="card content-card">
                    <div class="card-header d-flex justify-content-between align-items-center">
                        <span>Vision & Mission Information</span>
                        <a href="{{ route('admin.vissionmission.create') }}" class="btn btn-primary action-button">
                            <i class="fa fa-plus-circle me-2"></i>Create New Vision & Mission
                        </a>
                    </div>

                    <div class="card-body">
                        @if (session('success'))
                            <div class="alert alert-success animate__animated animate__fadeIn">
                                <i class="fa fa-check-circle me-2"></i>{{ session('success') }}
                            </div>
                        @endif

                        @if ($vissionMissions->count() > 0)
                            <table class="table table-bordered">
                                <thead>
                                    <tr>
                                        <th>Vision</th>
                                        <th>Mission</th>
                                        <th>Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @foreach ($vissionMissions as $vm)
                                        <tr>
                                            <td>{{ $vm->vission }}</td>
                                            <td>{{ $vm->mission }}</td>
                                            <td>
                                                <a href="{{ route('admin.vissionmission.edit', $vm->id) }}" class="btn btn-primary">
                                                    <i class="fa fa-edit"></i>
                                                </a>
                                                <form action="{{ route('admin.vissionmission.destroy', $vm->id) }}" method="POST" style="display:inline-block;">
                                                    @csrf
                                                    @method('DELETE')
                                                    <button class="btn btn-danger" onclick="return confirm('Are you sure?')">
                                                        <i class="fa fa-trash"></i>
                                                    </button>
                                                </form>
                                            </td>
                                        </tr>
                                    @endforeach
                                </tbody>
                            </table>
                        @else
                            <div class="alert alert-warning animate__animated animate__fadeIn">
                                <i class="fa fa-exclamation-circle me-2"></i>No Vision & Mission information available.
                            </div>
                        @endif
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection

@section('script')
    <script src="{{ asset('assets/js/animation/wow/wow.min.js') }}"></script>
@endsection
