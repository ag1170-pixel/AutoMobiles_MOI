#!/usr/bin/env python
import os
import sys
import django

# Set up Django
sys.path.append(os.path.dirname(os.path.abspath(__file__)))
os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'cardealer.settings')
django.setup()

from cars.models import Car

print("=== Database Analysis ===")

# Check total cars
total_cars = Car.objects.count()
print(f'Total cars in database: {total_cars}')

# Check cars with slugs
cars_with_slugs = Car.objects.exclude(slug='').count()
print(f'Cars with slugs: {cars_with_slugs}')

# Check for the specific slug
try:
    target_car = Car.objects.get(slug='2023-ecosport-hybrid')
    print(f'Found car with slug 2023-ecosport-hybrid: {target_car.name} {target_car.model}')
except Car.DoesNotExist:
    print('No car found with slug: 2023-ecosport-hybrid')

# Check for any cars with 'EcoSport' or 'Eco' in the name
eco_cars = Car.objects.filter(name__icontains='eco')
print(f'\nFound {eco_cars.count()} cars with "eco" in name:')
for car in eco_cars:
    print(f'ID: {car.id}, Name: {car.name}, Model: {car.model}, Slug: {car.slug}')

# Check for any cars with 'Hybrid' in the model
hybrid_cars = Car.objects.filter(model__icontains='hybrid')
print(f'\nFound {hybrid_cars.count()} cars with "hybrid" in model:')
for car in hybrid_cars:
    print(f'ID: {car.id}, Name: {car.name}, Model: {car.model}, Slug: {car.slug}')

# Check for any Ford cars
ford_cars = Car.objects.filter(category__icontains='ford')
print(f'\nFound {ford_cars.count()} Ford cars:')
for car in ford_cars[:5]:  # Show first 5
    print(f'ID: {car.id}, Name: {car.name}, Model: {car.model}, Slug: {car.slug}')

# Show some sample cars that might be displayed
print('\nSample cars from database:')
for car in Car.objects.all()[:20]:
    print(f'ID: {car.id}, Name: {car.name}, Model: {car.model}, Category: {car.category}, Slug: {car.slug}')

print("\n=== Checking for missing slugs ===")
missing_slugs = Car.objects.filter(slug='')
print(f'Cars with empty slugs: {missing_slugs.count()}')
if missing_slugs.exists():
    print("Generating slugs for cars without them...")
    for car in missing_slugs:
        car.save()  # This will trigger the save method to generate slug
        print(f'Generated slug for {car.name} {car.model}: {car.slug}')

print("\n=== Analysis Complete ===")
