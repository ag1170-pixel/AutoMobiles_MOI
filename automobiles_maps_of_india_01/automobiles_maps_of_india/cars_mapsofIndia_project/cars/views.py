from django.shortcuts import render, get_object_or_404
from .models import Car,PetrolPump
from django.core.paginator import EmptyPage, PageNotAnInteger, Paginator
from django.http import JsonResponse, HttpResponse
from django.views.decorators.csrf import csrf_exempt
from django.utils.decorators import method_decorator
from django.shortcuts import render, redirect
# from .forms import CSVUploadForm
# import csv
from io import TextIOWrapper
from .models import Car, PetrolPump
from django.contrib import messages
from django.core.cache import caches
from django.views.decorators.cache import cache_page
from utils.budget_filter import apply_budget_filter
from images.models import DynamicImage


def test_image_display(request):
    """Test view to verify image display functionality"""
    from cars.models import Car
    eco_cars = Car.objects.filter(category='FORD', name='EcoSport')
    
    context = {
        'eco_cars': eco_cars,
    }
    return render(request, 'test_image_display.html', context)


def test_images(request):
    """Test page to display database images"""
    cars = Car.objects.all()[:4]  # Get first 4 cars
    default_images = DynamicImage.objects.filter(page_reference='general', is_active=True)[:4]
    
    context = {
        'cars': cars,
        'default_images': default_images,
    }
    return render(request, 'test_images.html', context)


def cars(request):
    
    category_search = list(Car.objects.values_list('category', flat=True).distinct())
    
    category = request.GET.get('category')
    name = request.GET.get('name')
    model = request.GET.get('model')
    brand = request.GET.get('brand')
    
    # Build query with select_related and prefetch_related for optimization
    cars_query = Car.objects.all()
    
    if category:
        cars_query = cars_query.filter(category=category)
    if name:
        cars_query = cars_query.filter(name=name)
    if model:
        cars_query = cars_query.filter(model=model)
    if brand:
        # Normalize brand input: case-insensitive and space-trimmed
        normalized_brand = brand.strip().lower()
        
        # Handle common brand aliases and normalize to match database values
        brand_mapping = {
            'audi': ['audi'],
            'bmw': ['bmw'],
            'mercedes': ['mercedes', 'mercedes-benz'],
            'toyota': ['toyota'],
            'honda': ['honda'],
            'hyundai': ['hyundai'],
            'maruti': ['maruti', 'maruti suzuki'],
            'tata': ['tata', 'tata motors'],
            'mahindra': ['mahindra'],
            'nissan': ['nissan'],
            'skoda': ['skoda'],
            'volkswagen': ['volkswagen', 'vw'],
            'volvo': ['volvo'],
            'ford': ['ford'],
            'fiat': ['fiat'],
            'porsche': ['porsche'],
            'bentley': ['bentley'],
            'rolls royce': ['rolls royce'],
            'land rover': ['land rover'],
            'general motors': ['general motors', 'gm'],
            'maxus': ['maxus', 'saic maxus', 'maxus motors'],
        }
        
        # Find matching database values for this brand
        matching_categories = []
        for db_brand, aliases in brand_mapping.items():
            if normalized_brand in [alias.lower() for alias in aliases]:
                # Get all case variations from database
                all_variations = Car.objects.filter(category__icontains=db_brand).values_list('category', flat=True).distinct()
                matching_categories.extend(all_variations)
                break
        
        if matching_categories:
            # Filter using all matching case variations
            from django.db.models import Q
            brand_query = Q()
            for cat in matching_categories:
                brand_query |= Q(category__iexact=cat.strip())
            cars_query = cars_query.filter(brand_query)
        else:
            # No matching brand found - return empty queryset
            cars_query = cars_query.none()
        
        
    # Use select_related for foreign keys if any, and order by id for consistent pagination
    cars_query = cars_query.select_related().order_by('id')
    
    paginator = Paginator(cars_query, 6)
    page_number = request.GET.get('page')
    page_obj = paginator.get_page(page_number)

    max_pages = 5
    current_page = page_obj.number
    page_range = range(max(1, current_page - max_pages),
                       min(paginator.num_pages, current_page + max_pages) + 1)

    # Cache names and models for selected category
    name_options = []
    model_options = []
    
    if category:
        name_options = list(Car.objects.filter(category=category).values_list('name', flat=True).distinct())
    
    if category and name:
        model_options = list(Car.objects.filter(category=category, name=name).values_list('model', flat=True).distinct())

    context = {
        'page_obj': page_obj,
        'page_range': page_range,
        'category_search': category_search,
        'name_options': name_options,
        'model_options': model_options,
        'selected_category': category,
        'selected_name': name,
        'selected_model': model,
        'selected_brand': brand,
    }
    
    return render(request, 'cars/cars.html', context)


