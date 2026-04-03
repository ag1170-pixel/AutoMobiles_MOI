from django.shortcuts import render, get_object_or_404
from django.http import HttpResponseRedirect
from django.urls import reverse
from django.db.models import Q
from django.core.paginator import Paginator, EmptyPage
from django.shortcuts import redirect
from .test_views import debug_bike_images
import os

# Create your views here.

def debug_bike_images(request):
    """Debug view to check bike images directly"""
    print("=== DEBUG: Bike Image Check ===")
    
    # Get all bikes
    all_bikes = Bike.objects.all()
    print(f"Total bikes in database: {all_bikes.count()}")
    
    # Check image distribution
    from collections import Counter
    image_list = [str(bike.image) for bike in all_bikes if bike.image]
    image_counts = Counter(image_list)
    
    print("Image distribution:")
    for img, count in image_counts.most_common():
        print(f"  {img}: {count} bikes")
    
    # Get specific bikes to test
    test_bikes = ['Harley-Davidson', 'Kawasaki', 'Honda', 'KTM']
    
    bike_details = []
    for bike_name in test_bikes:
        bikes = Bike.objects.filter(Bikename__icontains=bike_name)
        for bike in bikes:
            detail = {
                'name': f"{bike.Bikename} {bike.Bikemodel}",
                'image_field': str(bike.image),
                'image_url': bike.image.url if bike.image else None,
                'file_exists': bike.image and os.path.exists(bike.image.path) if bike.image else False,
                'template_should_show': bike.image is not None
            }
            bike_details.append(detail)
    
    context = {
        'bike_details': bike_details,
        'total_bikes': all_bikes.count(),
        'image_distribution': dict(image_counts.most_common())
    }
    
    return render(request, 'debug_bike_images.html', context)


# Create your views here.
from django.views.decorators.cache import cache_page
from utils.budget_filter import apply_budget_filter
from images.models import DynamicImage


def bikes(request):
    # Use cache for static data that doesn't change often
    category_search = caches['default'].get('bike_categories')
    
    if not category_search:
        category_search = list(Bike.objects.values_list('categoryBike', flat=True).distinct())
        caches['default'].set('bike_categories', category_search, 3600)  # Cache for 1 hour
    
    categoryBike = request.GET.get('categoryBike')
    name = request.GET.get('name')
    model = request.GET.get('model')
    brand = request.GET.get('brand')
    
    # Build query with optimization
    bikes_query = Bike.objects.all()
    
    if categoryBike:
        bikes_query = bikes_query.filter(categoryBike=categoryBike)
    if name:
        bikes_query = bikes_query.filter(Bikename=name)
    if model:
        bikes_query = bikes_query.filter(Bikemodel=model)
    if brand:
        # Normalize brand input: case-insensitive and space-trimmed
        normalized_brand = brand.strip().lower()
        
        # Handle common bike brand aliases and normalize to match database values
        brand_mapping = {
            'harley-davidson': ['harley-davidson', 'harley', 'hd'],
            'ktm': ['ktm'],
            'yamaha': ['yamaha'],
            'kawasaki': ['kawasaki'],
            'honda': ['honda'],
            'bajaj': ['bajaj'],
            'ducati': ['ducati'],
            'indian': ['indian'],
            'royal enfield': ['royal enfield', 'enfield'],
            'hero': ['hero', 'hero motocorp'],
            'tvs': ['tvs'],
            'suzuki': ['suzuki'],
            'bmw': ['bmw'],
            'triumph': ['triumph'],
        }
        
        # Find matching database values for this brand
        matching_bikenames = []
        for db_brand, aliases in brand_mapping.items():
            if normalized_brand in [alias.lower() for alias in aliases]:
                # Get all bike names that contain this brand
                all_variations = Bike.objects.filter(Bikename__icontains=db_brand).values_list('Bikename', flat=True).distinct()
                matching_bikenames.extend(all_variations)
                break
        
        if matching_bikenames:
            # Filter using all matching bike names
            from django.db.models import Q
            brand_query = Q()
            for name in matching_bikenames:
                brand_query |= Q(Bikename__iexact=name.strip())
            bikes_query = bikes_query.filter(brand_query)
        else:
            # No matching brand found - return empty queryset
            bikes_query = bikes_query.none()
        
    # Use order_by for consistent pagination
    bikes_query = bikes_query.order_by('id')

    # Add slug field to queryset since it's in the database but not in the model
    bikes_query = bikes_query.extra(select={'slug': 'slug'})

    paginator = Paginator(bikes_query, 6)
    page_number = request.GET.get('page')
    page_obj = paginator.get_page(page_number)

    # Create page range similar to cars view
    max_pages = 5
    current_page = page_obj.number
    page_range = range(max(1, current_page - max_pages),
                       min(paginator.num_pages, current_page + max_pages) + 1)

    # Cache names and models for selected category
    name_options = []
    model_options = []
    
    if categoryBike:
        name_options = list(Bike.objects.filter(categoryBike=categoryBike).values_list('Bikename', flat=True).distinct())
    
    if categoryBike and name:
        model_options = list(Bike.objects.filter(categoryBike=categoryBike, Bikename=name).values_list('Bikemodel', flat=True).distinct())

    context = {
        'page_obj': page_obj,
        'page_range': page_range,
        'category_search': category_search,
        'name_options': name_options,
        'model_options': model_options,
        'selected_category': categoryBike,
        'selected_name': name,
        'selected_model': model,
        'selected_brand': brand,
    }
    return render(request, 'bike/bikes.html', context)

