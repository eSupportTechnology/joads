        <div class="col-12">
            <div class="card shadow-sm">
                <div class="card-header bg-primary text-white d-flex justify-content-between align-items-center">
                    <h5 class="mb-0">Companies Statistics</h5>
                    <div class="d-flex align-items-center gap-2">
                        <input 
                            type="text" 
                            id="searchInput" 
                            class="form-control form-control-sm" 
                            placeholder="Search Company..." 
                            style="width: 300px;" 
                            onkeyup="filterAccordion()"
                        >
                        <button 
                            id="toggleSectionButton" 
                            class="btn btn-light btn-sm" 
                            onclick="toggleSection()">
                            Expand
                        </button>
                    </div>
                </div>
                <div id="companyStatsSection" class="card-body collapse">
                    <div class="accordion" id="companyStatsAccordion">
                        @forelse ($companyStats as $company)
                            <div class="accordion-item">
                                <h2 class="accordion-header" id="heading{{ $company->id }}">
                                    <button 
                                        class="accordion-button collapsed" 
                                        type="button" 
                                        data-bs-toggle="collapse" 
                                        data-bs-target="#collapse{{ $company->id }}" 
                                        aria-expanded="false" 
                                        aria-controls="collapse{{ $company->id }}">
                                        {{ $company->company_name }}
                                    </button>
                                </h2>
                                <div 
                                    id="collapse{{ $company->id }}" 
                                    class="accordion-collapse collapse" 
                                    aria-labelledby="heading{{ $company->id }}" 
                                    data-bs-parent="#companyStatsAccordion"
                                    >
                                    <div class="accordion-body p-0">
                                        <table class="table table-sm table-striped mb-0">
                                            <thead>
                                                <tr>
                                                    <th> Job Title</th>
                                                    <th> Total Views</th>
                                                    <th> Today's Views</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                @if ($company->jobPostings->isNotEmpty())
                                                    @foreach ($company->jobPostings as $job)
                                                        <tr>
                                                            <td>{{ $job->title }}</td>
                                                            <td>{{ number_format($job->view_count ?? 0) }}</td>
                                                            <td>{{ number_format($job->today_views ?? 0) }}</td>
                                                        </tr>
                                                    @endforeach
                                                @else
                                                    <tr>
                                                        <td colspan="3" class="text-center">No Job Posts</td>
                                                    </tr>
                                                @endif
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        @empty
                            <p class="text-center mb-0">No Data Available</p>
                        @endforelse
                    </div>
                </div>
            </div>
        </div>