def car_detail(request, id=None, category=None, name=None, model=None):
    if id:
        single_car = get_object_or_404(Car, pk=id)
    elif category and name and model:
        single_car = get_object_or_404(
            Car, category__iexact=category,
            name__iexact=name,
            model__iexact=model
        )
    else:
        return render(request, '404.html', status=404)  # or raise Http404

    data = {'single_car': single_car}
    return render(request, 'cars/car_detail.html', data)


def car_detail_seo(request, slug):
    """SEO-friendly car detail view using slug"""
    single_car = get_object_or_404(Car, slug=slug)
    data = {'single_car': single_car}
    return render(request, 'cars/car_detail.html', data)


def cars_by_brand(request, brand_slug):
    """Cars filtered by brand with SEO-friendly URL"""
    # Convert slug to manufacturer code
    # Map common brand names to manufacturer codes
    brand_mapping = {
        'audi': 'AUDI',
        'bmw': 'BMW', 
        'mercedes': 'MB',
        'mercedes-benz': 'MB',
        'toyota': 'TO',
        'honda': 'HO',
        'hyundai': 'HY',
        'maruti': 'MA',
        'tata': 'TA',
        'nissan': 'NI',
        'volkswagen': 'VW',
        'skoda': 'SK',
        'general-motors': 'GM',
        'gm': 'GM',
        'land-rover': 'LR',
        'jaguar': 'JAGUAR',
    }
    
    # Try to find manufacturer code from slug
    manufacturer_code = brand_mapping.get(brand_slug.lower(), brand_slug.upper())
    
    # Filter by manufacturer
    cars_query = Car.objects.filter(manufacturer=manufacturer_code)
    
    # Use pagination
    paginator = Paginator(cars_query, 6)
    page_number = request.GET.get('page')
    page_obj = paginator.get_page(page_number)
    
    # Create page range
    max_pages = 5
    current_page = page_obj.number
    page_range = range(max(1, current_page - max_pages),
                       min(paginator.num_pages, current_page + max_pages) + 1)
    
    # Get manufacturer name for display
    manufacturer_choices = dict(Car.MANUFACTURER_CHOICES)
    manufacturer_name = manufacturer_choices.get(manufacturer_code, manufacturer_code)
    
    context = {
        'page_obj': page_obj,
        'page_range': page_range,
        'current_brand': manufacturer_name,
        'brand_slug': brand_slug,
    }
    return render(request, 'cars/cars_by_brand.html', context)


