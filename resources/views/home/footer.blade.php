<head>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>

<footer class="jobads-main-footer"
    style="background-color: #18799c; color: #fff; padding: 20px; text-align: center; border-radius: 50px 0 0 0;">
    <div class="jobads-footer-content"
        style="display: flex; justify-content: space-between; gap: 30px; max-width: 1200px; margin: 0 auto; flex-wrap: wrap;">
        <div class="jobads-footer-section" style="flex: 1; min-width: 250px; text-align: left;">
            <h3 style="font-size: 22px; font-weight: bold; margin-bottom: 15px; color: #fff;">About Us</h3>
            <p style="font-size: 16px; line-height: 1.6; color: #f0f0f0;">
                We are a leading job portal connecting talented individuals with top employers worldwide. Your career
                journey starts here.
            </p>
        </div>

        <div class="jobads-footer-section" style="flex: 1; min-width: 250px; text-align: left;">
            <div style="margin-left: 80px">
                <h3 style="font-size: 22px; font-weight: bold; margin-bottom: 15px; color: #fff;">Quick Links</h3>
                <ul style="padding: 0; list-style: none;">
                    <li style="margin-bottom: 10px;">
                        <a href="/" style="color: #f4f4f4; text-decoration: none; transition: color 0.3s;">
                            <i class="fa fa-chevron-right" style="margin-right: 10px; color: goldenrod;"></i>Home
                        </a>
                    </li>
                    <li style="margin-bottom: 10px;">
                        <a href="{{ route('faqs.home') }}"
                            style="color: #f4f4f4; text-decoration: none; transition: color 0.3s;">
                            <i class="fa fa-chevron-right" style="margin-right: 10px; color: goldenrod;"></i>FAQ
                        </a>
                    </li>
                    <li style="margin-bottom: 10px;">
                        <a href="privacy" style="color: #f4f4f4; text-decoration: none; transition: color 0.3s;">
                            <i class="fa fa-chevron-right" style="margin-right: 10px; color: goldenrod;"></i>Privacy
                            Policy
                        </a>
                    </li>
                    <li style="margin-bottom: 10px;">
                        <a href="{{ route('terms.index') }}"
                            style="color: #f4f4f4; text-decoration: none; transition: color 0.3s;">
                            <i class="fa fa-chevron-right" style="margin-right: 10px; color: goldenrod;"></i>Terms &
                            Conditions
                        </a>
                    </li>
                    <li style="margin-bottom: 10px;">
                        <a href="feedback" style="color: #f4f4f4; text-decoration: none; transition: color 0.3s;">
                            <i class="fa fa-chevron-right" style="margin-right: 10px; color: goldenrod;"></i>Add
                            Feedback
                        </a>
                    </li>
                    <li style="margin-bottom: 10px;">
                        <a href="{{ route('about-us.index') }}"
                            style="color: #f4f4f4; text-decoration: none; transition: color 0.3s;">
                            <i class="fa fa-chevron-right" style="margin-right: 10px; color: goldenrod;"></i>About Us
                        </a>
                    </li>
                </ul>
            </div>
        </div>

        @foreach ($contacts as $contact)
            <div class="jobads-footer-section" style="flex: 1; min-width: 50px; text-align: left;">
                <h3 style="font-size: 22px; font-weight: bold; margin-bottom: 15px; color: #fff;">Contact Us</h3>
                <ul style="padding: 0; list-style: none;">
                    <li style="margin-bottom: 12px; display: flex; align-items: center;">
                        <i class="fa fa-phone"
                            style="margin-right: 12px; color: goldenrod; width: 20px; text-align: center;"></i>
                        <a href="tel:{{ $contact->phone }}"
                            style="color: #f4f4f4; text-decoration: none; transition: color 0.3s;">
                            {{ $contact->phone }}
                        </a>
                    </li>
                    <li style="margin-bottom: 12px; display: flex; align-items: center;">
                        <i class="fa fa-envelope"
                            style="margin-right: 12px; color: goldenrod; width: 20px; text-align: center;"></i>
                        <a href="mailto:{{ $contact->email }}"
                            style="color: #f4f4f4; text-decoration: none; transition: color 0.3s;">
                            {{ $contact->email }}
                        </a>
                    </li>
                    <li style="margin-bottom: 12px; display: flex; align-items: center;padding-right:50px;">
                        <i class="fa fa-map-marker"
                            style="margin-right: 12px; color: goldenrod; width: 20px; text-align: center;"></i>
                        <a href="https://www.google.com/maps/place/{{ $contact->address }}" target="_blank"
                            rel="noopener noreferrer"
                            style="color: #f4f4f4; text-decoration: none; transition: color 0.3s;">
                            {{ $contact->address }}
                        </a>
                    </li>
                </ul>
            </div>
        @endforeach
    </div>

    <div class="jobads-footer-bottom"
        style="margin-top: 20px; padding-top: 15px; border-top: 1px solid rgba(255,255,255,0.2);">
        <p style="font-size: 14px; color: #f4f4f4; margin: 0;">
            <footer>
                All Rights Reserved. &copy; {{ date('Y') }} jobads.lk.
            </footer>
        </p>
    </div>
