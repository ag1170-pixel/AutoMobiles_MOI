#!/usr/bin/env python
import os
import sys
import django

# Set up Django
sys.path.append(os.path.dirname(os.path.abspath(__file__)))
os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'cardealer.settings')
django.setup()

from cars.models import Car

print("=== Creating Missing Demo Cars ===")

# Cars to create based on the hardcoded URLs in home.html
demo_cars = [
    {
        'name': 'Model X',
        'model': 'Sedan',
        'category': 'TESLA',
        'slug': '2023-model-x-sedan',
        'price': 59.99,
        'manufac_place': 'Palo Alto',
        'vehicle_type': 'Sedan',
        'manufacturer': 'TO',  # Using Toyota as placeholder
        'fuel_type': 'EV',
        'body_type': 'Sedan'
    },
    {
        'name': 'SUV Deluxe',
        'model': 'Deluxe',
        'category': 'FORD',
        'slug': '2023-suv-deluxe',
        'price': 42.50,
        'manufac_place': 'Chennai',
        'vehicle_type': 'SUV',
        'manufacturer': 'TA',  # Using Tata as placeholder
        'fuel_type': 'Petrol',
        'body_type': 'SUV'
    },
    {
        'name': 'EcoSport',
        'model': 'Hybrid',
        'category': 'FORD',
        'slug': '2023-ecosport-hybrid',
        'price': 28.75,
        'manufac_place': 'Chennai',
        'vehicle_type': 'SUV',
        'manufacturer': 'TA',  # Using Tata as placeholder
        'fuel_type': 'Hybrid',
        'body_type': 'SUV'
    }
]

for car_data in demo_cars:
    # Check if car already exists
    existing_car = Car.objects.filter(slug=car_data['slug']).first()
    if existing_car:
        print(f"Car with slug '{car_data['slug']}' already exists: {existing_car.name} {existing_car.model}")
        continue
    
    # Create the car with specific slug
    car = Car.objects.create(
        name=car_data['name'],
        model=car_data['model'],
        category=car_data['category'],
        price=car_data['price'],
        length='4500',
        height='1600', 
        width='1800',
        wheelbase='2700',
        kerb='1500',
        vehicle_type=car_data['vehicle_type'],
        ground_clearance='180',
        trunk_capacity='500',
        fuel_tank_capacity='50',
        engine='2.0L',
        gears='6',
        fuel_economy='15.0',
        top_speed='200',
        airbags='6',
        seat_belts='6',
        image='cars/demo_car.jpg',
        manufac_place=car_data['manufac_place'],
        vehicle_overview=f'Demo vehicle: {car_data["name"]} {car_data["model"]}',
        features='Air Conditioning, Power Steering, Touchscreen Display',
        manufacturer=car_data['manufacturer'],
        fuel_type=car_data['fuel_type'],
        user_rating=4.0,
        mileage='15.0 km/l',
        num_of_cylinders=4,
        body_type=car_data['body_type'],
        slug=car_data['slug']  # Force the specific slug
    )
    
    print(f"Created car: {car.name} {car.model} with slug: {car.slug}")

print("\n=== Verifying all demo cars exist ===")
required_slugs = ['2023-model-x-sedan', '2023-suv-deluxe', '2023-ecosport-hybrid']
for slug in required_slugs:
    try:
        car = Car.objects.get(slug=slug)
        print(f"✓ Found: {car.name} {car.model} (Slug: {car.slug})")
    except Car.DoesNotExist:
        print(f"✗ Missing: {slug}")

print("\n=== Complete ===")
