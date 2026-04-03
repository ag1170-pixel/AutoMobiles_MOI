from django.shortcuts import render, redirect
from django.http import JsonResponse
from django.views.decorators.csrf import csrf_exempt
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger
from django.db.models import Q
from .models import City, FuelPrice, CNGPrice,State, FuelModel, DieselPrice,LPGPrice,PetrolPrice
import json
from cars.models import PetrolPump
# cng maps

def fuel_price_map(request):
    fuel_prices = FuelPrice.objects.select_related('city').all()
    context = {
        'fuel_prices': fuel_prices,
    }
    return render(request, 'petrol-stations/fuel-price-map.html', context)

def get_fuel_prices(request):
    city_name = request.GET.get('city')
    try:
        fuel_price = FuelPrice.objects.select_related('city').get(city__name=city_name)
        data = {
            'city': fuel_price.city.name,
            'cng_price': float(fuel_price.cng_price),
            'petrol_price': float(fuel_price.petrol_price),
            'diesel_price': float(fuel_price.diesel_price),
            'lpg_price': float(fuel_price.lpg_price),
            'fuel_price': float(fuel_price.fuel_price),
            'last_updated': fuel_price.last_updated.strftime('%Y-%m-%d %H:%M:%S')
        }
        return JsonResponse(data)
    except FuelPrice.DoesNotExist:
        return JsonResponse({'error': 'City not found'}, status=404)


def cng_price_map(request):
    cng_prices = CNGPrice.objects.select_related('city').all()
    context = {
        'cng_prices': cng_prices,
    }
    return render(request, 'petrol-stations/cng-price-map.html', context)


def get_cng_prices(request):
    prices = CNGPrice.objects.select_related('city').all()
    data = [{
        'city': price.city.name,
        'price': price.price,
        'last_updated': price.last_updated.strftime('%d %b %Y %H:%M'),
        'latitude': price.city.latitude,
        'longitude': price.city.longitude
    } for price in prices]
    return JsonResponse(data, safe=False)

@csrf_exempt
def update_price(request):
    if request.method == 'POST':
        data = json.loads(request.body)
        city = data.get('city')
        price = data.get('price')

        try:
            cng_price = CNGPrice.objects.get(city=city)
            cng_price.price = price
            cng_price.save()
            return JsonResponse({'status': 'success'})
        except CNGPrice.DoesNotExist:
            return JsonResponse({'status': 'error', 'message': 'City not found'})

    return JsonResponse({'status': 'error', 'message': 'Invalid request method'})



def diesel_price_map(request):
    cities = City.objects.all()
    prices = {}
    for city in cities:
        try:
            latest_price = DieselPrice.objects.filter(city=city).latest('date')
            prices[city.name] = {
                'price': float(latest_price.price),  # Convert Decimal to float for JSON serialization
                'lat': float(city.latitude),
                'lng': float(city.longitude),
            }
        except DieselPrice.DoesNotExist:
            # If no price exists for this city, we'll skip it
            continue

    context = {
        'prices_json': json.dumps(prices),
    }
    return render(request, 'petrol-stations/diesel-price-map.html', context)


def lpg_prices(request):
    cities = City.objects.all()
    lpg_prices = LPGPrice.objects.select_related('city').all()

    context = {
        'cities': cities,
        'lpg_prices': lpg_prices,
    }
    return render(request, 'petrol-stations/lpg-price-map.html', context)


def petrol_prices(request):
    cities = City.objects.all()
    petrol_prices = PetrolPrice.objects.select_related('city').all()

    context = {
        'cities': cities,
        'petrol_prices': petrol_prices,
    }
    return render(request, 'petrol-stations/petrol_price_map.html', context)




def city_detail(request, city_name):
    city = City.objects.get(name=city_name)
    latest_price = DieselPrice.objects.filter(city=city).latest()
    context = {
        'city': city,
        'price': latest_price,
    }
    return render(request, 'petrol-stations/diesel-price-map.html', context)



# def petrol_pump_finder(request):
#     PetrolPumps = PetrolPump.objects.all()
#     context = {
#         'petrolpumps': PetrolPumps
#     }
#     return render(request, 'petrol-stations/petrolpumpfinder.html', context)


def state_list(request):
    states = PetrolPump.objects.values_list('state', flat=True).distinct()
    return render(request, 'petrol-stations/state_list.html', {'states': states})

def get_states(request):
    states = list(State.objects.values('id', 'name'))
    return JsonResponse(states, safe=False)




def get_cities_by_state(request):
    state_name = request.GET.get('state')
    if state_name:
        cities = list(PetrolPump.objects.filter(state=state_name)
                     .values_list('location', flat=True)
                     .distinct()
                     .order_by('location'))
        
        return JsonResponse(cities, safe=False)
    return JsonResponse([], safe=False)


def get_cities(request):
    state_id = request.GET.get('state_id')
    cities = list(City.objects.filter(state_id=state_id).values('id', 'name'))
    return JsonResponse(cities, safe=False)



