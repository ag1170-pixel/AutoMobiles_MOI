#!/usr/bin/env python
import os
import sys
import django

# Setup Django
sys.path.append(os.path.dirname(os.path.abspath(__file__)))
os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'cardealer.settings')
django.setup()

from django.db import models
from cars.models import Car
from bikes.models import Bike

print('=== CURRENT PRICE DATA ANALYSIS ===')

print('\nCARS - Current price data:')
print('Sample car prices:')
for car in Car.objects.all()[:10]:
    print(f'  {car.name} {car.model} - price: {car.price} (type: {type(car.price)})')

print(f'\nCars price range: {Car.objects.aggregate(min=models.Min("price"), max=models.Max("price"))}')
print(f'Total cars: {Car.objects.count()}')

print('\nBIKES - Current price data:')
print('Sample bike prices:')
for bike in Bike.objects.all()[:10]:
    print(f'  {bike.Bikename} {bike.Bikemodel} - price: {bike.price} (type: {type(bike.price)})')

print(f'\nBikes price range: {Bike.objects.aggregate(min=models.Min("price"), max=models.Max("price"))}')
print(f'Total bikes: {Bike.objects.count()}')