def cars_by_brand_model(request, brand_slug, model_slug):
    """Cars filtered by brand and model with SEO-friendly URL"""
    # Convert slug to manufacturer code
    brand_mapping = {
        'audi': 'AUDI',
        'bmw': 'BMW', 
        'mercedes': 'MB',
        'mercedes-benz': 'MB',
        'toyota': 'TO',
        'honda': 'HO',
        'hyundai': 'HY',
        'maruti': 'MA',
        'tata': 'TA',
        'nissan': 'NI',
        'volkswagen': 'VW',
        'skoda': 'SK',
        'general-motors': 'GM',
        'gm': 'GM',
        'land-rover': 'LR',
        'jaguar': 'JAGUAR',
    }
    
    # Try to find manufacturer code from slug
    manufacturer_code = brand_mapping.get(brand_slug.lower(), brand_slug.upper())
    model_name = model_slug.replace('-', ' ').title()
    
    # Filter by manufacturer and model
    cars_query = Car.objects.filter(manufacturer=manufacturer_code, name__iexact=model_name)
    
    # Use pagination
    paginator = Paginator(cars_query, 6)
    page_number = request.GET.get('page')
    page_obj = paginator.get_page(page_number)
    
    # Create page range
    max_pages = 5
    current_page = page_obj.number
    page_range = range(max(1, current_page - max_pages),
                       min(paginator.num_pages, current_page + max_pages) + 1)
    
    # Get manufacturer name for display
    manufacturer_choices = dict(Car.MANUFACTURER_CHOICES)
    manufacturer_name = manufacturer_choices.get(manufacturer_code, manufacturer_code)
    
    context = {
        'page_obj': page_obj,
        'page_range': page_range,
        'current_brand': manufacturer_name,
        'current_model': model_name,
        'brand_slug': brand_slug,
        'model_slug': model_slug,
    }
    return render(request, 'cars/cars_by_brand_model.html', context)


def compare_cars(request):
    category1 = request.GET.get('category1')
    name1 = request.GET.get('name1')
    model1 = request.GET.get('model1')
    category2 = request.GET.get('category2')
    name2 = request.GET.get('name2')
    model2 = request.GET.get('model2')

    category_search = Car.objects.values_list('category', flat=True).distinct()

    # Load default cars if required query params are missing
    if not all([category1, name1, model1, category2, name2, model2]):
        default_cars = Car.objects.all().order_by('id')[:2]
        if len(default_cars) >= 2:
            car1 = default_cars[0]
            car2 = default_cars[1]
        elif len(default_cars) == 1:
            car1 = default_cars[0]
            car2 = None
        else:
            car1 = None
            car2 = None
    else:
        car1 = Car.objects.filter(category__iexact=category1, name__iexact=name1, model__iexact=model1).first()
        car2 = Car.objects.filter(category__iexact=category2, name__iexact=name2, model__iexact=model2).first()

    # Only calculate percentages if both cars exist
    if car1 and car2:
        # Ensure image fields are properly handled
        if not hasattr(car1, 'image') or not car1.image:
            car1.image = None
        if not hasattr(car2, 'image') or not car2.image:
            car2.image = None
            
        # Price percentages
        max_price = max(car1.price, car2.price)
        car1.price_percentage = (car1.price / max_price) * 100 if max_price else 0
        car2.price_percentage = (car2.price / max_price) * 100 if max_price else 0
        car1.price_inverse = 100 - car1.price_percentage
        car2.price_inverse = 100 - car2.price_percentage
        
        # Fuel economy percentages (convert string to float for comparison)
        try:
            car1_fuel = float(car1.fuel_economy) if car1.fuel_economy else 0
            car2_fuel = float(car2.fuel_economy) if car2.fuel_economy else 0
            max_fuel = max(car1_fuel, car2_fuel)
            car1.economy_percentage = (car1_fuel / max_fuel) * 100 if max_fuel else 0
            car2.economy_percentage = (car2_fuel / max_fuel) * 100 if max_fuel else 0
        except (ValueError, TypeError):
            car1.economy_percentage = 50
            car2.economy_percentage = 50
        
        # Speed percentages (convert string to float for comparison)
        try:
            car1_speed = float(car1.top_speed) if car1.top_speed else 0
            car2_speed = float(car2.top_speed) if car2.top_speed else 0
            max_speed = max(car1_speed, car2_speed)
            car1.speed_percentage = (car1_speed / max_speed) * 100 if max_speed else 0
            car2.speed_percentage = (car2_speed / max_speed) * 100 if max_speed else 0
        except (ValueError, TypeError):
            car1.speed_percentage = 50
            car2.speed_percentage = 50
            
        # Overall score (simple calculation based on price, fuel economy, and speed)
        car1.overall_score = (100 - car1.price_percentage) + car1.economy_percentage + car1.speed_percentage
        car2.overall_score = (100 - car2.price_percentage) + car2.economy_percentage + car2.speed_percentage
        
        # Add aliases for template compatibility
        car1.fueleconomy = car1.fuel_economy
        car2.fueleconomy = car2.fuel_economy
        car1.speed = car1.top_speed
        car2.speed = car2.top_speed
        car1.ground = car1.ground_clearance
        car2.ground = car2.ground_clearance
        car1.type = car1.vehicle_type
        car2.type = car2.vehicle_type
        car1.bags = car1.airbags
        car2.bags = car2.airbags
        car1.belt = car1.seat_belts
        car2.belt = car2.seat_belts
    else:
        # Set default values if cars are not found
        if car1:
            car1.price_percentage = 100
            car1.price_inverse = 0
            car1.economy_percentage = 50
            car1.speed_percentage = 50
            car1.overall_score = 50
            # Add aliases
            car1.fueleconomy = car1.fuel_economy
            car1.speed = car1.top_speed
            car1.ground = car1.ground_clearance
            car1.type = car1.vehicle_type
            car1.bags = car1.airbags
            car1.belt = car1.seat_belts
        if car2:
            car2.price_percentage = 100
            car2.price_inverse = 0
            car2.economy_percentage = 50
            car2.speed_percentage = 50
            car2.overall_score = 50
            # Add aliases
            car2.fueleconomy = car2.fuel_economy
            car2.speed = car2.top_speed
            car2.ground = car2.ground_clearance
            car2.type = car2.vehicle_type
            car2.bags = car2.airbags
            car2.belt = car2.seat_belts


    data = {
        'car1': car1,
        'car2': car2,
        'category_search': category_search,
        'default_car_images': DynamicImage.objects.filter(page_reference='general', is_active=True),
    }
    return render(request, 'cars/compare.html', data)


