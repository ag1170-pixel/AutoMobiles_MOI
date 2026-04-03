// Vehicle type selection
let currentVehicleType = 'car';

function selectVehicleType(type, event) {
    currentVehicleType = type;
    updateBudgetOptions();
    updateCategoryOptions();
    // Reset other dropdowns
    document.getElementById('name').innerHTML = '<option value="">Select Name</option>';
    document.getElementById('model').innerHTML = '<option value="">Select Model</option>';

    // Update active button only if event is provided (for programmatic calls)
    if (event) {
        document.querySelectorAll('.btn-group .btn').forEach(btn => {
            btn.classList.remove('active');
        });
        event.target.classList.add('active');
    }
}

function updateSearchType() {
    const byBudget = document.getElementById('byBudget').checked;
    document.getElementById('budgetForm').style.display = byBudget ? 'block' : 'none';
    document.getElementById('brandForm').style.display = byBudget ? 'none' : 'block';
}

function updateBudgetOptions() {
    const budgetRange = document.getElementById('budgetRange');
    budgetRange.innerHTML = '<option value="">Select Budget Range</option>';

    if (currentVehicleType === 'car') {
        const carOptions = [
            {value: '0-2', text: '0 - 2 Lakh'},
            {value: '2-5', text: '2 - 5 Lakh'},
            {value: '5-10', text: '5 - 10 Lakh'},
            {value: '10-20', text: '10 - 20 Lakh'},
            {value: '20-50', text: '20 - 50 Lakh'},
            {value: '50-100', text: '50 Lakh - 1 Crore'},
            {value: '100+', text: 'Above 1 Crore'}
        ];
        carOptions.forEach(option => {
            const opt = document.createElement('option');
            opt.value = option.value;
            opt.textContent = option.text;
            budgetRange.appendChild(opt);
        });
    } else {
        // Bike options
        // ... (similar to car options)
    }
}

function updateCategoryOptions() {
    const budgetCategory = document.getElementById('budgetCategory');
    const brandCategory = document.getElementById('brandCategory');
    budgetCategory.innerHTML = '<option value="">Select Company</option>';
    brandCategory.innerHTML = '<option value="">Select Company</option>';

    // Fetch categories based on currentVehicleType
    fetch(`/${currentVehicleType}s/get_categories/`)
        .then(response => {
            if (!response.ok) {
                throw new Error(`HTTP error! status: ${response.status}`);
            }
            return response.json();
        })
        .then(data => {
            data.forEach(cat => {
                const option1 = document.createElement('option');
                const option2 = document.createElement('option');
                option1.value = cat;
                option1.textContent = cat;
                option2.value = cat;
                option2.textContent = cat;
                budgetCategory.appendChild(option1);
                brandCategory.appendChild(option2);
            });
        })
        .catch(error => {
            console.error('Error fetching categories:', error);
            // Optionally show user-friendly error message
        });
}

// Event listeners
document.getElementById('brandCategory').addEventListener('change', function() {
    const category = this.value;
    const nameSelect = document.getElementById('name');
    const modelSelect = document.getElementById('model');

    nameSelect.innerHTML = '<option value="">Select Name</option>';
    modelSelect.innerHTML = '<option value="">Select Model</option>';

    fetch(`/${currentVehicleType}s/get_names/?category=${category}`)
        .then(response => {
            if (!response.ok) {
                throw new Error(`HTTP error! status: ${response.status}`);
            }
            return response.json();
        })
        .then(data => {
            data.forEach(name => {
                const option = document.createElement('option');
                option.value = name;
                option.textContent = name;
                nameSelect.appendChild(option);
            });
        })
        .catch(error => {
            console.error('Error fetching names:', error);
            // Optionally show user-friendly error message
        });
});

