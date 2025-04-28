<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Professional Experience</title>

    <link rel="stylesheet" href="{{ asset('css/home.css') }}">
    <link rel="stylesheet" href="{{ asset('css/footer.css') }}">
    <link href="https://cdn.quilljs.com/1.3.6/quill.snow.css" rel="stylesheet">

    <style>
        .experience-container {
            width: 100%;
            max-width: 900px;
            margin: 20px auto;
            padding: 0 20px;
            background: #fff;
            border: 2px dashed #d01b1b;
            border-radius: 8px;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
            margin-top: -800px;
            margin-left: 400px;
        }

        .section-header {
            font-size: 20px;
            font-weight: bold;
            color: #fff;
            background-color: blue;
            padding: 10px;
            border-radius: 5px 5px 0 0;
        }

        .form-group {
            margin-bottom: 20px;
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

        .editor-container {
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 4px;
            background-color: #f9f9f9;
        }

        .ql-container {
            height: 200px;
        }

        .info {
            font-size: 12px;
            color: #666;
            display: block;
            margin-top: 5px;
        }

        .example {
            font-size: 12px;
            color: #999;
        }

        .btn {
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            color: #fff;
            cursor: pointer;
            font-weight: bold;
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

        @media (max-width: 768px) {
            .experience-container {
                width: 80%;
                margin: 10px auto;
                padding: 15px;
                margin-top: 0;


            }

            .section-header {
                font-size: 18px;
                text-align: center;
            }

            .form-group {
                flex: 1;
            }

            .form-control {
                font-size: 14px;
            }

            .btn {
                width: 100%;
                text-align: center;
            }

        }
    </style>
</head>

<body>
    @include('User.jobseekerprofile.mainview.profilelayout')
    <div class="experience-container">
        <h2 class="section-header">Professional Experience</h2>

        @foreach (auth()->user()->jobExperiences ?? [] as $experience)
            <form method="POST" action="{{ route('experience.update', $experience->id) }}"
                class="experience-form mb-4">
                @csrf
                @method('PUT')
                <div class="experience-entry">
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label>Organisation <span class="required">*</span></label>
                            <input type="text" name="company_name" value="{{ $experience->company_name }}"
                                class="form-control" placeholder="Company Name" required>
                        </div>
                        <div class="form-group col-md-6">
                            <label>Designation <span class="required">*</span></label>
                            <input type="text" name="job_title" value="{{ $experience->job_title }}"
                                class="form-control" placeholder="Job Title" required>
                        </div>
                    </div>

                    <div class="form-group">
                        <label>Job Description <span class="required">*</span></label>
                        <div id="editor-{{ $experience->id }}" class="editor-container">{!! $experience->job_description !!}</div>
                        <input type="hidden" name="job_description" class="job-description-input">
                    </div>

                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label>Start Date <span class="required">*</span></label>
                            <input type="date" name="start_date" value="{{ $experience->start_date }}"
                                class="form-control" required>
                        </div>
                        <div class="form-group col-md-6">
                            <label>End Date <span class="required">*</span></label>
                            <input type="date" name="end_date" value="{{ $experience->end_date }}"
                                class="form-control" required>
                        </div>
                    </div>

                    <div class="form-row mt-2">
                        <div class="col">
                            <button type="submit" class="btn btn-success">Update</button>
                            <a href="{{ route('experience.delete', $experience->id) }}"
                                onclick="return confirm('Are you sure you want to delete this experience record?')"
                                class="btn btn-danger">Delete</a>
                        </div>
                    </div>
                </div>
            </form>
        @endforeach

        <h3 class="mt-4">Add New Experience</h3>
        <form method="POST" action="{{ route('experience.store') }}" id="newExperienceForm">
            @csrf
            <input type="hidden" name="job_seeker_id" value="{{ auth()->id() }}">

            <div id="experienceContainer">
                <div class="experience-entry mb-4">
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label>Organisation <span class="required">*</span></label>
                            <input type="text" name="experiences[0][company_name]" class="form-control"
                                placeholder="Company Name" required>
                        </div>
                        <div class="form-group col-md-6">
                            <label>Designation <span class="required">*</span></label>
                            <input type="text" name="experiences[0][job_title]" class="form-control"
                                placeholder="Job Title" required>
                        </div>
                    </div>

                    <div class="form-group">
                        <label>Job Description <span class="required">*</span></label>
                        <div id="new-editor-0" class="editor-container"></div>
                        <input type="hidden" name="experiences[0][job_description]" class="job-description-input">
                    </div>

                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label>Start Date <span class="required">*</span></label>
                            <input type="date" name="experiences[0][start_date]" class="form-control" required>
                        </div>
                        <div class="form-group col-md-6">
                            <label>End Date <span class="required">*</span></label>
                            <input type="date" name="experiences[0][end_date]" class="form-control" required>
                        </div>
                    </div>
                    <hr>
                </div>
            </div>

            <div class="form-row mt-3 mb-4">
                <div class="col">
                    <button type="button" class="btn btn-primary" onclick="addExperienceField()">Add Another
                        Experience</button>
                    <button type="submit" class="btn btn-success">Save All Experience Details</button>
                </div>
            </div>
        </form>
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

        let experienceCount = 1;

        function addExperienceField() {
            const container = document.getElementById('experienceContainer');
            const newExperience = document.createElement('div');
            newExperience.className = 'experience-entry mb-4';

            newExperience.innerHTML = `
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label>Organisation <span class="required">*</span></label>
                        <input type="text" name="experiences[${experienceCount}][company_name]" class="form-control"
                            placeholder="Company Name" required>
                    </div>
                    <div class="form-group col-md-6">
                        <label>Designation <span class="required">*</span></label>
                        <input type="text" name="experiences[${experienceCount}][job_title]" class="form-control"
                            placeholder="Job Title" required>
                    </div>
                </div>

                <div class="form-group">
                    <label>Job Description <span class="required">*</span></label>
                    <div id="new-editor-${experienceCount}" class="editor-container"></div>
                    <input type="hidden" name="experiences[${experienceCount}][job_description]" class="job-description-input">
                </div>

                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label>Start Date <span class="required">*</span></label>
                        <input type="date" name="experiences[${experienceCount}][start_date]" class="form-control" required>
                    </div>
                    <div class="form-group col-md-6">
                        <label>End Date <span class="required">*</span></label>
                        <input type="date" name="experiences[${experienceCount}][end_date]" class="form-control" required>
                    </div>
                </div>
                <button type="button" class="btn btn-danger" onclick="removeExperience(this, ${experienceCount})">Remove</button>
                <hr>
            `;

            container.appendChild(newExperience);

            const newQuill = new Quill(`#new-editor-${experienceCount}`, quillOptions);
            editors.set(`new-editor-${experienceCount}`, newQuill);

            experienceCount++;
        }

        function removeExperience(button, index) {
            editors.delete(`new-editor-${index}`);
            button.closest('.experience-entry').remove();
        }

        // Handle form submissions
        document.querySelectorAll('.experience-form').forEach(form => {
            form.addEventListener('submit', function(e) {
                e.preventDefault();

                const editorId = this.querySelector('[id^="editor-"]').id;
                const quill = editors.get(editorId);
                const hiddenInput = this.querySelector('input[name="job_description"]');

                if (quill && hiddenInput) {
                    hiddenInput.value = quill.root.innerHTML;
                }

                this.submit();
            });
        });

        document.getElementById('newExperienceForm').addEventListener('submit', function(e) {
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