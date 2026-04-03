#!/usr/bin/env python
import os
import sys
import django

# Setup Django
sys.path.append(os.path.dirname(os.path.abspath(__file__)))
os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'cardealer.settings')
django.setup()

from cars.models import Car
from bikes.models import Bike
from utils.budget_filter import apply_budget_filter

print('=== TESTING COMBINED FILTERING FIX ===')

# Test Cars combined filtering
print('\n1. CARS - Testing Brand + Budget combinations:')

test_scenarios = [
    ('AUDI', '20-50'),
    ('BMW', '10-30'),
    ('MARUTI', '1-5'),
    ('HYUNDAI', '5-15'),
]

for brand, budget in test_scenarios:
    print(f'\n  Testing: {brand} + {budget} Lakhs')
    
    # Start with all cars
    cars = Car.objects.all()
    print(f'    Starting: {cars.count()} cars')
    
    # Apply brand filter
    if brand:
        cars = cars.filter(category__iexact=brand)
        print(f'    After brand filter: {cars.count()} cars')
    
    # Apply budget filter
    if budget:
        cars = apply_budget_filter(cars, budget, vehicle_type='car')
        print(f'    After budget filter: {cars.count()} cars')
    
    # Show sample results
    if cars.count() > 0:
        print(f'    Sample results:')
        for car in cars[:2]:
            print(f'      {car.category} - {car.name} {car.model} - ₹{car.price} Lakh')
    else:
        print(f'    No results found')

# Test Bikes combined filtering
print('\n2. BIKES - Testing Brand + Budget combinations:')

# First, let's see what bike categories exist
bike_categories = Bike.objects.values_list('categoryBike', flat=True).distinct()
print(f'Available bike categories: {list(bike_categories)}')

bike_scenarios = [
    ('Harley', '10-25'),  # Harley bikes are expensive
    ('Yamaha', '1-5'),    # Yamaha has affordable bikes
    ('KTM', '2-10'),      # KTM mid-range
    ('Bajaj', '1-3'),     # Bajaj budget bikes
    ('Ducati', '15-30'),  # Ducati premium bikes
]

for brand, budget in bike_scenarios:
    print(f'\n  Testing: {brand} + {budget} Lakhs')
    
    # Start with all bikes
    bikes = Bike.objects.all()
    print(f'    Starting: {bikes.count()} bikes')
    
    # Apply brand filter (search within Bikename field)
    if brand:
        bikes = bikes.filter(Bikename__icontains=brand)
        print(f'    After brand filter: {bikes.count()} bikes')
    
    # Apply budget filter
    if budget:
        bikes = apply_budget_filter(bikes, budget, vehicle_type='bike')
        print(f'    After budget filter: {bikes.count()} bikes')
    
    # Show sample results
    if bikes.count() > 0:
        print(f'    Sample results:')
        for bike in bikes[:2]:
            print(f'      {bike.Bikename} {bike.Bikemodel} - ₹{bike.price:,.0f}')
    else:
        print(f'    No results found')

print('\n=== TESTING EDGE CASES ===')

# Test case insensitivity
print('\n3. Testing case insensitivity:')
test_cases = ['audi', 'AUDI', 'Audi', 'AuDi']
for case in test_cases:
    count = Car.objects.filter(category__iexact=case).count()
    print(f'  Category "{case}" -> {count} cars')

# Test invalid budget ranges
print('\n4. Testing invalid budget ranges:')
invalid_ranges = ['invalid', 'abc-def', '']
for invalid_range in invalid_ranges:
    cars = apply_budget_filter(Car.objects.all(), invalid_range, 'car')
    print(f'  Budget range "{invalid_range}" -> {cars.count()} cars')

print('\n=== COMBINED FILTERING TEST COMPLETE ===')