def get_petrol_stations(request):
    city_id = request.GET.get('city_id')
    stations = list(PetrolPump.objects.filter(city_id=city_id).values('id', 'name', 'address', 'phone'))
    return JsonResponse(stations, safe=False)


def get_fuel_models(request):
    models = list(FuelModel.objects.values('id', 'name', 'fuel_type'))
    return JsonResponse(models, safe=False)

def petrol_pump_finder(request):
    states = PetrolPump.objects.values_list('state', flat=True).distinct().order_by('state')
    selected_state = request.GET.get('state')
    selected_city = request.GET.get('city')
    search_query = request.GET.get('search', '').strip()
    page = request.GET.get('page', 1)

    petrolpumps = PetrolPump.objects.all()
    cities = []

    if search_query:
        exact_city_matches = petrolpumps.filter(location__iexact=search_query)
        prefix_city_matches = petrolpumps.filter(location__istartswith=search_query)
        exact_state_matches = petrolpumps.filter(state__iexact=search_query)
        prefix_state_matches = petrolpumps.filter(state__istartswith=search_query)
        prefix_name_matches = petrolpumps.filter(name__istartswith=search_query)
        prefix_address_matches = petrolpumps.filter(address__istartswith=search_query)
        prefix_company_matches = petrolpumps.filter(company_name__istartswith=search_query)
        
        exact_city_ids = set(exact_city_matches.values_list('id', flat=True))
        prefix_city_ids = set(prefix_city_matches.values_list('id', flat=True)) - exact_city_ids
        exact_state_ids = set(exact_state_matches.values_list('id', flat=True)) - exact_city_ids - prefix_city_ids
        prefix_state_ids = set(prefix_state_matches.values_list('id', flat=True)) - exact_city_ids - prefix_city_ids - exact_state_ids
        prefix_name_ids = set(prefix_name_matches.values_list('id', flat=True)) - exact_city_ids - prefix_city_ids - exact_state_ids - prefix_state_ids
        prefix_address_ids = set(prefix_address_matches.values_list('id', flat=True)) - exact_city_ids - prefix_city_ids - exact_state_ids - prefix_state_ids - prefix_name_ids
        prefix_company_ids = set(prefix_company_matches.values_list('id', flat=True)) - exact_city_ids - prefix_city_ids - exact_state_ids - prefix_state_ids - prefix_name_ids - prefix_address_ids
        
        all_ids = (list(exact_city_ids) + list(prefix_city_ids) + 
                   list(exact_state_ids) + list(prefix_state_ids) + 
                   list(prefix_name_ids) + list(prefix_address_ids) + list(prefix_company_ids))
        
        if all_ids:
            when_statements = []
            for i, id_val in enumerate(all_ids):
                when_statements.append(f"WHEN {id_val} THEN {i}")
            
            ordering = f"CASE id {' '.join(when_statements)} ELSE 999999 END"
            petrolpumps = PetrolPump.objects.filter(id__in=all_ids).extra(select={'priority': ordering}).order_by('priority')
        else:
            petrolpumps = PetrolPump.objects.none()

    if selected_state:
        petrolpumps = petrolpumps.filter(state=selected_state)
        cities = PetrolPump.objects.filter(state=selected_state).values_list('location', flat=True).distinct().order_by('location')

        # Apply city filter
        if selected_city:
            petrolpumps = petrolpumps.filter(location=selected_city)

    # Pagination
    paginator = Paginator(petrolpumps, 20)  # Show 20 petrol pumps per page
    try:
        petrolpumps = paginator.page(page)
    except PageNotAnInteger:
        petrolpumps = paginator.page(1)
    except EmptyPage:
        petrolpumps = paginator.page(paginator.num_pages)

    context = {
        'petrolpumps': petrolpumps,
        'states': states,
        'cities': cities,
        'selected_state': selected_state,
        'selected_city': selected_city,
        'search_query': search_query,
    }
    return render(request, 'petrol-stations/petrolpumpfinder.html', context)


def petrol_stations(request):
    # Query the petrol stations and group them by city
    stations = PetrolPump.objects.all()
    grouped_stations = {}
    for station in stations:
        city = station.city
        if city not in grouped_stations:
            grouped_stations[city] = []
        grouped_stations[city].append({
            'name': station.name,
            'address': station.address,
            'phone': station.phone
        })
    return JsonResponse(grouped_stations)


