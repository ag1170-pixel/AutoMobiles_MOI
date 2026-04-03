document.addEventListener('DOMContentLoaded', () => {
    const stateSelect = document.getElementById('state-select');
    const citySelect = document.getElementById('city-select');
    const searchInput = document.getElementById('search-input');
    const autocompleteDropdown = document.getElementById('autocomplete-dropdown');
    let debounceTimer;

    // State/City functionality
    stateSelect.addEventListener('change', function() {
        const state = this.value;

        // Clear city dropdown
        citySelect.innerHTML = '<option value="">Select City</option>';
        citySelect.disabled = !state;

        if (state) {
            // Fetch cities for selected state
            fetch(`/petrolstations/get_cities_by_state/?state=${encodeURIComponent(state)}`)
                .then(response => response.json())
                .then(data => {
                    citySelect.innerHTML = '<option value="">All Cities</option>';
                    data.forEach(function(city) {
                        const option = document.createElement('option');
                        option.value = city;
                        option.text = city;
                        citySelect.appendChild(option);
                    });
                    
                    // Restore selected city if it exists
                    const selectedCity = citySelect.dataset.selected || '';
                    if (selectedCity) {
                        citySelect.value = selectedCity;
                    }
                })
                .catch(error => {
                    console.error('Error fetching cities:', error);
                    citySelect.innerHTML = '<option value="">Error loading cities</option>';
                });
        } else {
            // Reset city selection when no state is selected
            citySelect.innerHTML = '<option value="">Select City</option>';
        }
    });

    // Autocomplete functionality
    searchInput.addEventListener('input', function() {
        const query = this.value.trim();
        
        // Clear previous timer
        clearTimeout(debounceTimer);
        
        if (query.length < 1) {
            hideAutocomplete();
            return;
        }
        
        // Debounce API call (300ms)
        debounceTimer = setTimeout(() => {
            fetchAutocompleteSuggestions(query);
        }, 300);
    });

    // Hide autocomplete when clicking outside
    document.addEventListener('click', function(e) {
        if (!searchInput.contains(e.target) && !autocompleteDropdown.contains(e.target)) {
            hideAutocomplete();
        }
    });

    // Hide autocomplete when pressing Escape
    searchInput.addEventListener('keydown', function(e) {
        if (e.key === 'Escape') {
            hideAutocomplete();
        }
    });

    function fetchAutocompleteSuggestions(query) {
        fetch(`/petrolstations/api/petrol-pump-autocomplete/?q=${encodeURIComponent(query)}`)
            .then(response => response.json())
            .then(data => {
                displayAutocompleteSuggestions(data.suggestions);
            })
            .catch(error => {
                console.error('Error fetching autocomplete suggestions:', error);
                hideAutocomplete();
            });
    }

    function displayAutocompleteSuggestions(suggestions) {
        if (!suggestions || suggestions.length === 0) {
            showNoResults();
            return;
        }

        let html = '';
        suggestions.forEach(suggestion => {
            html += `
                <div class="autocomplete-item" data-search="${suggestion.name}">
                    <div class="autocomplete-main">${suggestion.display_text}</div>
                    <div class="autocomplete-details">
                        ${suggestion.location ? `<span class="autocomplete-detail">${suggestion.location}</span>` : ''}
                        ${suggestion.state ? `<span class="autocomplete-detail">${suggestion.state}</span>` : ''}
                        ${suggestion.company_name ? `<span class="autocomplete-detail">${suggestion.company_name}</span>` : ''}
                    </div>
                </div>
            `;
        });

        autocompleteDropdown.innerHTML = html;
        autocompleteDropdown.style.display = 'block';

        // Add click handlers to suggestions
        const items = autocompleteDropdown.querySelectorAll('.autocomplete-item');
        items.forEach(item => {
            item.addEventListener('click', function() {
                const searchValue = this.getAttribute('data-search');
                searchInput.value = searchValue;
                hideAutocomplete();
                // Trigger form submission to perform the search
                searchInput.closest('form').submit();
            });
        });
    }

    function showNoResults() {
        autocompleteDropdown.innerHTML = `
            <div class="autocomplete-item autocomplete-no-results">
                <div class="autocomplete-main">No matching petrol pumps found</div>
                <div class="autocomplete-details">Try a different search term</div>
            </div>
        `;
        autocompleteDropdown.style.display = 'block';
    }

    function hideAutocomplete() {
        autocompleteDropdown.style.display = 'none';
        autocompleteDropdown.innerHTML = '';
    }
});
