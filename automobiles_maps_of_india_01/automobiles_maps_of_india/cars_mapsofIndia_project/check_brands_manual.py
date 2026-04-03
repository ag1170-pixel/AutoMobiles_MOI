import os, django
os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'cardealer.settings')
django.setup()

from cars.models import Car
from bikes.models import Bike

# Manual list from the logo file
car_brands = ['Mahindra', 'BMW', 'Flare', 'Hyundai', 'Toyota', 'Honda', 'Fiat', 'Lexus', 'Maxus', 'Nissan', 'Audi', 'Ford', 'Haval', 'Mini', 'MG', 'Infiniti', 'Volvo']
bike_brands = ['Bajaj', 'Benelli', 'CFmoto', 'Ducati', 'Hero', 'Harley', 'Honda', 'KTM', 'Royal', 'Kawasaki', 'Suzuki', 'TVS']

print('=== CAR BRANDS ANALYSIS ===')
db_car_brands = set(Car.objects.values_list('name', flat=True).distinct())

for brand in car_brands:
    count = Car.objects.filter(name__iexact=brand).count()
    print(f'{brand:12} -> {count:3} cars')
    if count == 0:
        # Try partial matches
        partial = Car.objects.filter(name__icontains=brand).count()
        if partial > 0:
            print(f'  ^ Partial matches: {partial}')

print('\n=== BIKE BRANDS ANALYSIS ===')
db_bike_brands = set(Bike.objects.values_list('Bikename', flat=True).distinct())

for brand in bike_brands:
    count = Bike.objects.filter(Bikename__iexact=brand).count()
    print(f'{brand:12} -> {count:3} bikes')
    if count == 0:
        # Try partial matches
        partial = Bike.objects.filter(Bikename__icontains=brand).count()
        if partial > 0:
            print(f'  ^ Partial matches: {partial}')

print('\n=== BRANDS WITH NO DATA ===')
car_missing = [brand for brand in car_brands if Car.objects.filter(name__iexact=brand).count() == 0]
bike_missing = [brand for brand in bike_brands if Bike.objects.filter(Bikename__iexact=brand).count() == 0]

print(f'Car logos without data: {car_missing}')
print(f'Bike logos without data: {bike_missing}')
