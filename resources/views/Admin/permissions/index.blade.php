@extends('layouts.admin.master')

@section('title', 'Admin Permissions')

@section('css')
@endsection

@section('style')
    <link rel="stylesheet" type="text/css" href="{{ asset('assets/css/vendors/datatables.css') }}">
    <link rel="stylesheet" type="text/css" href="{{ asset('assets/css/vendors/datatable-extension.css') }}">
@endsection

@section('breadcrumb-title')
    <h3>Admin Permissions</h3>
@endsection

@section('breadcrumb-items')
    <li class="breadcrumb-item">Dashboard</li>
    <li class="breadcrumb-item active">Admin Permissions</li>
@endsection

@section('content')
    <div class="container-fluid">
        <div class="row justify-content-center">
            <div class="col-xl-10 col-lg-12">
                <div class="card shadow-sm">
                    <div class="card-header d-flex justify-content-between align-items-center">
                        <h5 class="mb-0">Assign Permissions to Admin</h5>
                    </div>
                    <div class="card-body">
                        @if (session('success'))
                            <div class="alert alert-success alert-dismissible fade show" role="alert">
                                {{ session('success') }}
                                <button type="button" class="btn-close" data-bs-dismiss="alert"
                                    aria-label="Close"></button>
                            </div>
                        @endif

                        {{-- Admin Select --}}
                        <form method="GET" action="{{ route('superadmin.show.permissions') }}" class="mb-4">
                            <div class="row align-items-end">
                                <div class="col-md-8">
                                    <label for="admin" class="form-label">Select Admin:</label>
                                    <select name="admin_id" onchange="this.form.submit()" class="form-select">
                                        <option value="">-- Select Admin --</option>
                                        @foreach ($admins as $admin)
                                            <option value="{{ $admin->id }}"
                                                {{ isset($selectedAdmin) && $selectedAdmin->id == $admin->id ? 'selected' : '' }}>
                                                {{ $admin->name }} - {{ $admin->email }}
                                            </option>
                                        @endforeach
                                    </select>
                                </div>
                            </div>
                        </form>

                        {{-- Permission Checkboxes --}}
                        @if (isset($selectedAdmin))
                            <form method="POST" action="{{ route('superadmin.assign.permissions') }}">
                                @csrf
                                <input type="hidden" name="admin_id" value="{{ $selectedAdmin->id }}">

                                <div class="mb-3">
                                    <h6 class="mb-3">Available Permissions:</h6>

                                    <!-- Select All -->
                                    <div class="form-check mb-3">
                                        <input type="checkbox" id="select_all" class="form-check-input">
                                        <label for="select_all" class="form-check-label fw-bold">Select All</label>
                                    </div>

                                    @foreach ($permissions as $category => $perms)
                                        <div class="card mb-3">
                                            <div class="card-header bg-primary text-white fw-bold">
                                                {{ ucfirst($category) }} Permissions
                                            </div>
                                            <div class="card-body">
                                                <div class="row">
                                                    @foreach ($perms as $permission)
                                                        <div class="col-md-3 col-sm-6 mb-2">
                                                            <div class="form-check">
                                                                <input type="checkbox" name="permissions[]"
                                                                    value="{{ $permission->id }}"
                                                                    class="form-check-input permission-checkbox"
                                                                    id="perm_{{ $permission->id }}"
                                                                    {{ $selectedAdmin->permissions->contains('id', $permission->id) ? 'checked' : '' }}>
                                                                <label class="form-check-label"
                                                                    for="perm_{{ $permission->id }}">
                                                                    {{ $permission->name }}
                                                                </label>
                                                            </div>
                                                        </div>
                                                    @endforeach
                                                </div>
                                            </div>
                                        </div>
                                    @endforeach
                                </div>


                                <button type="submit" class="btn btn-primary mt-3">Assign Permissions</button>
                            </form>
                        @endif
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection

@section('script')
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const selectAllCheckbox = document.getElementById('select_all');
            const permissionCheckboxes = document.querySelectorAll('.permission-checkbox');

            // Set "Select All" checked if all permissions are already checked
            function updateSelectAllCheckbox() {
                const allChecked = Array.from(permissionCheckboxes).every(cb => cb.checked);
                selectAllCheckbox.checked = allChecked;
            }

            // Initial check on page load
            updateSelectAllCheckbox();

            // "Select All" click toggles all
            selectAllCheckbox.addEventListener('change', function() {
                permissionCheckboxes.forEach(cb => cb.checked = this.checked);
            });

            // Individual checkbox toggle updates "Select All"
            permissionCheckboxes.forEach(cb => {
                cb.addEventListener('change', function() {
                    updateSelectAllCheckbox();
                });
            });
        });
    </script>
@endsection
