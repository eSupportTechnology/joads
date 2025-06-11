@extends('layouts.admin.master')

@section('title', 'Categories')
@section('style')
    <link rel="stylesheet" type="text/css" href="{{ asset('assets/css/vendors/datatables.css') }}">
    <link rel="stylesheet" type="text/css" href="{{ asset('assets/css/vendors/datatable-extension.css') }}">
@endsection

@section('breadcrumb-title')
    <h3>Categories</h3>
@endsection

@section('breadcrumb-items')
    <li class="breadcrumb-item">Dashboard</li>
    <li class="breadcrumb-item active">Categories</li>
@endsection

@section('content')
    <div class="container-fluid">
        @if (session('success'))
            <div class="alert alert-success">{{ session('success') }}</div>
        @endif
        <div class="row">
            <div class="col-sm-12">
                <div class="card">
                    <div class="card-header pb-0 card-no-border">
                    </div>
                    <div class="card-body">
                        <div class="row gx-3">
                            <div class="col-md-10 mb-4">
                                <h3>Category List</h3>
                            </div>
                            <div class="col-md-2 mb-4">
                                <a href="{{ route('admin.categories.create') }}" class="btn btn-primary btn-sm rounded">Create new</a>
                            </div>
                        </div>

                        {{-- Buttons for print, excel, pdf --}}
                        <div class="row mb-3">
                            <div class="col-md-12">
                                <button onclick="printTable()" class="btn btn-secondary btn-sm">Print</button>
                                <button onclick="exportExcel()" class="btn btn-success btn-sm">Export Excel</button>
                                <button onclick="exportPDF()" class="btn btn-danger btn-sm">Export PDF</button>
                            </div>
                        </div>

                        <div class="dt-ext table-responsive">
                            <table class="display" id="keytable">
                                <thead class="table-light">
                                    <tr>
                                        <th>S.No</th>
                                        <th>Name</th>
                                        <th>Parent</th>
                                        <th>No. of Posts</th>
                                        <th>Total Views</th>
                                        <th>Daily Views</th>
                                        <th>Status</th>
                                        <th>Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @foreach ($categories as $category)
                                        <tr>
                                            <td>{{ $category->id }}</td>
                                            <td>{{ $category->name }}</td>
                                            <td>{{ $category->parent ? $category->parent->name : 'Main Category' }}</td>
                                            <td>{{ $category->approved_job_postings_count }}</td>
                                            <td>{{ $category->approved_view_count ?? 0 }}</td>
                                            <td>{{ $category->today_views ?? 0 }}</td>
                                            <td>{{ ucfirst($category->status) }}</td>
                                            <td>
                                                <a href="{{ route('admin.categories.edit', $category->id) }}" class="btn btn-warning btn-sm">Edit</a>
                                                <form action="{{ route('admin.categories.destroy', $category->id) }}" method="POST" style="display:inline-block;">
                                                    @csrf
                                                    @method('DELETE')
                                                    <button type="submit" class="btn btn-danger btn-sm" onclick="return confirm('Are you sure?')">Delete</button>
                                                </form>
                                            </td>
                                        </tr>
                                        @if ($category->children && count($category->children) > 0)
                                            @foreach ($category->children as $sub)
                                                <tr>
                                                    <td>{{ $sub->id }}</td>
                                                    <td>-- {{ $sub->name }}</td>
                                                    <td>{{ $category->name }}</td>
                                                    <td>{{ ucfirst($sub->status) }}</td>
                                                    <td colspan="4"></td>
                                                    <td>
                                                        <a href="{{ route('admin.categories.edit', $sub->id) }}" class="btn btn-warning btn-sm">Edit</a>
                                                        <form action="{{ route('admin.categories.destroy', $sub->id) }}" method="POST" style="display:inline-block;">
                                                            @csrf
                                                            @method('DELETE')
                                                            <button type="submit" class="btn btn-danger btn-sm" onclick="return confirm('Are you sure?')">Delete</button>
                                                        </form>
                                                    </td>
                                                </tr>
                                            @endforeach
                                        @endif
                                    @endforeach
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection

