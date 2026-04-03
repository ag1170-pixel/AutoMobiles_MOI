import os, django
os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'cardealer.settings')
django.setup()

from bikes.models import Bike
print('=== BIKES WITH MAXUS ===')
maxus_bikes = Bike.objects.filter(Bikename__icontains='maxus')
print(f'Bikes with Maxus: {maxus_bikes.count()}')
for bike in maxus_bikes:
    print(f'[{bike.Bikename}] - [{bike.Bikemodel}]')
