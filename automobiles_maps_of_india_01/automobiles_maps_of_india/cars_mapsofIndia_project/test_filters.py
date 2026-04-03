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

print('=== CAR DATA ANALYSIS ===')
print('Sample categories (used for brands):')
categories = Car.objects.values_list('category', flat=True).distinct()[:15]
for cat in categories:
    print(f'  "{cat}"')

print('\nSample names:')
names = Car.objects.values_list('name', flat=True).distinct()[:10]
for name in names:
    print(f'  "{name}"')

print('\nTotal cars:', Car.objects.count())

print('\n=== TESTING FILTER COMBINATIONS ===')
# Test individual filters
all_cars = Car.objects.all()
print(f'Total cars: {all_cars.count()}')

# Test category filter with different case variations
audi_cats = Car.objects.filter(category__icontains='audi')
print(f'Audi category (icontains): {audi_cats.count()}')

audi_exact = Car.objects.filter(category='Audi')
print(f'Audi category (exact): {audi_exact.count()}')

# Test budget filter on Audi
audi_budget = apply_budget_filter(audi_cats, '5-10', 'car')
print(f'Audi + 5-10 Lakhs: {audi_budget.count()}')

# Test some sample data
print('\nSample Audi cars:')
for car in audi_cats[:3]:
    print(f'  {car.category} - {car.name} {car.model} - ₹{car.price} Lakh')

print('\n=== TESTING COMBINED FILTERING ISSUE ===')
# Simulate the search logic with realistic values
category = 'AUDI'  # Use exact case from database
budget_range = '20-50'  # Realistic range for Audi cars

cars = Car.objects.all()
print(f'Starting with {cars.count()} cars')

if category:
    print(f'Filtering by category: {category}')
    cars = cars.filter(category__iexact=category)
    print(f'After category filter: {cars.count()} cars')

if budget_range:
    print(f'Filtering by budget: {budget_range}')
    cars = apply_budget_filter(cars, budget_range, vehicle_type='car')
    print(f'After budget filter: {cars.count()} cars')

print(f'\nFinal result: {cars.count()} cars')

# Show the filtered results
if cars.count() > 0:
    print('\nFiltered cars:')
    for car in cars[:5]:
        print(f'  {car.category} - {car.name} {car.model} - ₹{car.price} Lakh')

# Test with different case inputs
print('\n=== TESTING CASE INSENSITIVITY ===')
test_cases = ['audi', 'AUDI', 'Audi', 'AuDi']
for test_case in test_cases:
    count = Car.objects.filter(category__iexact=test_case).count()
    print(f'Category "{test_case}" -> {count} cars')