</footer>


<script>
    document.addEventListener('DOMContentLoaded', function() {
        const mainCategoryLinks = document.querySelectorAll('.main-category');
        const subcategoriesSection = document.getElementById('subcategories-section');
        const subcategoriesList = document.getElementById('subcategories-list');
        const selectedCategoryName = document.getElementById('selected-category-name');

        mainCategoryLinks.forEach(link => {
            link.addEventListener('click', function(e) {
                e.preventDefault();

                const categoryId = this.getAttribute('data-category-id');
                const categoryName = this.textContent.trim().split('\n')[0];

                // Set the category name
                selectedCategoryName.textContent = categoryName;

                // Fetch subcategories via AJAX
                fetch(/categories/${categoryId}/subcategories)
                    .then(response => response.json())
                    .then(data => {
                        // Clear existing subcategories
                        subcategoriesList.innerHTML = '';

                        if (data.subcategories.length > 0) {
                            data.subcategories.forEach((subcategory, index) => {
                                const subcategoryLink = document.createElement('a');
                                subcategoryLink.href = '#';
                                subcategoryLink.className = `subcategory-card block p-5
                                    bg-gray-100 text-gray-800
                                    rounded-xl
                                    transition-all duration-300
                                    hover:bg-blue-100 hover:text-blue-900
                                    hover:shadow-lg
                                    subcategory-enter`;
                                subcategoryLink.style.animationDelay =
                                    ${index * 100}ms;
                                subcategoryLink.innerHTML = `
                                    <div class="text-center">
                                        <span class="font-bold block mb-2">${subcategory.name}</span>
                                        <span class="text-sm text-gray-600">
                                            ${subcategory.jobs_count ?? '0'} Jobs
                                        </span>
                                    </div>
                                `;
                                subcategoryLink.setAttribute('data-subcategory-id',
                                    subcategory.id);

                                subcategoriesList.appendChild(subcategoryLink);
                            });
                        } else {
                            const noSubcategoriesMsg = document.createElement('p');
                            noSubcategoriesMsg.textContent = 'No subcategories available.';
                            noSubcategoriesMsg.className =
                                'text-center text-blue-500 col-span-full py-10 text-xl';
                            subcategoriesList.appendChild(noSubcategoriesMsg);
                        }

                        // Show the subcategories section with animation
                        subcategoriesSection.classList.remove('hidden');
                        subcategoriesSection.classList.add('block');

                        // Smooth scroll to subcategories
                        subcategoriesSection.scrollIntoView({
                            behavior: 'smooth',
                            block: 'start'
                        });
                    })
                    .catch(error => {
                        console.error('Error fetching subcategories:', error);
                        const errorMsg = document.createElement('p');
                        errorMsg.textContent =
                            'Failed to load subcategories. Please try again.';
                        errorMsg.className =
                            'text-center text-red-500 col-span-full py-10 text-xl';
                        subcategoriesList.appendChild(errorMsg);
                        subcategoriesSection.classList.remove('hidden');
                        subcategoriesSection.classList.add('block');
                    });
            });
        });
    });