def bikes_detail(request, id):
    bike = Bike.objects.get(id=id)
    # Add field aliases for template compatibility
    bike.name = bike.Bikename
    bike.model = bike.Bikemodel
    bike.fueleconomy = bike.mileage
    bike.speed = bike.max_speed
    bike.tank = bike.fuel_tank_capacity
    bike.trunk = bike.trunk_capacity
    bike.type = bike.body_type
    bike.manufacturer = bike.manufacturer
    bike.manufac_place = bike.manufacturing_place
    bike.Vehicle_overview = bike.vehicle_overview
    return render(request, 'bike/bike_details.html', {'bike': bike})


def bikes_detail_seo(request, slug):
    """SEO-friendly bike detail view using slug"""
    bike = get_object_or_404(Bike, slug=slug)
    # Add field aliases for template compatibility
    bike.name = bike.Bikename
    bike.model = bike.Bikemodel
    bike.fueleconomy = bike.mileage
    bike.speed = bike.max_speed
    bike.tank = bike.fuel_tank_capacity
    bike.trunk = bike.trunk_capacity
    bike.type = bike.body_type
    bike.manufacturer = bike.manufacturer
    bike.manufac_place = bike.manufacturing_place
    bike.Vehicle_overview = bike.vehicle_overview
    return render(request, 'bike/bike_details.html', {'bike': bike})


def bikes_by_brand(request, brand_slug):
    """Bikes filtered by brand with SEO-friendly URL"""
    # Normalize brand input
    normalized_brand = brand_slug.replace('-', ' ').strip().lower()
    
    # Handle common bike brand aliases
    brand_mapping = {
        'harley-davidson': ['harley-davidson', 'harley', 'hd'],
        'ktm': ['ktm'],
        'yamaha': ['yamaha'],
        'kawasaki': ['kawasaki'],
        'honda': ['honda'],
        'bajaj': ['bajaj'],
        'ducati': ['ducati'],
        'indian': ['indian'],
        'royal enfield': ['royal enfield', 'enfield'],
        'hero': ['hero', 'hero motocorp'],
        'tvs': ['tvs'],
        'suzuki': ['suzuki'],
        'bmw': ['bmw'],
        'triumph': ['triumph'],
    }
    
    # Find matching database values for this brand
    matching_bikenames = []
    for db_brand, aliases in brand_mapping.items():
        if normalized_brand in [alias.lower() for alias in aliases]:
            # Get all bike names that contain this brand
            all_variations = Bike.objects.filter(Bikename__icontains=db_brand).values_list('Bikename', flat=True).distinct()
            matching_bikenames.extend(all_variations)
            break
    
    if matching_bikenames:
        # Filter using all matching bike names
        from django.db.models import Q
        brand_query = Q()
        for name in matching_bikenames:
            brand_query |= Q(Bikename__iexact=name.strip())
        bikes_query = Bike.objects.filter(brand_query)
        brand_display = matching_bikenames[0]  # Use first match for display
    else:
        bikes_query = Bike.objects.none()
        brand_display = brand_slug.replace('-', ' ').title()
    
    # Add slug field to queryset since it's in the database but not in the model
    bikes_query = bikes_query.extra(select={'slug': 'slug'})
    
    # Use pagination
    paginator = Paginator(bikes_query, 6)
    page_number = request.GET.get('page')
    page_obj = paginator.get_page(page_number)
    
    # Create page range
    max_pages = 5
    current_page = page_obj.number
    page_range = range(max(1, current_page - max_pages),
                       min(paginator.num_pages, current_page + max_pages) + 1)
    
    context = {
        'page_obj': page_obj,
        'page_range': page_range,
        'current_brand': brand_display,
        'brand_slug': brand_slug,
    }
    return render(request, 'bike/bikes_by_brand.html', context)


