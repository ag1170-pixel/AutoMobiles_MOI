#!/usr/bin/env python
import os
import sys
import django

# Setup Django
sys.path.append(os.path.dirname(os.path.abspath(__file__)))
os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'cardealer.settings')
django.setup()

from bikes.models import Bike

print('=== BIKE DATA ANALYSIS ===')
print('Sample bike data:')
for bike in Bike.objects.all()[:5]:
    print(f'  {bike.Bikename} - {bike.categoryBike} - {bike.Bikemodel} - ₹{bike.price:,.0f}')

print('\nBike names (brands):')
bike_names = Bike.objects.values_list('Bikename', flat=True).distinct()
for name in bike_names:
    print(f'  "{name}"')

print('\nBike categories (types):')
categories = Bike.objects.values_list('categoryBike', flat=True).distinct()
for cat in categories:
    print(f'  "{cat}"')
