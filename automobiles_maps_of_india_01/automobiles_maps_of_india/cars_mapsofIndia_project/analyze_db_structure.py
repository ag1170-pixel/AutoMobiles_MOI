import os, django
os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'cardealer.settings')
django.setup()

from cars.models import Car

print('=== SAMPLE CAR RECORDS ===')
cars = Car.objects.all()[:10]
for car in cars:
    print(f'Name: [{car.name}] | Category: [{car.category}] | Model: [{car.model}] | Manufacturer: [{car.manufacturer}]')

print('\n=== TOYOTA RECORDS ===')
toyota = Car.objects.filter(name__icontains='toyota')
for car in toyota[:5]:
    print(f'Name: [{car.name}] | Category: [{car.category}] | Model: [{car.model}]')

print('\n=== HONDA RECORDS ===')
honda = Car.objects.filter(name__icontains='honda')
for car in honda[:5]:
    print(f'Name: [{car.name}] | Category: [{car.category}] | Model: [{car.model}]')

print('\n=== CATEGORY VALUES ===')
categories = Car.objects.values_list('category', flat=True).distinct()
for cat in sorted(set(categories))[:20]:
    print(f'[{cat}]')

print('\n=== MANUFACTURER CHOICES ===')
from cars.models import Car
print(Car.MANUFACTURER_CHOICES)
