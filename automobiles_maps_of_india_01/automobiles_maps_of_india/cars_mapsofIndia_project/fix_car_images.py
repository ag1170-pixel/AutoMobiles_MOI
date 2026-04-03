from cars.models import Car
import random
import os

def assign_unique_car_images():
    """Assign unique images to different cars to avoid sharing the same image"""
    
    # Available car images in media directory
    car_images = [
        'BMW.jpg',
        'wallpaper_1.jpg', 
        'snowy-mountain-peak-starry-galaxy-majesty-generative-ai.jpg'
    ]
    
    # Verify images exist
    media_path = 'media'
    available_images = []
    for img in car_images:
        if os.path.exists(os.path.join(media_path, img)):
            available_images.append(img)
            print(f"Found image: {img}")
        else:
            print(f"Missing image: {img}")
    
    if not available_images:
        print("No car images found!")
        return
    
    # Get all cars that have the shared wallpaper image
    shared_image_cars = Car.objects.filter(image='wallpaper_1_DzRbQwx.jpg')
    print(f"\nFound {shared_image_cars.count()} cars sharing the same image")
    
    # Assign unique images
    updated_count = 0
    for car in shared_image_cars:
        # Assign a random image from available images
        new_image = random.choice(available_images)
        car.image = new_image
        car.save()
        updated_count += 1
        
        if updated_count <= 10:  # Show first 10 updates
            print(f"Updated {car.name} {car.model}: {new_image}")
    
    print(f"\nSuccessfully updated {updated_count} cars with unique images!")
    
    # Verify Fortuner cars specifically
    fortuner_cars = Car.objects.filter(name__icontains='Fortuner')
    print(f"\nFortuner cars now have:")
    for car in fortuner_cars:
        print(f"  {car.name} {car.model}: {car.image}")

if __name__ == '__main__':
    assign_unique_car_images()
