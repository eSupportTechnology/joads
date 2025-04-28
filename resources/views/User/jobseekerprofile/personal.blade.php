<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>

    <link rel="stylesheet" href="{{ asset('css/home.css') }}">
    <link rel="stylesheet" href="{{ asset('css/footer.css') }}">
    <link rel="stylesheet" href="{{ asset('css/personalprofile.css') }}">

    <!-- TinyMCE CDN -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/tinymce/6.8.3/tinymce.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/cropperjs/1.5.12/cropper.min.css">

    <style>
        .profile-preview {
            width: 150px;
            height: 150px;
            border-radius: 50%;
            object-fit: cover;
            margin-bottom: 10px;
            border: 3px solid #ddd;
        }

        .profile-image-section {
            text-align: center;
            margin-bottom: 20px;
        }

        /* General Styling */
        .personalcontainer {
            max-width: 1200px;
            margin: 20px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            margin-left: 380px;
            margin-top: -850px;
            margin-right: 10px;
        }

        .personalcontainer h1 {
            font-size: 24px;
            color: #409cf1;
            margin-bottom: 20px;
            border-bottom: 2px dashed blue;
            padding-bottom: 10px;
        }

        form {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 15px;
        }

        form label {
            font-weight: bold;
            color: #333;
            margin-bottom: 5px;
            display: block;
        }

        form input.personalprofile,
        form select,
        form textarea {
            width: 100%;
            padding: 8px;
            font-size: 14px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
            background-color: #f9f9f9;
        }

        form input.personalprofile[type="radio"] {
            width: auto;
            margin-right: 5px;
        }

        form button {
            grid-column: span 3;
            padding: 10px 20px;
            font-size: 16px;
            color: #fff;
            background-color: #409cf1;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        form button:hover {
            background-color: blue;
        }

        .tox-tinymce {
            min-height: 200px !important;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .personalcontainer {
                margin-left: auto;
                margin-right: auto;
                margin-top: 0;
                padding: 15px;
                box-shadow: none;
            }

            form {
                grid-template-columns: 1fr;
            }

            form button {
                grid-column: span 1;
                width: 100%;
            }

            .personalcontainer h1 {
                font-size: 20px;
                text-align: center;
            }
        }

        /* Add cropping modal styles */
        #cropModal {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.8);
            z-index: 1000;
        }

        .modal-content {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            background: white;
            padding: 20px;
            border-radius: 8px;
            text-align: center;
        }

        #imageContainer {
            max-width: 80vw;
            max-height: 60vh;
            margin-bottom: 15px;
        }

        #cropButton {
            padding: 10px 20px;
            background: #409cf1;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
        }

        #cropButton:hover {
            background: #3081c7;
        }
    </style>
</head>

