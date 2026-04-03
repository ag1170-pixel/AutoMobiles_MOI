from django.shortcuts import render
from bikes.models import Bike
import os

def debug_bike_images(request):
    """Debug view to check bike images directly"""
    print("=== DEBUG: Bike Image Check ===")
    
    # Get all bikes
    all_bikes = Bike.objects.all()
    print(f"Total bikes in database: {all_bikes.count()}")
    
    # Check image distribution
    from collections import Counter
    image_list = [str(bike.image) for bike in all_bikes if bike.image]
    image_counts = Counter(image_list)
    
    print("Image distribution:")
    for img, count in image_counts.most_common():
        print(f"  {img}: {count} bikes")
    
    # Get specific bikes to test
    test_bikes = ['Harley-Davidson', 'Kawasaki', 'Honda', 'KTM']
    
    bike_details = []
    for bike_name in test_bikes:
        bikes = Bike.objects.filter(Bikename__icontains=bike_name)
        for bike in bikes:
            detail = {
                'name': f"{bike.Bikename} {bike.Bikemodel}",
                'image_field': str(bike.image),
                'image_url': bike.image.url if bike.image else None,
                'file_exists': bike.image and os.path.exists(bike.image.path) if bike.image else False,
                'template_should_show': bike.image is not None
            }
            bike_details.append(detail)
    
    context = {
        'bike_details': bike_details,
        'total_bikes': all_bikes.count(),
        'image_distribution': dict(image_counts.most_common())
    }
    
    return render(request, 'debug_bike_images.html', context)