document.getElementById('name').addEventListener('change', function() {
    const category = document.getElementById('brandCategory').value;
    const name = this.value;
    const modelSelect = document.getElementById('model');

    modelSelect.innerHTML = '<option value="">Select Model</option>';

    fetch(`/${currentVehicleType}s/get_models/?category=${category}&name=${name}`)
        .then(response => {
            if (!response.ok) {
                throw new Error(`HTTP error! status: ${response.status}`);
            }
            return response.json();
        })
        .then(data => {
            data.forEach(model => {
                const option = document.createElement('option');
                option.value = model;
                option.textContent = model;
                modelSelect.appendChild(option);
            });
        })
        .catch(error => {
            console.error('Error fetching models:', error);
            // Optionally show user-friendly error message
        });
});

function search() {
    const searchType = document.getElementById('byBudget').checked ? 'budget' : 'brand';
    let searchParams = {
        vehicleType: currentVehicleType,
        searchType: searchType
    };

    if (searchType === 'budget') {
        searchParams.budget = document.getElementById('budgetRange').value;
        searchParams.company = document.getElementById('budgetCategory').value;
    } else {
        searchParams.company = document.getElementById('brandCategory').value;
        searchParams.name = document.getElementById('name').value;
        searchParams.model = document.getElementById('model').value;
    }

    console.log('Searching with params:', searchParams);
    // Implement actual search functionality here
}

// Initialize the form
selectVehicleType('car');
updateSearchType();

// Petrol Pump Search
document.getElementById('state-select').addEventListener('change', function() {
    var state = this.value;
    var citySelect = document.getElementById('city-select');

    fetch(`cars/get_cities/?state=${state}`)
        .then(response => {
            if (!response.ok) {
                throw new Error(`HTTP error! status: ${response.status}`);
            }
            return response.json();
        })
        .then(data => {
            citySelect.innerHTML = '<option selected="true" disabled="disabled">Select City</option>';
            data.forEach(function(city) {
                var option = document.createElement('option');
                option.value = city;
                option.text = city;
                citySelect.appendChild(option);
            });
        })
        .catch(error => {
            console.error('Error fetching cities:', error);
            // Optionally show user-friendly error message
        });
});

// Car Comparison
function updateNames(categoryId, nameId, modelId) {
    var category = document.getElementById(categoryId).value;
    var nameSelect = document.getElementById(nameId);
    var modelSelect = document.getElementById(modelId);

    nameSelect.innerHTML = '<option selected="true" disabled="disabled">Name</option>';
    modelSelect.innerHTML = '<option selected="true" disabled="disabled">Model</option>';

    fetch(`/cars/get_names/?category=${category}`)
        .then(response => {
            if (!response.ok) {
                throw new Error(`HTTP error! status: ${response.status}`);
            }
            return response.json();
        })
        .then(data => {
            data.forEach(function(name) {
                var option = document.createElement('option');
                option.value = name;
                option.text = name;
                nameSelect.appendChild(option);
            });
        })
        .catch(error => console.error('Error fetching names:', error));
}

function updateModels(categoryId, nameId, modelId) {
    var category = document.getElementById(categoryId).value;
    var name = document.getElementById(nameId).value;
    var modelSelect = document.getElementById(modelId);

    modelSelect.innerHTML = '<option selected="true" disabled="disabled">Model</option>';

    fetch(`/cars/get_models/?category=${category}&name=${name}`)
        .then(response => {
            if (!response.ok) {
                throw new Error(`HTTP error! status: ${response.status}`);
            }
            return response.json();
        })
        .then(data => {
            data.forEach(function(model) {
                var option = document.createElement('option');
                option.value = model;
                option.text = model;
                modelSelect.appendChild(option);
            });
        })
        .catch(error => console.error('Error fetching models:', error));
}

// Event listeners for car comparison
document.getElementById('car-category1').addEventListener('change', function() {
    updateNames('car-category1', 'car-name1', 'car-model1');
});

document.getElementById('car-name1').addEventListener('change', function() {
    updateModels('car-category1', 'car-name1', 'car-model1');
});

document.getElementById('car-category2').addEventListener('change', function() {
    updateNames('car-category2', 'car-name2', 'car-model2');
});

document.getElementById('car-name2').addEventListener('change', function() {
    updateModels('car-category2', 'car-name2', 'car-model2');
});