<body>
    @include('User.jobseekerprofile.mainview.profilelayout')

    <div class="personalcontainer">
        <h1>Personal Details</h1>
        <form method="POST" action="{{ route('profile.update') }}" enctype="multipart/form-data">
            @csrf
            @method('PATCH')

            <div>
                <label for="name">Name</label>
                <input class="personalprofile" type="text" name="name" value="{{ Auth::user()->name }}"
                    id="name" required>
            </div>
            <div style="grid-column: span 3;">
                <label for="title">Title</label>
                <div id="editor-title" class="editor-container">
                    {!! Auth::user()->title ?? '' !!}
                </div>
                <input type="hidden" name="title" class="title-input">
            </div>
            <div class="profile-image-section">
                @if (Auth::user()->profile_image)
                    <img src="{{ asset('storage/app/public/profile_images/' . Auth::user()->profile_image) }}" alt="Profile Image"
                        class="profile-preview">
                    <p>Current Profile Image</p>
                @else
                    <p>No Profile Image</p>
                @endif
            </div>

            <div>
                <label for="profile_image">Profile Image</label>
                <input class="personalprofile" type="file" name="profile_image" id="profile_image">
                <small>Upload new image(200x200) to update (Max 2MB, JPG/PNG)</small>
            </div>
            <div>
                <label for="email">Email</label>
                <input class="personalprofile" type="email" name="email" value="{{ Auth::user()->email }}"
                    id="email" required>
            </div>

            <div>
                <label for="phone_number">Phone Number</label>
                <input class="personalprofile" type="text" name="phone_number"
                    value="{{ Auth::user()->phone_number }}" id="phone_number" required>
            </div>

            <div>
                <label for="address">Address</label>
                <textarea name="address" id="address" class="personalprofile">{{ Auth::user()->address }}</textarea>
            </div>

            <div>
                <label for="linkedin">LinkedIn Profile</label>
                <input class="personalprofile" type="url" name="linkedin" value="{{ Auth::user()->linkedin }}"
                    id="linkedin">
            </div>

            <div>
                <label for="summary">Professional Summary</label>
                <textarea name="summary" id="summary" class="personalprofile">{{ Auth::user()->summary }}</textarea>
            </div>

            <div>
                <label for="experience">Work experience</label>
                <textarea name="experience" id="experience" class="personalprofile">{{ Auth::user()->experience }}</textarea>
            </div>

            <div>
                <label for="education">Education</label>
                <textarea name="education" id="education" class="personalprofile">{{ Auth::user()->education }}</textarea>
            </div>

            <!-- Additional Personal Details -->
            <div>
                <label for="fullname">Full Name</label>
                <input class="personalprofile" type="text" name="fullname" id="fullname"
                    value="{{ Auth::user()->fullname }}">
            </div>
            <div>
                <label for="marital_status">Marital Status</label>
                <select name="marital_status" id="marital_status" class="personalprofile">
                    <option value="">Select Marital Status</option>
                    <option value="Single" {{ Auth::user()->marital_status == 'Single' ? 'selected' : '' }}>Single
                    </option>
                    <option value="Married" {{ Auth::user()->marital_status == 'Married' ? 'selected' : '' }}>Married
                    </option>
                    <option value="Divorced" {{ Auth::user()->marital_status == 'Divorced' ? 'selected' : '' }}>
                        Divorced</option>
                    <option value="Widowed" {{ Auth::user()->marital_status == 'Widowed' ? 'selected' : '' }}>Widowed
                    </option>
                </select>
            </div>
            <div>
                <label for="date_of_birth">Date of Birth</label>
                <input class="personalprofile" type="date" name="date_of_birth" id="date_of_birth"
                    value="{{ Auth::user()->date_of_birth }}">
            </div>
            <div>
                <label for="gender">Gender</label>
                <select name="gender" id="gender" class="personalprofile">
                    <option value="">Select Gender</option>
                    <option value="Male" {{ Auth::user()->gender == 'Male' ? 'selected' : '' }}>Male</option>
                    <option value="Female" {{ Auth::user()->gender == 'Female' ? 'selected' : '' }}>Female</option>
                    <option value="Other" {{ Auth::user()->gender == 'Other' ? 'selected' : '' }}>Other</option>
                </select>
            </div>
            <div>
                <label for="nationality">Nationality</label>
                <input class="personalprofile" type="text" name="nationality" id="nationality"
                    value="{{ Auth::user()->nationality }}">
            </div>
            <div>
                <label for="nic_no">NIC No</label>
                <input class="personalprofile" type="text" name="nic_no" id="nic_no"
                    value="{{ Auth::user()->nic_no }}">
            </div>

            <!-- Skills Editor -->
            <div style="grid-column: span 3;">
                <label for="skills">Skills <span class="required">*</span></label>
                <div id="editor-skills" class="editor-container">{!! Auth::user()->skills !!}</div>
                <input type="hidden" name="skills" class="skills-input">
            </div>

            <!-- Certifications Editor -->
            <div style="grid-column: span 3;">
                <label for="certifications">Certifications <span class="required">*</span></label>
                <div id="editor-certifications" class="editor-container">{!! Auth::user()->certifications !!}</div>
                <input type="hidden" name="certifications" class="certifications-input">
            </div>
            <div>
                <label for="portfolio_link">Portfolio Link</label>
                <input class="personalprofile" type="url" name="portfolio_link"
                    value="{{ Auth::user()->portfolio_link }}" id="portfolio_link">
            </div>

            <div>
                <label for="social_links">Social Media Links</label>
                <textarea name="social_links" id="social_links" class="personalprofile">{{ Auth::user()->social_links }}</textarea>
            </div>
            <!-- Referees 1 -->
            <div style="grid-column: span 3;">
                <label for="referees">Referees 1</label>
                <div id="editor-referees1" class="editor-container">
                    {!! Auth::user()->referees !!}
                </div>
                <input type="hidden" name="referees" class="referees1-input">
            </div>

            <!-- Referees 2 -->
            <div style="grid-column: span 3;">
                <label for="referees2">Referees 2</label>
                <div id="editor-referees2" class="editor-container">
                    {!! Auth::user()->referees2 !!}
                </div>
                <input type="hidden" name="referees2" class="referees2-input">
            </div>
            <div>
                <label for="resume_file">Resume</label>
                <input class="personalprofile" type="file" name="resume_file" id="resume_file">
            </div>

            <button type="submit">Submit</button>
        </form>
    </div>
    <div id="cropModal">
        <div class="modal-content">
            <div id="imageContainer">
                <img id="cropImage" src="#" alt="Image to crop">
            </div>
            <button id="cropButton">Crop & Save</button>
        </div>
    </div>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/cropperjs/1.5.12/cropper.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <script>
        // Initialize TinyMCE for skills and certifications
        document.addEventListener('DOMContentLoaded', function() {
            // Common configuration for both editors
            const editorConfig = {
                height: 300,
                menubar: false,
                plugins: [
                    'advlist', 'autolink', 'lists', 'link', 'charmap', 'preview',
                    'searchreplace', 'visualblocks', 'code', 'fullscreen',
                    'insertdatetime', 'table', 'code', 'help', 'wordcount'
                ],
                toolbar: 'undo redo | formatselect | ' +
                    'bold italic backcolor | alignleft aligncenter ' +
                    'alignright alignjustify | bullist numlist outdent indent | ' +
                    'removeformat | help',
                content_style: 'body { font-family:Helvetica,Arial,sans-serif; font-size:14px }',
                init_instance_callback: function(editor) {
                    // Set initial content from the editor div
                    const editorContainer = document.getElementById(editor.id);
                    editor.setContent(editorContainer.innerHTML);

                    // Update hidden input with initial content
                    const inputName = editor.id.replace('editor-', '');
                    const hiddenInput = document.querySelector(`input[name="${inputName}"]`);
                    if (hiddenInput) {
                        hiddenInput.value = editor.getContent();
                    }
                },
                setup: function(editor) {
                    editor.on('change keyup', function() {
                        // Get the corresponding hidden input
                        const inputName = editor.id.replace('editor-', '');
                        const hiddenInput = document.querySelector(`input[name="${inputName}"]`);
                        if (hiddenInput) {
                            hiddenInput.value = editor.getContent();
                        }
                    });
                }
            };

            // Initialize TinyMCE for skills
            tinymce.init({
                ...editorConfig,
                selector: '#editor-skills'
            });

            // Initialize TinyMCE for certifications
            tinymce.init({
                ...editorConfig,
                selector: '#editor-certifications'
            });
        });
    </script>
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const profileImageInput = document.getElementById('profile_image');
            const profileImageSection = document.querySelector('.profile-image-section');
            let profilePreview = document.querySelector('.profile-preview');
            let cropper = null;

            if (profileImageInput) {
                profileImageInput.addEventListener('change', function(e) {
                    const file = this.files[0];
                    if (file && file.type.match('image.*')) {
                        const reader = new FileReader();

                        reader.onload = function(e) {
                            // Show cropping modal
                            const modal = document.getElementById('cropModal');
                            const cropImage = document.getElementById('cropImage');
                            modal.style.display = 'block';
                            cropImage.src = e.target.result;

                            // Initialize cropper
                            if (cropper) {
                                cropper.destroy();
                            }

                            cropper = new Cropper(cropImage, {
                                aspectRatio: 1,
                                viewMode: 1,
                                autoCropArea: 0.8,
                                movable: true,
                                zoomable: true,
                                rotatable: false,
                                scalable: false,
                            });

                            // Handle crop button click
                            document.getElementById('cropButton').onclick = function() {
                                const canvas = cropper.getCroppedCanvas({
                                    width: 200,
                                    height: 200,
                                    fillColor: '#fff',
                                    imageSmoothingQuality: 'high'
                                });

                                canvas.toBlob((blob) => {
                                    // Create new file from cropped blob
                                    const fileName = file.name;
                                    const croppedFile = new File([blob], fileName, {
                                        type: 'image/jpeg',
                                        lastModified: Date.now()
                                    });

                                    // Update file input
                                    const dataTransfer = new DataTransfer();
                                    dataTransfer.items.add(croppedFile);
                                    profileImageInput.files = dataTransfer.files;

                                    // Update preview
                                    const url = URL.createObjectURL(blob);
                                    if (!profilePreview) {
                                        profilePreview = document.createElement('img');
                                        profilePreview.className = 'profile-preview';
                                        profileImageSection.prepend(profilePreview);
                                    }
                                    profilePreview.src = url;

                                    // Cleanup
                                    modal.style.display = 'none';
                                    cropper.destroy();
                                    cropper = null;
                                }, 'image/jpeg');
                            };
                        };
                        reader.readAsDataURL(file);
                    }
                });
            }

            // Close modal when clicking outside
            window.onclick = function(event) {
                const modal = document.getElementById('cropModal');
                if (event.target === modal) {
                    modal.style.display = 'none';
                    if (cropper) {
                        cropper.destroy();
                        cropper = null;
                    }
                    profileImageInput.value = '';
                }
            };

            // Rest of your existing TinyMCE initialization code...
        });
    </script>
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
    </script>
    <script>
        // Initialize TinyMCE for skills and certifications




        @if (Auth::user()->profile_image)
            const img = new Image();
            img.src =
                "{{ asset('storage/app/public/profile_images/' . Auth::user()->profile_image) }}?{{ time() }}";
            img.onload = function() {
                if (profilePreview) {
                    profilePreview.src = this.src;
                }
            };
            img.onerror = function() {
                if (profilePreview) {
                    profilePreview.src = "{{ asset('images/default-avatar.png') }}";
                }
            };
        @endif
    </script>
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            // Common configuration for TinyMCE editors
            const editorConfig = {
                height: 300,
                menubar: false,
                plugins: [
                    'advlist', 'autolink', 'lists', 'link', 'charmap', 'preview',
                    'searchreplace', 'visualblocks', 'code', 'fullscreen',
                    'insertdatetime', 'table', 'code', 'help', 'wordcount'
                ],
                toolbar: 'undo redo | formatselect | ' +
                    'bold italic backcolor | alignleft aligncenter ' +
                    'alignright alignjustify | bullist numlist outdent indent | ' +
                    'removeformat | help',
                content_style: 'body { font-family:Helvetica,Arial,sans-serif; font-size:14px }',
                init_instance_callback: function(editor) {
                    // Set initial content from the editor div
                    const editorContainer = document.getElementById(editor.id);
                    editor.setContent(editorContainer.innerHTML);

                    // Update hidden input with initial content
                    const inputName = editor.id.replace('editor-', '');
                    const hiddenInput = document.querySelector(
                        `input[name="${inputName.replace('1', '')}"]`);
                    if (hiddenInput) {
                        hiddenInput.value = editor.getContent();
                    }
                },
                setup: function(editor) {
                    editor.on('change keyup', function() {
                        // Update the corresponding hidden input
                        const inputName = editor.id.replace('editor-', '');
                        const hiddenInput = document.querySelector(
                            `input[name="${inputName.replace('1', '')}"]`);
                        if (hiddenInput) {
                            hiddenInput.value = editor.getContent();
                        }
                    });
                }
            };

            // Initialize TinyMCE for title
            tinymce.init({
                ...editorConfig,
                selector: '#editor-title'
            });

            // Initialize TinyMCE for skills
            tinymce.init({
                ...editorConfig,
                selector: '#editor-skills'
            });

            // Initialize TinyMCE for certifications
            tinymce.init({
                ...editorConfig,
                selector: '#editor-certifications'
            });

            // Initialize TinyMCE for referees1
            tinymce.init({
                ...editorConfig,
                selector: '#editor-referees1'
            });

            // Initialize TinyMCE for referees2
            tinymce.init({
                ...editorConfig,
                selector: '#editor-referees2'
            });
        });
    </script>
</body>

</html>