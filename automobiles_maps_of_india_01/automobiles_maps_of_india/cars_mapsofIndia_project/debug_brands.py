#!/usr/bin/env python
import os
import django

os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'cardealer.settings')
django.setup()

from cars.models import Car

print('=== CAR BRANDS ===')
brands = Car.objects.values_list('name', flat=True).distinct()
for brand in sorted(brands):
    print(f'[{brand}]')
print(f'Total distinct brands: {len(brands)}')

print('\n=== LOOKING FOR MAXUS ===')
maxus_cars = Car.objects.filter(name__icontains='maxus')
print(f'Cars with Maxus in name: {maxus_cars.count()}')
for car in maxus_cars:
    print(f'  ID: {car.id}, Name: [{car.name}], Category: [{car.category}]')

print('\n=== ALL FIELDS FOR MAXUS ===')
for car in maxus_cars[:3]:
    print(f'Name: [{car.name}]')
    print(f'Category: [{car.category}]')
    print(f'Model: [{car.model}]')
    print(f'Manufacturer: [{car.manufacturer}]')
    print('---')

print('\n=== TESTING FILTER LOGIC ===')
# Test the exact filter from our view
test_brand = 'Maxus'
filtered_cars = Car.objects.filter(name__iexact=test_brand)
print(f'Filter name__iexact="Maxus": {filtered_cars.count()} cars')

# Test with different variations
variations = ['Maxus', 'MAXUS', 'maxus', ' Maxus ', 'Maxus ']
for var in variations:
    count = Car.objects.filter(name__iexact=var.strip()).count()
    print(f'Filter name__iexact="{var.strip()}": {count} cars')

print('\n=== CHECKING MANUFACTURER FIELD ===')
manufacturers = Car.objects.values_list('manufacturer', flat=True).distinct()
for mfg in sorted(manufacturers):
    print(f'[{mfg}]')