@section('script')
    {{-- Datatable scripts (if you still want to use DataTables for paging, searching, etc.) --}}
    <script src="{{ asset('assets/js/datatable/datatables/jquery.dataTables.min.js') }}"></script>
    <script src="{{ asset('assets/js/datatable/datatable-extension/dataTables.buttons.min.js') }}"></script>
    <script src="{{ asset('assets/js/datatable/datatable-extension/buttons.print.min.js') }}"></script>
    <script src="{{ asset('assets/js/datatable/datatable-extension/buttons.bootstrap4.min.js') }}"></script>
    <script src="{{ asset('assets/js/datatable/datatable-extension/dataTables.bootstrap4.min.js') }}"></script>

    {{-- CDN for XLSX and jsPDF --}}
    <script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.18.5/xlsx.full.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.5.1/jspdf.umd.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf-autotable/3.5.28/jspdf.plugin.autotable.min.js"></script>

    <script>
        // Your existing DataTable initialization if needed
        $(document).ready(function() {
            $('#keytable').DataTable({
                pageLength: 30
            });
        });

        // Print function excluding last column (Actions)
        function printTable() {
            let table = document.getElementById('keytable');
            let newWin = window.open('', '', 'width=900,height=700');
            let html = '<html><head><title>Print Table</title>';
            html += '<style>table {border-collapse: collapse; width: 100%;} th, td {border: 1px solid #ccc; padding: 8px; text-align: left;} </style>';
            html += '</head><body><h3>Category List</h3><table><thead><tr>';

            // Get header except last column
            let headers = table.querySelectorAll('thead tr th');
            for(let i=0; i<headers.length-1; i++){
                html += '<th>' + headers[i].innerText + '</th>';
            }
            html += '</tr></thead><tbody>';

            // Get rows except last column
            let rows = table.querySelectorAll('tbody tr');
            rows.forEach(row => {
                html += '<tr>';
                let cells = row.querySelectorAll('td');
                for(let i=0; i<cells.length-1; i++){
                    html += '<td>' + cells[i].innerText + '</td>';
                }
                html += '</tr>';
            });

            html += '</tbody></table></body></html>';

            newWin.document.write(html);
            newWin.document.close();
            newWin.focus();
            newWin.print();
            newWin.close();
        }

        // Export Excel function excluding last column
        function exportExcel() {
            let table = document.getElementById('keytable');
            let wb = XLSX.utils.book_new();

            // Build array of arrays for XLSX
            let data = [];
            let headers = table.querySelectorAll('thead tr th');
            let headerRow = [];
            for(let i=0; i<headers.length-1; i++){
                headerRow.push(headers[i].innerText.trim());
            }
            data.push(headerRow);

            let rows = table.querySelectorAll('tbody tr');
            rows.forEach(row => {
                let rowData = [];
                let cells = row.querySelectorAll('td');
                for(let i=0; i<cells.length-1; i++){
                    rowData.push(cells[i].innerText.trim());
                }
                data.push(rowData);
            });

            let ws = XLSX.utils.aoa_to_sheet(data);
            XLSX.utils.book_append_sheet(wb, ws, 'Categories');
            XLSX.writeFile(wb, 'categories.xlsx');
        }

        // Export PDF function excluding last column
        async function exportPDF() {
            const { jsPDF } = window.jspdf;
            let doc = new jsPDF('landscape');

            let table = document.getElementById('keytable');

            // Prepare headers
            let headers = [];
            let ths = table.querySelectorAll('thead tr th');
            for(let i=0; i<ths.length-1; i++){
                headers.push(ths[i].innerText.trim());
            }

            // Prepare data rows
            let data = [];
            let rows = table.querySelectorAll('tbody tr');
            rows.forEach(row => {
                let rowData = [];
                let tds = row.querySelectorAll('td');
                for(let i=0; i<tds.length-1; i++){
                    rowData.push(tds[i].innerText.trim());
                }
                data.push(rowData);
            });

            // AutoTable plugin for jsPDF to create tables
            doc.autoTable({
                head: [headers],
                body: data,
                styles: { fontSize: 8 },
                headStyles: { fillColor: [22, 160, 133] },
                margin: { top: 20 }
            });

            doc.save('categories.pdf');
        }
    </script>
@endsection
