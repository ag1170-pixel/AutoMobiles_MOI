#!/usr/bin/env python
import os
import django

# Set up Django
os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'cardealer.settings')
django.setup()

from cars.models import PetrolPump
from django.db import connection

def test_petrol_pump():
    """Test Petrol Pump Finder functionality"""
    print("=== PETROL PUMP FINDER TEST ===")
    
    # Test database connection
    try:
        with connection.cursor() as cursor:
            cursor.execute("SELECT 1")
            result = cursor.fetchone()
            print(f"✓ Database connection successful: {result}")
    except Exception as e:
        print(f"✗ Database connection failed: {e}")
        return False
    
    # Test PetrolPump model
    print("\n=== PETROL PUMP MODEL TEST ===")
    try:
        pump_count = PetrolPump.objects.count()
        print(f"✓ PetrolPump model accessible - Total records: {pump_count}")
        
        if pump_count > 0:
            print("Sample records:")
            for i, pump in enumerate(PetrolPump.objects.all()[:5]):
                print(f"  {i+1}. {pump.name} - {pump.location}, {pump.state}")
            
            # Test search functionality
            print("\n=== SEARCH FUNCTIONALITY TEST ===")
            locations = PetrolPump.objects.values_list('location', flat=True).distinct()
            print(f"Available locations: {list(locations)[:10]}...")  # Show first 10
            
            states = PetrolPump.objects.values_list('state', flat=True).distinct()
            print(f"Available states: {list(states)}")
            
            # Test companies
            companies = PetrolPump.objects.values_list('company_name', flat=True).distinct()
            print(f"Available companies: {list(companies)[:5]}...")
            
        else:
            print("  No records found in PetrolPump model")
            return False
            
    except Exception as e:
        print(f"✗ PetrolPump model error: {e}")
        return False
    
    print(f"\n✓ Petrol Pump Finder is working with {pump_count} records")
    return True

if __name__ == "__main__":
    test_petrol_pump()
