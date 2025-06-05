@extends('layouts.admin.master')

@section('title', 'Create Package Durations')

<head>

</head>

@section('content')
<div class="container-fluid">
    <div class="row">
        <div class="col-md-12">
            <div class="card">
                <div class="card-header">
                    <h5>Create Package Durations</h5>
                </div>
                <div class="card-body">
                    <form action="{{ route('durations.store') }}" method="POST">
                        @csrf
                        <div class="row">

                            <div class="form-group mb-3 col-md-6">
                                <label for="type">Type</label>
                                <select name="type" id="type" class="form-control" required>
                                    <option value="job">Job</option>
                                    <option value="banner">Banner</option>
                                </select>
                            </div>
                            <div class="form-group mb-3 col-md-6">
                                <label for="duration">Duration</label>
                                <input type="text" name="duration" class="form-control"  required>
                            </div>

                        </div>

                        <button type="submit" class="btn btn-primary">Create</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection

@section('script')

</script>
@endsection
