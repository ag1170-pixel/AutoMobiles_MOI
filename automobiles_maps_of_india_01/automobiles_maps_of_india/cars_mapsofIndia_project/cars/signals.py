from django.db.models.signals import post_save
from django.dispatch import receiver
from cars.models import Car
import random
import os

# Available car images in media directory
CAR_IMAGES = [
    'BMW.jpg',
    'wallpaper_1.jpg',
    'snowy-mountain-peak-starry-galaxy-majesty-generative-ai.jpg',
    'snowy-mountain-peak-starry-galaxy-majesty-generative-ai_6hUfpmF.jpg',
    'snowy-mountain-peak-starry-galaxy-majesty-generative-ai_A8lLGBu.jpg'
]

# Category-specific image mappings
CATEGORY_IMAGE_MAPPING = {
    'TOYOTA': ['wallpaper_1.jpg', 'snowy-mountain-peak-starry-galaxy-majesty-generative-ai.jpg'],
    'HONDA': ['BMW.jpg', 'wallpaper_1.jpg'], 
    'FORD': ['snowy-mountain-peak-starry-galaxy-majesty-generative-ai.jpg', 'BMW.jpg'],
    'BMW': ['BMW.jpg', 'wallpaper_1.jpg'],
    'MERCEDES': ['wallpaper_1.jpg', 'snowy-mountain-peak-starry-galaxy-majesty-generative-ai.jpg'],
    'AUDI': ['snowy-mountain-peak-starry-galaxy-majesty-generative-ai.jpg', 'BMW.jpg'],
    'HYUNDAI': ['BMW.jpg', 'wallpaper_1.jpg'],
    'MAHINDRA': ['wallpaper_1.jpg', 'snowy-mountain-peak-starry-galaxy-majesty-generative-ai.jpg'],
    'TATA': ['snowy-mountain-peak-starry-galaxy-majesty-generative-ai.jpg', 'BMW.jpg'],
    'MARUTI': ['BMW.jpg', 'wallpaper_1.jpg'],
    'NISSAN': ['wallpaper_1.jpg', 'snowy-mountain-peak-starry-galaxy-majesty-generative-ai.jpg'],
    'KTM': ['snowy-mountain-peak-starry-galaxy-majesty-generative-ai.jpg', 'BMW.jpg'],
    'YAMAHA': ['BMW.jpg', 'wallpaper_1.jpg'],
    'BAJAJ': ['wallpaper_1.jpg', 'snowy-mountain-peak-starry-galaxy-majesty-generative-ai.jpg'],
    'HERO': ['snowy-mountain-peak-starry-galaxy-majesty-generative-ai.jpg', 'BMW.jpg'],
    'ROYAL ENFIELD': ['BMW.jpg', 'wallpaper_1.jpg'],
    'DUCATI': ['wallpaper_1.jpg', 'snowy-mountain-peak-starry-galaxy-majesty-generative-ai.jpg'],
    'SUZUKI': ['snowy-mountain-peak-starry-galaxy-majesty-generative-ai.jpg', 'BMW.jpg'],
    'MOTORS': ['wallpaper_1.jpg', 'snowy-mountain-peak-starry-galaxy-majesty-generative-ai.jpg']
}

def get_available_car_images():
    """Get list of available car images from media directory"""
    media_path = 'media'
    available = []
    for img in CAR_IMAGES:
        if os.path.exists(os.path.join(media_path, img)):
            available.append(img)
    return available

def assign_car_image(car_category):
    """Assign appropriate image based on car category"""
    if not car_category:
        car_category = ''
    
    category_upper = car_category.upper()
    
    # Find matching category images
    for category, category_images in CATEGORY_IMAGE_MAPPING.items():
        if category in category_upper:
            available_images = [img for img in category_images if os.path.exists(os.path.join('media', img))]
            if available_images:
                return random.choice(available_images)
    
    # Fallback to any available image
    all_available = get_available_car_images()
    return random.choice(all_available) if all_available else None

@receiver(post_save, sender=Car)
def auto_assign_car_image(sender, instance, created, **kwargs):
    """Automatically assign unique image to new cars without images"""
    if created and not instance.image:
        # Assign appropriate image
        assigned_image = assign_car_image(instance.category)
        if assigned_image:
            instance.image = assigned_image
            # Save without triggering the signal again
            Car.objects.filter(pk=instance.pk).update(image=assigned_image)
            print(f"Auto-assigned image '{assigned_image}' to new car: {instance.name} {instance.model}")

def ensure_unique_car_images():
    """Ensure all cars have unique images"""
    from collections import Counter
    
    all_cars = Car.objects.exclude(image='').exclude(image__isnull=True)
    image_counts = Counter([str(car.image) for car in all_cars])
    
    # Find shared images
    shared_images = {img: count for img, count in image_counts.items() if count > 1}
    
    if shared_images:
        print(f"Found {len(shared_images)} shared car image assignments, fixing...")
        
        for img, count in shared_images.items():
            cars_with_img = Car.objects.filter(image=img)
            available_images = [i for i in get_available_car_images() if i != img]
            
            if available_images and len(cars_with_img) > 1:
                # Keep first car with this image, assign new images to others
                first_car = cars_with_img.first()
                other_cars = cars_with_img.exclude(pk=first_car.pk)
                
                for car in other_cars:
                    new_image = random.choice(available_images)
                    car.image = new_image
                    car.save()
                    print(f"Updated {car.name} {car.model}: {img} -> {new_image}")
    
    print("Car image uniqueness check completed!")

if __name__ == '__main__':
    # Run uniqueness check
    ensure_unique_car_images()
