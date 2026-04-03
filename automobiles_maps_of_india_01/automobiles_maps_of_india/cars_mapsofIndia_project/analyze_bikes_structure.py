import os, django
os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'cardealer.settings')
django.setup()

from bikes.models import Bike

print('=== SAMPLE BIKE RECORDS ===')
bikes = Bike.objects.all()[:10]
for bike in bikes:
    print(f'Bikename: [{bike.Bikename}] | categoryBike: [{bike.categoryBike}] | Bikemodel: [{bike.Bikemodel}]')

print('\n=== HERO RECORDS ===')
hero = Bike.objects.filter(Bikename__icontains='hero')
for bike in hero[:5]:
    print(f'Bikename: [{bike.Bikename}] | categoryBike: [{bike.categoryBike}] | Bikemodel: [{bike.Bikemodel}]')

print('\n=== CATEGORYBIKE VALUES ===')
categories = Bike.objects.values_list('categoryBike', flat=True).distinct()
for cat in sorted(set(categories)):
    print(f'[{cat}]')