@cache_page(60 * 15)  # Cache for 15 minutes
def get_categories(request):
    cache_key = 'car_categories_api'
    categories = caches['default'].get(cache_key)
    
    if not categories:
        categories = list(Car.objects.values_list('category', flat=True).distinct())
        caches['default'].set(cache_key, categories, 3600)  # Cache for 1 hour
    else:
        categories = list(categories)  # Convert from cached list to list for JSON response
        
    return JsonResponse(categories, safe=False)

@cache_page(60 * 30)  # Cache for 30 minutes
def get_cities(request):
    state = request.GET.get('state')
    cache_key = f'cities_{state}'
    cities = caches['default'].get(cache_key)
    
    if not cities:
        cities = list(PetrolPump.objects.filter(state=state).values_list('location', flat=True).distinct())
        caches['default'].set(cache_key, cities, 1800)  # Cache for 30 minutes
    else:
        cities = list(cities)
        
    return JsonResponse(cities, safe=False)

@cache_page(60 * 30)  # Cache for 30 minutes
def get_names(request):
    category = request.GET.get('category')
    cache_key = f'car_names_{category}'
    names = caches['default'].get(cache_key)
    
    if not names:
        names = list(Car.objects.filter(category=category).values_list('name',flat=True).distinct())
        caches['default'].set(cache_key, names, 1800)  # Cache for 30 minutes
    else:
        names = list(names)
        
    return JsonResponse(names,safe=False)

