from django.shortcuts import render
from bikes.models import Bike
from django.http import JsonResponse
import os

def test_bike_search_images(request):
    """Test view to verify bike search shows correct images"""
    # Get a few sample bikes
    test_bikes = Bike.objects.all()[:6]
    
    bike_data = []
    for bike in test_bikes:
        bike_data = {
            'name': f"{bike.Bikename} {bike.Bikemodel}",
            'image_field': str(bike.image),
            'image_url': bike.image.url if bike.image else None,
            'image_exists': bike.image and bike.image.path and os.path.exists(bike.image.path) if bike.image else False
        }
        bike_data.append(bike_data)
    
    return render(request, 'test_bike_search.html', {'bikes': bike_data})

def test_bike_detail_images(request):
    """Test view to verify bike detail shows correct images"""
    # Get first bike for testing
    bike = Bike.objects.first()
    
    if bike:
        bike_data = {
            'name': f"{bike.Bikename} {bike.Bikemodel}",
            'image_field': str(bike.image),
            'image_url': bike.image.url if bike.image else None,
            'image_exists': bike.image and bike.image.path and os.path.exists(bike.image.path) if bike.image else False
        }
    else:
        bike_data = None
    
    return render(request, 'test_bike_detail.html', {'bike': bike_data})