def normalize_state_slug(state_slug):
    """Convert URL slug to state name format"""
    if not state_slug:
        return None
    
    # Common state slug mappings
    slug_mappings = {
        'uttar-pradesh': 'Uttar Pradesh',
        'uttarakhand': 'Uttarakhand',
        'andhra-pradesh': 'Andhra Pradesh',
        'arunachal-pradesh': 'Arunachal Pradesh',
        'himachal-pradesh': 'Himachal Pradesh',
        'jammu-kashmir': 'Jammu and Kashmir',
        'madhya-pradesh': 'Madhya Pradesh',
        'maharashtra': 'Maharashtra',
        'tamil-nadu': 'Tamil Nadu',
        'west-bengal': 'West Bengal',
        'andaman-nicobar': 'Andaman and Nicobar Islands',
        'dadra-nagar-haveli': 'Dadra and Nagar Haveli',
        'daman-diu': 'Daman and Diu',
        'nct-delhi': 'Delhi',
        'pondicherry': 'Pondicherry',
        'chhattisgarh': 'Chhattisgarh',
        'jharkhand': 'Jharkhand',
        'karnataka': 'Karnataka',
        'kerala': 'Kerala',
        'rajasthan': 'Rajasthan',
        'sikkim': 'Sikkim',
        'tripura': 'Tripura',
        'uttaranchal': 'Uttaranchal',
        'vanarasi': 'Varanasi',
    }
    
    # Return mapped state or convert slug to title case
    return slug_mappings.get(state_slug.lower().replace('_', '-'), 
                       state_slug.replace('-', ' ').title())

def petrol_pump_list(request, state_slug=None):
    """
    Unified view for petrol pump listing with filtering and search
    """
    states = PetrolPump.objects.values_list('state', flat=True).distinct().order_by('state')
    
    # Normalize state slug to proper state name
    normalized_state = normalize_state_slug(state_slug)
    selected_state = request.GET.get('state') or normalized_state
    selected_city = request.GET.get('city')
    search_query = request.GET.get('search', '').strip()
    page = request.GET.get('page', 1)

    petrolpumps = PetrolPump.objects.all().order_by('state', 'location', 'name')
    cities = []

    # Apply state filter (case-insensitive)
    if selected_state:
        # Try exact match first, then case-insensitive
        exact_match = PetrolPump.objects.filter(state=selected_state).exists()
        if exact_match:
            petrolpumps = petrolpumps.filter(state=selected_state)
            cities = PetrolPump.objects.filter(state=selected_state).values_list('location', flat=True).distinct().order_by('location')
        else:
            # Try case-insensitive match
            petrolpumps = petrolpumps.filter(state__iexact=selected_state)
            cities = PetrolPump.objects.filter(state__iexact=selected_state).values_list('location', flat=True).distinct().order_by('location')
            # Update selected_state to the actual case from database for display
            actual_state = PetrolPump.objects.filter(state__iexact=selected_state).values_list('state', flat=True).first()
            if actual_state:
                selected_state = actual_state

    # Apply city filter
    if selected_city:
        petrolpumps = petrolpumps.filter(location=selected_city)

    # Apply search filter with case-insensitive matching
    if search_query:
        petrolpumps = petrolpumps.filter(
            Q(name__icontains=search_query) |
            Q(address__icontains=search_query) |
            Q(company_name__icontains=search_query) |
            Q(location__icontains=search_query)
        )

    # Pagination
    paginator = Paginator(petrolpumps, 20)  # Show 20 petrol pumps per page
    try:
        petrolpumps = paginator.page(page)
    except PageNotAnInteger:
        petrolpumps = paginator.page(1)
    except EmptyPage:
        petrolpumps = paginator.page(paginator.num_pages)

    context = {
        'petrolpumps': petrolpumps,
        'states': states,
        'cities': cities,
        'selected_state': selected_state,
        'selected_city': selected_city,
        'search_query': search_query,
        'state_slug': state_slug,
    }
    return render(request, 'petrol-stations/petrol-pump-list.html', context)


def petrol_pump_autocomplete(request):
    """Autocomplete endpoint for petrol pump finder"""
    query = request.GET.get('q', '').strip()
    
    if not query or len(query) < 1:
        return JsonResponse({'suggestions': []})
    
    # Use OR conditions with istartswith for prefix-based matching
    petrol_pumps = PetrolPump.objects.filter(
        Q(name__istartswith=query) |
        Q(location__istartswith=query) |
        Q(state__istartswith=query) |
        Q(company_name__istartswith=query)
    ).distinct()[:50]  # Limit to 50 results for performance
    
    suggestions = []
    for pump in petrol_pumps:
        # Determine which field matched to provide context
        display_text = pump.name
        if pump.location.lower().startswith(query.lower()):
            display_text = f"{pump.name} ({pump.location})"
        elif pump.state.lower().startswith(query.lower()):
            display_text = f"{pump.name} ({pump.state})"
        elif pump.company_name.lower().startswith(query.lower()):
            display_text = f"{pump.name} - {pump.company_name}"
        
        suggestions.append({
            'name': pump.name,
            'location': pump.location,
            'state': pump.state,
            'company_name': pump.company_name,
            'display_text': display_text
        })
    
    return JsonResponse({'suggestions': suggestions})


# Legacy redirect views for old URL patterns
def redirect_to_delhi(request):
    return redirect('/petrolstations/delhi/', permanent=True)

def redirect_to_maharashtra(request):
    return redirect('/petrolstations/maharashtra/', permanent=True)

def redirect_to_uttarpradesh(request):
    return redirect('/petrolstations/uttar-pradesh/', permanent=True)

def redirect_to_tamilnadu(request):
    return redirect('/petrolstations/tamil-nadu/', permanent=True)