from django.db.models.signals import post_save
from django.dispatch import receiver
from bikes.models import Bike
import random
import os

# Available bike images in media directory
BIKE_IMAGES = [
    'bike2.jpg',
    'bike2_5YBgK2Z.jpg', 
    'ktm.jpg',
    'ktm_DE8YbF5.jpg',
    'ktm_L32PZ2U.jpg',
    'ktm_SOiIMvB.jpg',
    'ktm_hd4BQAb.jpg',
    'ktm_vYDQJs1.jpg',
    'Royal_Enfield.jpeg',
    'Royal_Enfield_4J8D437.jpeg',
    'yamaha-fzs.jpg',
    'electric_bike.webp',
    'electric_bike_mqCJE9a.webp',
    'electric_bike_nnIsuq8.webp',
    'compare_bike.jpg',
    'Naked.jpg',
    'Hybrid_motercyle.jpg',
    'Bajaj_Service.jpg'
]

# Brand-specific image mappings
BRAND_IMAGE_MAPPING = {
    'HARLEY': ['bike2.jpg', 'compare_bike.jpg'],
    'KTM': ['ktm.jpg', 'ktm_DE8YbF5.jpg', 'ktm_L32PZ2U.jpg', 'ktm_SOiIMvB.jpg', 'ktm_hd4BQAb.jpg', 'ktm_vYDQJs1.jpg'],
    'YAMAHA': ['yamaha-fzs.jpg', 'bike2_5YBgK2Z.jpg'],
    'ROYAL': ['Royal_Enfield.jpeg', 'Royal_Enfield_4J8D437.jpeg'],
    'ROYAL ENFIELD': ['Royal_Enfield.jpeg', 'Royal_Enfield_4J8D437.jpeg'],
    'HONDA': ['bike2.jpg', 'compare_bike.jpg'],
    'KAWASAKI': ['bike2.jpg', 'compare_bike.jpg'],
    'BAJAJ': ['Bajaj_Service.jpg', 'bike2.jpg'],
    'HERO': ['bike2.jpg', 'compare_bike.jpg'],
    'DUCATI': ['Naked.jpg', 'compare_bike.jpg'],
    'BMW': ['bike2.jpg', 'compare_bike.jpg'],
    'SUZUKI': ['bike2.jpg', 'compare_bike.jpg'],
    'INDIAN': ['bike2.jpg', 'compare_bike.jpg'],
    'TRIUMPH': ['bike2.jpg', 'compare_bike.jpg']
}

def get_available_images():
    """Get list of available bike images from media directory"""
    media_path = 'media'
    available = []
    for img in BIKE_IMAGES:
        if os.path.exists(os.path.join(media_path, img)):
            available.append(img)
    return available

def assign_bike_image(bike_name):
    """Assign appropriate image based on bike brand"""
    bike_name_upper = bike_name.upper()
    
    # Find matching brand images
    for brand, brand_images in BRAND_IMAGE_MAPPING.items():
        if brand in bike_name_upper:
            available_images = [img for img in brand_images if os.path.exists(os.path.join('media', img))]
            if available_images:
                return random.choice(available_images)
    
    # Fallback to any available image
    all_available = get_available_images()
    return random.choice(all_available) if all_available else None

@receiver(post_save, sender=Bike)
def auto_assign_bike_image(sender, instance, created, **kwargs):
    """Automatically assign unique image to new bikes without images"""
    if created and not instance.image:
        # Assign appropriate image
        assigned_image = assign_bike_image(instance.Bikename)
        if assigned_image:
            instance.image = assigned_image
            # Save without triggering the signal again
            Bike.objects.filter(pk=instance.pk).update(image=assigned_image)
            print(f"Auto-assigned image '{assigned_image}' to new bike: {instance.Bikename} {instance.Bikemodel}")

def ensure_unique_images():
    """Ensure all bikes have unique images"""
    from collections import Counter
    
    all_bikes = Bike.objects.exclude(image='').exclude(image__isnull=True)
    image_counts = Counter([str(bike.image) for bike in all_bikes])
    
    # Find shared images
    shared_images = {img: count for img, count in image_counts.items() if count > 1}
    
    if shared_images:
        print(f"Found {len(shared_images)} shared image assignments, fixing...")
        
        for img, count in shared_images.items():
            bikes_with_img = Bike.objects.filter(image=img)
            available_images = [i for i in get_available_images() if i != img]
            
            if available_images and len(bikes_with_img) > 1:
                # Keep first bike with this image, assign new images to others
                first_bike = bikes_with_img.first()
                other_bikes = bikes_with_img.exclude(pk=first_bike.pk)
                
                for bike in other_bikes:
                    new_image = random.choice(available_images)
                    bike.image = new_image
                    bike.save()
                    print(f"Updated {bike.Bikename}: {img} -> {new_image}")
    
    print("Image uniqueness check completed!")

if __name__ == '__main__':
    # Run uniqueness check
    ensure_unique_images()
