#!/usr/bin/env python
"""
Data migration script to convert prices from inconsistent formats to consistent integer rupees.

CARS: Currently stored as Lakhs in FloatField -> Convert to IntegerField in rupees
BIKES: Currently stored as Rupees in FloatField -> Convert to IntegerField in rupees
"""

import os
import sys
import django

# Setup Django
sys.path.append(os.path.dirname(os.path.abspath(__file__)))
os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'cardealer.settings')
django.setup()

from cars.models import Car
from bikes.models import Bike

def migrate_car_prices():
    """Convert car prices from Lakhs (float) to rupees (integer)"""
    print("=== MIGRATING CAR PRICES ===")
    cars = Car.objects.all()
    print(f"Processing {cars.count()} cars...")
    
    for car in cars:
        # Convert from Lakhs to rupees
        old_price_lakhs = car.price
        new_price_rupees = int(old_price_lakhs * 100000)
        
        print(f"  {car.name} {car.model}: {old_price_lakhs} Lakhs -> {new_price_rupees} rupees")
        
        # Update the price
        car.price = new_price_rupees
        car.save()
    
    print("✅ Car prices migrated successfully")

def migrate_bike_prices():
    """Convert bike prices from Rupees (float) to rupees (integer)"""
    print("\n=== MIGRATING BIKE PRICES ===")
    bikes = Bike.objects.all()
    print(f"Processing {bikes.count()} bikes...")
    
    for bike in bikes:
        # Convert from float rupees to integer rupees
        old_price_float = bike.price
        new_price_int = int(old_price_float)
        
        print(f"  {bike.Bikename} {bike.Bikemodel}: {old_price_float} -> {new_price_int} rupees")
        
        # Update the price
        bike.price = new_price_int
        bike.save()
    
    print("✅ Bike prices migrated successfully")

def verify_migration():
    """Verify the migration results"""
    print("\n=== VERIFICATION ===")
    
    # Check cars
    cars = Car.objects.all()[:5]
    print("Sample car prices after migration:")
    for car in cars:
        print(f"  {car.name} {car.model}: {car.price} rupees (type: {type(car.price)})")
    
    # Check bikes
    bikes = Bike.objects.all()[:5]
    print("\nSample bike prices after migration:")
    for bike in bikes:
        print(f"  {bike.Bikename} {bike.Bikemodel}: {bike.price} rupees (type: {type(bike.price)})")

if __name__ == "__main__":
    print("Starting price migration...")
    print("⚠️  This will convert all price data to integer rupees")
    print("⚠️  Make sure you have a database backup!")
    
    response = input("Continue? (y/N): ")
    if response.lower() == 'y':
        migrate_car_prices()
        migrate_bike_prices()
        verify_migration()
        print("\n🎉 Migration completed successfully!")
    else:
        print("Migration cancelled.")