def bikes_by_brand_model(request, brand_slug, model_slug):
    """Bikes filtered by brand and model with SEO-friendly URL"""
    brand_name = brand_slug.replace('-', ' ').title()
    model_name = model_slug.replace('-', ' ').title()
    
    bikes_query = Bike.objects.filter(Bikename__iexact=brand_name, Bikemodel__iexact=model_name)
    
    # Add slug field to queryset since it's in the database but not in the model
    bikes_query = bikes_query.extra(select={'slug': 'slug'})
    
    # Use pagination
    paginator = Paginator(bikes_query, 6)
    page_number = request.GET.get('page')
    page_obj = paginator.get_page(page_number)
    
    # Create page range
    max_pages = 5
    current_page = page_obj.number
    page_range = range(max(1, current_page - max_pages),
                       min(paginator.num_pages, current_page + max_pages) + 1)
    
    context = {
        'page_obj': page_obj,
        'page_range': page_range,
        'current_brand': brand_name,
        'current_model': model_name,
        'brand_slug': brand_slug,
        'model_slug': model_slug,
    }
    return render(request, 'bike/bikes_by_brand_model.html', context)


def compare_bikes(request):
    category1 = request.GET.get('category1')
    name1 = request.GET.get('name1')
    model1 = request.GET.get('model1')
    category2 = request.GET.get('category2')
    name2 = request.GET.get('name2')
    model2 = request.GET.get('model2')

    category_search = Bike.objects.values_list('categoryBike', flat=True).distinct()

    # Load default bikes if required query params are missing
    if not all([category1, name1, model1, category2, name2, model2]):
        default_bikes = Bike.objects.all().order_by('id')[:2]
        if len(default_bikes) >= 2:
            bike1 = default_bikes[0]
            bike2 = default_bikes[1]
        elif len(default_bikes) == 1:
            bike1 = default_bikes[0]
            bike2 = None
        else:
            bike1 = None
            bike2 = None
    else:
        bike1 = Bike.objects.filter(categoryBike=category1, Bikename=name1, Bikemodel=model1).first()
        bike2 = Bike.objects.filter(categoryBike=category2, Bikename=name2, Bikemodel=model2).first()

    # Add field aliases for template compatibility
    if bike1:
        # Ensure image field is properly handled
        if not hasattr(bike1, 'image') or not bike1.image:
            bike1.image = None
            
        bike1.name = bike1.Bikename
        bike1.model = bike1.Bikemodel
        bike1.fueleconomy = bike1.mileage
        bike1.speed = bike1.max_speed
        bike1.tank = bike1.fuel_tank_capacity
        bike1.ground = bike1.wheelbase  # Using wheelbase as ground clearance
        bike1.type = bike1.body_type
        bike1.manufacturer = bike1.manufacturer
        bike1.bags = "N/A"  # Bikes don't have airbags
        bike1.belt = "N/A"  # Bikes don't have seatbelts
        bike1.manufac_place = bike1.manufacturing_place
        
    if bike2:
        # Ensure image field is properly handled
        if not hasattr(bike2, 'image') or not bike2.image:
            bike2.image = None
            
        bike2.name = bike2.Bikename
        bike2.model = bike2.Bikemodel
        bike2.fueleconomy = bike2.mileage
        bike2.speed = bike2.max_speed
        bike2.tank = bike2.fuel_tank_capacity
        bike2.ground = bike2.wheelbase  # Using wheelbase as ground clearance
        bike2.type = bike2.body_type
        bike2.manufacturer = bike2.manufacturer
        bike2.bags = "N/A"  # Bikes don't have airbags
        bike2.belt = "N/A"  # Bikes don't have seatbelts
        bike2.manufac_place = bike2.manufacturing_place

    data = {
        'bike1': bike1,
        'bike2': bike2,
        'categoryBike_search': category_search,
        'default_car_images': DynamicImage.objects.filter(page_reference='general', is_active=True),
    }
    return render(request, 'bike/compare_bikes.html', data)


@cache_page(60 * 15)  # Cache for 15 minutes
def get_bike_categories(request):
    cache_key = 'bike_categories_api'
    categories = caches['default'].get(cache_key)
    
    if not categories:
        categories = list(Bike.objects.values_list('categoryBike', flat=True).distinct())
        caches['default'].set(cache_key, categories, 3600)  # Cache for 1 hour
    else:
        categories = list(categories)
        
    return JsonResponse(categories, safe=False)

