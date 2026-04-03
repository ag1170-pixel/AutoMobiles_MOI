#!/usr/bin/env python
import os
import sys
import django

# Setup Django
os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'cardealer.settings')
sys.path.append(os.path.dirname(os.path.abspath(__file__)))
django.setup()

from cars.models import Car

def test_image_display():
    """Test that car images are properly configured and accessible"""
    print("Testing car image display...")
    print("=" * 50)
    
    # Test the specific car from admin (ID 540)
    try:
        car = Car.objects.get(id=540)
        print(f"Car: {car.name} {car.model}")
        print(f"Image field: {car.image}")
        print(f"Image URL: {car.image.url if car.image else 'No image'}")
        print(f"Image path: {car.image.path if car.image else 'No image path'}")
        
        # Check if file exists
        if car.image:
            file_exists = os.path.exists(car.image.path)
            print(f"File exists: {file_exists}")
            
            if file_exists:
                file_size = os.path.getsize(car.image.path)
                print(f"File size: {file_size} bytes")
        
        print()
        
    except Car.DoesNotExist:
        print("Car with ID 540 not found")
    
    # Test a few more cars to see the pattern
    cars_with_images = Car.objects.exclude(image='').exclude(image__isnull=True)[:5]
    print(f"Found {cars_with_images.count()} cars with images:")
    
    for car in cars_with_images:
        print(f"- {car.name} {car.model}: {car.image}")
        if car.image:
            print(f"  URL: {car.image.url}")
    
    print()
    
    # Test cars without images
    cars_without_images = Car.objects.filter(Q(image='') | Q(image__isnull=True))[:3]
    print(f"Found {cars_without_images.count()} cars without images:")
    
    for car in cars_without_images:
        print(f"- {car.name} {car.model}: No image")

if __name__ == '__main__':
    from django.db.models import Q
    test_image_display()