</script>
<script>
    document.addEventListener('DOMContentLoaded', function() {
        const categoryLinks = document.querySelectorAll('.category-link');
        const jobListingsContainer = document.getElementById('job-listings');
        const searchInput = document.getElementById('search-input'); // Add this input for keyword search

        let currentCategoryId = null; // Track the currently selected category ID

        // Function to fetch and display jobs
        function fetchAndDisplayJobs(categoryId, keyword = '') {
            // Show loading message
            jobListingsContainer.innerHTML = '<p>Loading jobs...</p>';

            // Fetch jobs for the selected category and keyword
            fetch(/jobs/category/${categoryId}?keyword=${encodeURIComponent(keyword)})
                .then((response) => {
                    if (!response.ok) {
                        throw new Error('Network response was not ok');
                    }
                    return response.json();
                })
                .then((jobs) => {
                    // Clear the loading message
                    jobListingsContainer.innerHTML = '';

                    if (jobs.length > 0) {
                        // Display the job count above the table
                        const jobCountTitle = <h3>Available Jobs (${jobs.length})</h3>;
                        // Create a table structure
                        const table = `
                            <div class="table-container"> <!-- Scrollable container -->
                                <table class="job-table">
                                    <thead>
                                        <tr>
                                            <th>#</th>
                                            <th>Reference Number</th>
                                            <th>Job Title</th>
                                            <th>Description</th>
                                            <th>Location</th>
                                            <th>Posted Date</th>
                                            <th>Closing Date</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        ${jobs
                                            .map(
                                                (job, index) => `
                                                <tr>
                                                    <td>${index + 1}</td> <!-- Row Number -->
                                                    <td>${job.job_id || 'N/A'}</td> <!-- Reference Number -->
                                                    <td>
                                                        <a href="/jobs/${job.id}" class="job-title">
                                                            ${job.title}
                                                        </a>
                                                        <br>
                                                        <a href="/jobs/${job.id}" class="company-name">
                                                            ${job.employer.company_name}
                                                        </a>
                                                    </td>
                                                    <td>${job.description || 'No description provided'}</td>
                                                    <td>${job.location || 'Not specified'}</td>
                                                    <td>
                                                        ${job.created_at
                                                            ? ${new Date(job.created_at).toISOString().split('T')[0]}
                                                            : 'N/A'}
                                                    </td>
                                                    <td>${job.closing_date || 'N/A'}</td>
                                                </tr>
                                            `
                                            )
                                            .join('')}
                                    </tbody>
                                </table>
                            </div>
                        `;
                        jobListingsContainer.innerHTML = jobCountTitle + table;
                    } else {
                        jobListingsContainer.innerHTML =
                            '<p>No jobs found matching your criteria.</p>';
                    }
                })
                .catch((error) => {
                    console.error('Error fetching jobs:', error);
                    jobListingsContainer.innerHTML =
                        '<p>Failed to load jobs. Please try again later.</p>';
                });
        }

        // Category selection logic
        categoryLinks.forEach((link) => {
            link.addEventListener('click', function(event) {
                event.preventDefault(); // Prevent default link behavior
                const categoryId = this.getAttribute('data-category-id');
                currentCategoryId = categoryId; // Update the current category ID
                fetchAndDisplayJobs(categoryId); // Fetch jobs for the selected category
            });
        });

        // Keyword search logic
        searchInput.addEventListener('input', function() {
            const keyword = this.value.trim(); // Get the keyword from the input field
            if (currentCategoryId) {
                fetchAndDisplayJobs(currentCategoryId, keyword); // Fetch jobs with the keyword filter
            }
        });
    });
</script>