@cache_page(60 * 30)  # Cache for 30 minutes
def get_bike_names(request):
    category = request.GET.get('category')
    cache_key = f'bike_names_{category}'
    names = caches['default'].get(cache_key)
    
    if not names:
        if category:
            names = list(Bike.objects.filter(categoryBike=category).values_list('Bikename', flat=True).distinct())
        else:
            names = []
        caches['default'].set(cache_key, names, 1800)  # Cache for 30 minutes
    else:
        names = list(names)
        
    return JsonResponse(names, safe=False)

@cache_page(60 * 30)  # Cache for 30 minutes
def get_bike_models(request):
    category = request.GET.get('category')
    name = request.GET.get('name')
    cache_key = f'bike_models_{category}_{name}'
    models = caches['default'].get(cache_key)
    
    if not models:
        if category and name:
            models = list(Bike.objects.filter(categoryBike=category, Bikename=name).values_list('Bikemodel', flat=True).distinct())
        else:
            models = []
        caches['default'].set(cache_key, models, 1800)  # Cache for 30 minutes
    else:
        models = list(models)
        
    return JsonResponse(models, safe=False)

def test_bike_images(request):
    """Test view to verify bike image display functionality"""
    from bikes.models import Bike
    test_bikes = Bike.objects.all()[:3]
    
    context = {
        'test_bikes': test_bikes,
    }
    return render(request, 'test_bike_images.html', context)


def search_Bikes(request):
    keyword = request.GET.get('keyword', '').strip()
    categoryBike = request.GET.get('category', '') or request.GET.get('brand', '')
    name = request.GET.get('name', '') or request.GET.get('model', '')
    model = request.GET.get('model', '') or request.GET.get('variant', '')
    budget_range = request.GET.get('budgetRange', '')

    bikes = Bike.objects.all()
    
    # Handle keyword search - search across multiple fields
    if keyword:
        from django.db.models import Q
        bikes = bikes.filter(
            Q(Bikename__icontains=keyword) |
            Q(Bikemodel__icontains=keyword) |
            Q(categoryBike__icontains=keyword)
        )
    else:
        # Original filtering logic for specific parameters
        if categoryBike:
            # For bikes, brand filtering should search within Bikename field
            # since Bikename contains "Harley-Davidson Iron 883", "Yamaha YZF-R3", etc.
            bikes = bikes.filter(Bikename__icontains=categoryBike)
        if name:
            bikes = bikes.filter(Bikename__icontains=name)
        if model:
            bikes = bikes.filter(Bikemodel__iexact=model)

    if budget_range:
        bikes = apply_budget_filter(bikes, budget_range, vehicle_type='bike')

    # Add slug field to queryset since it's in the database but not in the model
    bikes = bikes.extra(select={'slug': 'slug'})

    categoryBike_search = Bike.objects.values_list('categoryBike', flat=True).distinct()

    # Create pagination
    paginator = Paginator(bikes, 6)
    page_number = request.GET.get('page')
    page_obj = paginator.get_page(page_number)

    max_pages = 5
    current_page = page_obj.number
    page_range = range(max(1, current_page - max_pages),
                       min(paginator.num_pages, current_page + max_pages) + 1)

    data = {
        'bikes': page_obj,
        'categoryBike_search': categoryBike_search,
        'selected_categoryBike': categoryBike,
        'selected_name': name,
        'selected_model': model,
        'selected_budget_range': budget_range,
        'page_obj': page_obj,
        'page_range': page_range,
        'search_keyword': keyword,  # Add keyword to context
    }
    return render(request, 'bike/search_bike.html', data)


def test_bike_search_images(request):
    """Test view to verify bike search shows correct images"""
    # Get a few sample bikes
    test_bikes = Bike.objects.all()[:6]
    
    bike_data = []
    for bike in test_bikes:
        bike_data.append({
            'name': f"{bike.Bikename} {bike.Bikemodel}",
            'image_field': str(bike.image),
            'image_url': bike.image.url if bike.image else None,
            'image_exists': bike.image and bike.image.path and os.path.exists(bike.image.path) if bike.image else False
        })
    
    return render(request, 'test_bike_search.html', {'bikes': bike_data})


def test_bike_detail_images(request):
    """Test view to verify bike detail shows correct images"""
    # Get first bike for testing
    bike = Bike.objects.first()
    
    if bike:
        bike_data = {
            'name': f"{bike.Bikename} {bike.Bikemodel}",
            'image_field': str(bike.image),
            'image_url': bike.image.url if bike.image else None,
            'image_exists': bike.image and bike.image.path and os.path.exists(bike.image.path) if bike.image else False
        }
    else:
        bike_data = None
    
    return render(request, 'test_bike_detail.html', {'bike': bike_data})
