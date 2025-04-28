<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Education Details</title>
    <link rel="stylesheet" href="{{ asset('css/home.css') }}">
    <link rel="stylesheet" href="{{ asset('css/footer.css') }}">
    <link href="https://cdn.quilljs.com/1.3.6/quill.snow.css" rel="stylesheet">

    <style>
        .education-container {
            width: 100%;
            max-width: 900px;
            margin: 20px auto;
            padding: 20px;
            background: #fff;
            border: 2px solid #ccc;
            border-radius: 8px;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
        }

        .form-row {
            display: flex;
            gap: 20px;
            margin-bottom: 20px;
        }

        .form-group {
            flex: 1;
        }

        label {
            font-weight: bold;
            display: block;
            margin-bottom: 5px;
        }

        .required {
            color: red;
        }

        .form-control {
            width: 100%;
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 4px;
            background-color: #f9f9f9;
        }

        textarea.form-control {
            resize: none;
        }

        .example {
            font-size: 12px;
            color: #999;
            display: block;
            margin-top: 5px;
        }

        .btn {
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            color: #fff;
            cursor: pointer;
            font-weight: bold;
            transition: background 0.3s ease-in-out;
        }

        .btn-primary {
            background-color: #d01b1b;
        }

        .btn-primary:hover {
            background-color: #b81717;
        }

        .btn-success {
            background-color: #28a745;
        }

        .btn-success:hover {
            background-color: #218838;
        }

        .btn-danger {
            background-color: #dc3545;
        }

        .btn-danger:hover {
            background-color: #c82333;
        }

        .table {
            width: 100%;
            margin-top: 20px;
            border-collapse: collapse;
            overflow-x: auto;
        }

        .table th,
        .table td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: center;
        }

        .table th {
            background-color: #f5f5f5;
            font-weight: bold;
        }

        .check {
            margin-top: 50px;
        }

        .editor-container {
            margin-bottom: 20px;
        }

        .ql-container {
            height: 200px;
        }

        @media (max-width: 768px) {
            .education-container {
                width: 35%;
                padding: 15px;
                margin-left: 0;
                margin-right: auto;
            }

            .form-row {
                flex-direction: column;
                gap: 10px;
            }

            .form-group {
                flex: 1;
            }

            .btn {
                width: 100%;
                text-align: center;
            }

            .table {
                display: block;
                width: 50%;
                overflow-x: auto;
                white-space: nowrap;
            }

            .table th,
            .table td {
                font-size: 14px;
            }

            .check {
                margin-top: 900px;
                margin-left: -430px;
            }
        }
    </style>
</head>

