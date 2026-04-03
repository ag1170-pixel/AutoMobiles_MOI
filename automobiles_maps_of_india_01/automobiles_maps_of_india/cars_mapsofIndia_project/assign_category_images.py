from cars.models import Car
import random
import os

def assign_category_specific_images():
    """Assign specific images to different car categories for better organization"""
    
    # Define category to image mappings
    category_image_mapping = {
        'TOYOTA': 'wallpaper_1.jpg',
        'HONDA': 'BMW.jpg', 
        'FORD': 'snowy-mountain-peak-starry-galaxy-majesty-generative-ai.jpg',
        'BMW': 'BMW.jpg',
        'MERCEDES': 'wallpaper_1.jpg',
        'AUDI': 'snowy-mountain-peak-starry-galaxy-majesty-generative-ai.jpg',
        'HYUNDAI': 'BMW.jpg',
        'MAHINDRA': 'wallpaper_1.jpg',
        'TATA': 'snowy-mountain-peak-starry-galaxy-majesty-generative-ai.jpg',
        'MARUTI': 'BMW.jpg',
        'NISSAN': 'wallpaper_1.jpg',
        'KTM': 'snowy-mountain-peak-starry-galaxy-majesty-generative-ai.jpg',
        'YAMAHA': 'BMW.jpg',
        'BAJAJ': 'wallpaper_1.jpg',
        'HERO': 'snowy-mountain-peak-starry-galaxy-majesty-generative-ai.jpg',
        'ROYAL ENFIELD': 'BMW.jpg',
        'DUcati': 'wallpaper_1.jpg',
        'SUZUKI': 'snowy-mountain-peak-starry-galaxy-majesty-generative-ai.jpg',
    }
    
    # Available fallback images
    fallback_images = ['BMW.jpg', 'wallpaper_1.jpg', 'snowy-mountain-peak-starry-galaxy-majesty-generative-ai.jpg']
    
    # Get all unique categories
    categories = Car.objects.values_list('category', flat=True).distinct()
    print(f"Processing {len(categories)} categories...")
    
    total_updated = 0
    for category in categories:
        # Find matching image for this category
        assigned_image = None
        category_upper = category.upper()
        
        for key, image in category_image_mapping.items():
            if key in category_upper:
                assigned_image = image
                break
        
        # If no specific mapping, use random fallback
        if not assigned_image:
            assigned_image = random.choice(fallback_images)
        
        # Update all cars in this category
        cars_in_category = Car.objects.filter(category=category)
        count = cars_in_category.count()
        
        # For variety within category, randomly assign from category-specific or fallback images
        category_images = [assigned_image] + fallback_images
        for car in cars_in_category:
            car.image = random.choice(category_images)
            car.save()
            total_updated += 1
        
        print(f"Updated {count} cars in category '{category}' with images from {category_images}")
    
    print(f"\nTotal cars updated: {total_updated}")
    
    # Show sample results
    print("\nSample results:")
    for category in categories[:5]:
        sample_car = Car.objects.filter(category=category).first()
        if sample_car:
            print(f"  {category}: {sample_car.name} -> {sample_car.image}")

if __name__ == '__main__':
    assign_category_specific_images()
