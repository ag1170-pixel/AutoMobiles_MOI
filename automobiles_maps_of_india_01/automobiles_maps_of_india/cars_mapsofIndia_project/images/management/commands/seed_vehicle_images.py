from django.core.management.base import BaseCommand
from django.core.files import File
import os
from images.models import VehicleImage
from cars.models import Car
from bikes.models import Bike

class Command(BaseCommand):
    help = 'Seed the database with sample vehicle images'
    
    def handle(self, *args, **options):
        self.stdout.write('Starting to seed vehicle images...')
        
        # Get some sample cars and bikes from the database
        cars = Car.objects.all()[:10]  # Get first 10 cars
        bikes = Bike.objects.all()[:10]  # Get first 10 bikes
        
        # Sample vehicle images data
        sample_images = [
            # Car images
            {
                'vehicle_type': 'car',
                'brand': 'Toyota',
                'category': 'SUV',
                'model_name': 'Fortuner',
                'alt_text': 'Toyota Fortuner SUV',
                'is_primary': True
            },
            {
                'vehicle_type': 'car',
                'brand': 'Honda',
                'category': 'Sedan',
                'model_name': 'City',
                'alt_text': 'Honda City Sedan',
                'is_primary': True
            },
            {
                'vehicle_type': 'car',
                'brand': 'Hyundai',
                'category': 'Hatchback',
                'model_name': 'i20',
                'alt_text': 'Hyundai i20 Hatchback',
                'is_primary': True
            },
            {
                'vehicle_type': 'car',
                'brand': 'Tata Motors',
                'category': 'SUV',
                'model_name': 'Nexon',
                'alt_text': 'Tata Nexon SUV',
                'is_primary': True
            },
            {
                'vehicle_type': 'car',
                'brand': 'Maruti Suzuki',
                'category': 'Hatchback',
                'model_name': 'Swift',
                'alt_text': 'Maruti Suzuki Swift Hatchback',
                'is_primary': True
            },
            # Bike images
            {
                'vehicle_type': 'bike',
                'brand': 'Royal Enfield',
                'category': 'Cruiser',
                'model_name': 'Classic 350',
                'alt_text': 'Royal Enfield Classic 350 Cruiser',
                'is_primary': True
            },
            {
                'vehicle_type': 'bike',
                'brand': 'Honda',
                'category': 'Sports Bike',
                'model_name': 'CBR',
                'alt_text': 'Honda CBR Sports Bike',
                'is_primary': True
            },
            {
                'vehicle_type': 'bike',
                'brand': 'Bajaj',
                'category': 'Commuter',
                'model_name': 'Pulsar',
                'alt_text': 'Bajaj Pulsar Commuter Bike',
                'is_primary': True
            },
            {
                'vehicle_type': 'bike',
                'brand': 'TVS',
                'category': 'Sports Bike',
                'model_name': 'Apache',
                'alt_text': 'TVS Apache Sports Bike',
                'is_primary': True
            },
            {
                'vehicle_type': 'bike',
                'brand': 'Hero',
                'category': 'Commuter',
                'model_name': 'Splendor',
                'alt_text': 'Hero Splendor Commuter Bike',
                'is_primary': True
            }
        ]
        
        # Get the project root directory
        base_path = os.path.dirname(os.path.dirname(os.path.dirname(os.path.dirname(__file__))))
        
        # Create placeholder images directory if it doesn't exist
        placeholder_dir = os.path.join(base_path, 'media', 'vehicle_images')
        os.makedirs(placeholder_dir, exist_ok=True)
        os.makedirs(os.path.join(placeholder_dir, 'cars'), exist_ok=True)
        os.makedirs(os.path.join(placeholder_dir, 'bikes'), exist_ok=True)
        
        created_count = 0
        updated_count = 0
        
        for img_data in sample_images:
            # Check if image already exists
            existing_image = VehicleImage.objects.filter(
                vehicle_type=img_data['vehicle_type'],
                brand=img_data['brand'],
                model_name=img_data['model_name']
            ).first()
            
            if existing_image:
                self.stdout.write(
                    self.style.WARNING(f'Vehicle image for {img_data["brand"]} {img_data["model_name"]} already exists')
                )
                updated_count += 1
                continue
            
            # Try to find existing vehicle image from the database
            vehicle = None
            if img_data['vehicle_type'] == 'car':
                vehicle = Car.objects.filter(
                    name__icontains=img_data['brand'],
                    model__icontains=img_data['model_name']
                ).first()
            elif img_data['vehicle_type'] == 'bike':
                vehicle = Bike.objects.filter(
                    Bikename__icontains=img_data['brand'],
                    Bikemodel__icontains=img_data['model_name']
                ).first()
            
            # Create VehicleImage instance
            try:
                vehicle_image = VehicleImage.objects.create(
                    vehicle_type=img_data['vehicle_type'],
                    brand=img_data['brand'],
                    category=img_data['category'],
                    model_name=img_data['model_name'],
                    alt_text=img_data['alt_text'],
                    is_primary=img_data['is_primary'],
                    is_active=True
                )
                
                # If we found a vehicle with an existing image, copy it
                if vehicle and hasattr(vehicle, 'image') and vehicle.image:
                    try:
                        # Copy existing vehicle image
                        vehicle_image.image.save(
                            f'{img_data["brand"]}_{img_data["model_name"]}.jpg',
                            File(open(vehicle.image.path, 'rb')),
                            save=True
                        )
                    except Exception as e:
                        self.stdout.write(
                            self.style.WARNING(f'Could not copy image for {img_data["brand"]} {img_data["model_name"]}: {str(e)}')
                        )
                
                created_count += 1
                self.stdout.write(
                    self.style.SUCCESS(f'Created vehicle image: {img_data["brand"]} {img_data["model_name"]} ({img_data["vehicle_type"]})')
                )
                
            except Exception as e:
                self.stdout.write(
                    self.style.ERROR(f'Error creating vehicle image for {img_data["brand"]} {img_data["model_name"]}: {str(e)}')
                )
        
        self.stdout.write(
            self.style.SUCCESS(f'Vehicle image seeding completed! Created: {created_count}, Already existed: {updated_count}')
        )