<body>
    @include('User.jobseekerprofile.mainview.profilelayout')

    <div class="check">
        <div class="education-container">
            <h2 class="section-header"> Education</h2>

            @foreach (auth()->user()->jobEducations ?? [] as $education)
                <form method="POST" action="{{ route('education.update', $education->id) }}"
                    class="education-form mb-4">
                    @csrf
                    @method('PUT')
                    <div class="education-entry">
                        <div class="form-row">
                            <div class="form-group">
                                <label>School/Institute <span class="required">*</span></label>
                                <input type="text" name="institution_name" value="{{ $education->institution_name }}"
                                    class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Program <span class="required">*</span></label>
                                <input type="text" name="degree" value="{{ $education->degree }}"
                                    class="form-control" required>
                            </div>
                        </div>

                        <div class="form-group editor-container">
                            <label>Field of Study <span class="required">*</span></label>
                            <div id="editor-{{ $education->id }}">{!! $education->field_of_study !!}</div>
                            <input type="hidden" name="field_of_study" class="field-study-input">
                        </div>

                        <div class="form-row">
                            <div class="form-group">
                                <label>Start Date <span class="required">*</span></label>
                                <input type="date" name="start_date" value="{{ $education->start_date }}"
                                    class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>End Date <span class="required">*</span></label>
                                <input type="date" name="end_date" value="{{ $education->end_date }}"
                                    class="form-control" required>
                            </div>
                        </div>

                        <div class="form-row mt-2">
                            <div class="col">
                                <button type="submit" class="btn btn-success">Update</button>
                                <a href="{{ route('education.delete', $education->id) }}"
                                    onclick="return confirm('Are you sure you want to delete this education record?')"
                                    class="btn btn-danger">Delete</a>
                            </div>
                        </div>
                    </div>
                </form>
            @endforeach

            <h3 class="mt-4">Add New Education</h3>
            <form method="POST" action="{{ route('education.store') }}" id="newEducationForm">
                @csrf
                <input type="hidden" name="job_seeker_id" value="{{ auth()->id() }}">

                <div id="educationContainer">
                    <div class="education-entry mb-4">
                        <div class="form-row">
                            <div class="form-group">
                                <label>School/Institute <span class="required">*</span></label>
                                <input type="text" name="educations[0][institution_name]" class="form-control"
                                    required>
                            </div>
                            <div class="form-group">
                                <label>Program <span class="required">*</span></label>
                                <input type="text" name="educations[0][degree]" class="form-control" required>
                            </div>
                        </div>

                        <div class="form-group editor-container">
                            <label>Field of Study <span class="required">*</span></label>
                            <div id="new-editor-0"></div>
                            <input type="hidden" name="educations[0][field_of_study]" class="field-study-input">
                        </div>

                        <div class="form-row">
                            <div class="form-group">
                                <label>Start Date <span class="required">*</span></label>
                                <input type="date" name="educations[0][start_date]" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>End Date <span class="required">*</span></label>
                                <input type="date" name="educations[0][end_date]" class="form-control" required>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="form-row mt-3 mb-4">
                    <div class="col">
                        <button type="button" class="btn btn-primary" onclick="addEducationField()">Add Another
                            Education</button>
                        <button type="submit" class="btn btn-success">Save All Education Details</button>
                    </div>
                </div>
            </form>
        </div>
    </div>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <script src="https://cdn.quilljs.com/1.3.6/quill.min.js"></script>

    <script>
        const quillOptions = {
            theme: 'snow',
            modules: {
                toolbar: [
                    [{
                        'font': []
                    }],
                    [{
                        'size': ['small', false, 'large', 'huge']
                    }],
                    ['bold', 'italic', 'underline', 'strike'],
                    [{
                        'color': []
                    }, {
                        'background': []
                    }],
                    [{
                        'script': 'sub'
                    }, {
                        'script': 'super'
                    }],
                    [{
                        'header': [1, 2, 3, 4, 5, 6, false]
                    }],
                    [{
                        'align': []
                    }],
                    ['blockquote', 'code-block'],
                    [{
                        'list': 'ordered'
                    }, {
                        'list': 'bullet'
                    }],
                    [{
                        'indent': '-1'
                    }, {
                        'indent': '+1'
                    }],
                    ['link'],
                    ['clean']
                ]
            }
        };

        const editors = new Map();

        // Initialize existing editors
        document.querySelectorAll('[id^="editor-"]').forEach(editor => {
            const quill = new Quill(editor, quillOptions);
            editors.set(editor.id, quill);
        });

        // Initialize first new editor
        const firstEditor = new Quill('#new-editor-0', quillOptions);
        editors.set('new-editor-0', firstEditor);

        let educationCount = 1;

        function addEducationField() {
            const container = document.getElementById('educationContainer');
            const newEducation = document.createElement('div');
            newEducation.className = 'education-entry mb-4';

            newEducation.innerHTML = `
                <div class="form-row">
                    <div class="form-group">
                        <label>School/Institute <span class="required">*</span></label>
                        <input type="text" name="educations[${educationCount}][institution_name]" class="form-control" required>
                    </div>
                    <div class="form-group">
                        <label>Program <span class="required">*</span></label>
                        <input type="text" name="educations[${educationCount}][degree]" class="form-control" required>
                    </div>
                </div>

                <div class="form-group editor-container">
                    <label>Field of Study <span class="required">*</span></label>
                    <div id="new-editor-${educationCount}"></div>
                    <input type="hidden" name="educations[${educationCount}][field_of_study]" class="field-study-input">
                </div>

                <div class="form-row">
                    <div class="form-group">
                        <label>Start Date <span class="required">*</span></label>
                        <input type="date" name="educations[${educationCount}][start_date]" class="form-control" required>
                    </div>
                    <div class="form-group">
                        <label>End Date <span class="required">*</span></label>
                        <input type="date" name="educations[${educationCount}][end_date]" class="form-control" required>
                    </div>
                </div>
                <button type="button" class="btn btn-danger" onclick="removeEducationField(this, ${educationCount})">Remove</button>
            `;

            container.appendChild(newEducation);

            const newQuill = new Quill(`#new-editor-${educationCount}`, quillOptions);
            editors.set(`new-editor-${educationCount}`, newQuill);

            educationCount++;
        }

        function removeEducationField(button, index) {
            editors.delete(`new-editor-${index}`);
            button.closest('.education-entry').remove();
        }

        // Handle form submissions
        document.querySelectorAll('.education-form').forEach(form => {
            form.addEventListener('submit', function(e) {
                e.preventDefault();

                const editorId = this.querySelector('[id^="editor-"]').id;
                const quill = editors.get(editorId);
                const hiddenInput = this.querySelector('input[name="field_of_study"]');

                if (quill && hiddenInput) {
                    hiddenInput.value = quill.root.innerHTML;
                }

                this.submit();
            });
        });

        document.getElementById('newEducationForm').addEventListener('submit', function(e) {
            e.preventDefault();

            document.querySelectorAll('[id^="new-editor-"]').forEach((editorElement) => {
                const quill = editors.get(editorElement.id);
                if (quill) {
                    const hiddenInput = editorElement.nextElementSibling;
                    hiddenInput.value = quill.root.innerHTML;
                }
            });

            this.submit();
        });
    </script>
</body>

</html>