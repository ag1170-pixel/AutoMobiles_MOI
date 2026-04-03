#!/usr/bin/env python
import os
import sys
import django

# Set up Django
sys.path.append(os.path.dirname(os.path.abspath(__file__)))
os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'cardealer.settings')
django.setup()

from cars.models import Car

print("=== Creating Test EcoSport Hybrid Car ===")

# Check if EcoSport already exists
existing_ecosport = Car.objects.filter(name__icontains='ecosport').first()
if existing_ecosport:
    print(f"EcoSport already exists: {existing_ecosport.name} {existing_ecosport.model} (Slug: {existing_ecosport.slug})")
else:
    # Create the EcoSport Hybrid car that matches the URL
    ecosport_hybrid = Car.objects.create(
        name='EcoSport',
        model='Hybrid',
        category='FORD',
        price=12.50,  # 12.50 Lakh
        length='3998',
        height='1653', 
        width='1765',
        wheelbase='2519',
        kerb='1265',
        vehicle_type='SUV',
        ground_clearance='200',
        trunk_capacity='346',
        fuel_tank_capacity='52',
        engine='1.5L Hybrid',
        gears='CVT',
        fuel_economy='21.7',
        top_speed='170',
        airbags='7',
        seat_belts='6',
        image='cars/ecosport_hybrid.jpg',  # placeholder
        manufac_place='Chennai',
        vehicle_overview='The Ford EcoSport Hybrid is a compact SUV that combines efficiency with practicality.',
        features='Touchscreen infotainment, Automatic Climate Control, Push Button Start, Reverse Camera',
        manufacturer='TA',  # Tata Motors (but we'll use this as placeholder)
        fuel_type='Hybrid',
        user_rating=4.2,
        mileage='21.7 km/l',
        num_of_cylinders=4,
        body_type='SUV'
    )
    
    print(f"Created EcoSport Hybrid: {ecosport_hybrid.name} {ecosport_hybrid.model}")
    print(f"Slug: {ecosport_hybrid.slug}")
    print(f"ID: {ecosport_hybrid.id}")

print("\n=== Verifying the car was created ===")
try:
    test_car = Car.objects.get(slug='ecosport-hybrid-ford')
    print(f"Successfully found car with slug: {test_car.slug}")
    print(f"Car details: {test_car.name} {test_car.model} - {test_car.category}")
except Car.DoesNotExist:
    print("ERROR: Car was not created properly")

print("\n=== Complete ===")
