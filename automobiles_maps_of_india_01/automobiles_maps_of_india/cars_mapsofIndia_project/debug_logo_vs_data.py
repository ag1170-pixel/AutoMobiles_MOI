import os, django
os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'cardealer.settings')
django.setup()

from cars.models import Car
from bikes.models import Bike

# Read logos from the template file
with open('templates/includes/carslogo.html', 'r') as f:
    content = f.read()

import re
# Extract car brands from logos
car_logos = re.findall(r'href="\{.*?brand=([^"]+)"', content)
car_brands = [brand for brand in car_logos if 'cars' in content.split(brand)[0][:50]]

# Extract bike brands from logos  
bike_logos = re.findall(r'href="\{.*?brand=([^"]+)"', content)
bike_brands = [brand for brand in bike_logos if 'bikes' in content.split(brand)[0][:50]]

print('=== CAR BRANDS IN LOGOS ===')
for brand in sorted(set(car_brands)):
    print(f'Logo: [{brand}]')

print('\n=== CAR BRANDS IN DATABASE ===')  
db_brands = set(Car.objects.values_list('name', flat=True).distinct())
for brand in sorted(db_brands):
    print(f'DB:   [{brand}]')

print('\n=== CAR BRANDS MISSING FROM DATABASE ===')
logo_brands_set = set(car_brands)
missing_cars = logo_brands_set - db_brands
for brand in sorted(missing_cars):
    print(f'MISSING: [{brand}]')

print('\n=== BIKE BRANDS IN LOGOS ===')
for brand in sorted(set(bike_brands)):
    print(f'Logo: [{brand}]')

print('\n=== BIKE BRANDS IN DATABASE ===')
bike_db_brands = set(Bike.objects.values_list('Bikename', flat=True).distinct())
for brand in sorted(bike_db_brands):
    print(f'DB:   [{brand}]')

print('\n=== BIKE BRANDS MISSING FROM DATABASE ===')
bike_logo_brands_set = set(bike_brands)
missing_bikes = bike_logo_brands_set - bike_db_brands
for brand in sorted(missing_bikes):
    print(f'MISSING: [{brand}]')