@cache_page(60 * 30)  # Cache for 30 minutes
def get_models(request):
    category = request.GET.get('category')
    name = request.GET.get('name')
    cache_key = f'car_models_{category}_{name}'
    models = caches['default'].get(cache_key)
    
    if not models:
        models = list(Car.objects.filter(category=category,name=name).values_list('model',flat=True).distinct())
        caches['default'].set(cache_key, models, 1800)  # Cache for 30 minutes
    else:
        models = list(models)
        
    return JsonResponse(models,safe=False)

@csrf_exempt
def search(request):
    vehicle_type = request.GET.get('vehicleType', 'car')  # Default to car
    
    if vehicle_type == 'bike':
        # Redirect to bike search
        from bikes.views import search_Bikes
        return search_Bikes(request)
    
    # Original car search logic
    if request.method == 'GET':
        keyword = request.GET.get('keyword', '').strip()
        category = request.GET.get('category', '') or request.GET.get('brand', '')
        name = request.GET.get('name', '') or request.GET.get('model', '')
        model = request.GET.get('model', '') or request.GET.get('variant', '')
        budget_range = request.GET.get('budgetRange', '')

        cars = Car.objects.all()
        
        # Handle keyword search - search across multiple fields
        if keyword:
            from django.db.models import Q
            cars = cars.filter(
                Q(name__icontains=keyword) |
                Q(model__icontains=keyword) |
                Q(category__icontains=keyword) |
                Q(manufacturer__icontains=keyword)
            )
        else:
            # Original filtering logic for specific parameters
            if category:
                cars = cars.filter(category__iexact=category)
            if name:
                cars = cars.filter(name__icontains=name)
            if model:
                cars = cars.filter(model__icontains=model)

        if budget_range:
            cars = apply_budget_filter(cars, budget_range, vehicle_type='car')

        # Get additional context data for search template
        category_search = Car.objects.values_list('category', flat=True).distinct()
        name_options = []
        model_options = []
        
        if category:
            name_options = Car.objects.filter(category=category).values_list('name', flat=True).distinct()
        if category and name:
            model_options = Car.objects.filter(category=category, name=name).values_list('model', flat=True).distinct()

        # Create pagination
        paginator = Paginator(cars, 6)
        page_number = request.GET.get('page')
        page_obj = paginator.get_page(page_number)

        max_pages = 5
        current_page = page_obj.number
        page_range = range(max(1, current_page - max_pages),
                           min(paginator.num_pages, current_page + max_pages) + 1)

        context = {
            'cars': page_obj,
            'category_search': category_search,
            'name_options': name_options,
            'model_options': model_options,
            'page_obj': page_obj,
            'page_range': page_range,
            'selected_category': category,
            'selected_name': name,
            'selected_model': model,
            'selected_budget_range': budget_range,
            'search_keyword': keyword,  # Add keyword to context
        }

        return render(request, 'cars/search.html', context)

    elif request.method == 'POST':
        keyword = request.POST.get('keyword', '').strip()
        category = request.POST.get('category', '')
        name = request.POST.get('name', '')
        model = request.POST.get('model', '')
        budget_range = request.POST.get('budgetRange', '')

        cars = Car.objects.all()
        
        # Handle keyword search - search across multiple fields
        if keyword:
            from django.db.models import Q
            cars = cars.filter(
                Q(name__icontains=keyword) |
                Q(model__icontains=keyword) |
                Q(category__icontains=keyword) |
                Q(manufacturer__icontains=keyword)
            )
        else:
            # Original filtering logic for specific parameters
            if category:
                cars = cars.filter(category__iexact=category)
            if name:
                cars = cars.filter(name__icontains=name)
            if model:
                cars = cars.filter(model__icontains=model)

        if budget_range:
            # Apply proper budget filtering using shared utility
            cars = apply_budget_filter(cars, budget_range, vehicle_type='car')

        category_search = Car.objects.values_list('category', flat=True).distinct()

        return JsonResponse({
            'cars': list(cars.values('id', 'category', 'name', 'model', 'price', 'image', 'manufac_place')),
            'category_search': list(category_search),
        })

