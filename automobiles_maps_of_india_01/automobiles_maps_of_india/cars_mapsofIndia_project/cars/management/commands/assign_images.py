from django.core.management.base import BaseCommand
from django.db.models.signals import post_save
from django.dispatch import receiver
from cars.models import Car
from bikes.models import Bike
import random
import os

class Command(BaseCommand):
    help = 'Assign unique images to cars and bikes dynamically'

    def add_arguments(self, parser):
        parser.add_argument(
            '--type',
            type=str,
            choices=['cars', 'bikes', 'all'],
            default='all',
            help='What to assign images to (cars, bikes, or all)'
        )
        parser.add_argument(
            '--force',
            action='store_true',
            help='Force reassignment of all images'
        )

    def handle(self, *args, **options):
        vehicle_type = options['type']
        force = options['force']
        
        if vehicle_type in ['cars', 'all']:
            self.handle_cars(force)
        
        if vehicle_type in ['bikes', 'all']:
            self.handle_bikes(force)
        
        self.stdout.write(self.style.SUCCESS('Image assignment completed!'))

    def handle_cars(self, force):
        """Handle car image assignment"""
        from collections import Counter
        
        all_cars = Car.objects.exclude(image='').exclude(image__isnull=True)
        
        if force:
            self.stdout.write('Force reassigning all car images...')
            # Category-specific assignment for all cars
            car_images = ['BMW.jpg', 'wallpaper_1.jpg', 'snowy-mountain-peak-starry-galaxy-majesty-generative-ai.jpg']
            
            for car in all_cars:
                # Assign based on category
                if car.category:
                    category_upper = car.category.upper()
                    if 'TOYOTA' in category_upper:
                        car.image = random.choice(['wallpaper_1.jpg', 'snowy-mountain-peak-starry-galaxy-majesty-generative-ai.jpg'])
                    elif 'BMW' in category_upper:
                        car.image = 'BMW.jpg'
                    elif 'HONDA' in category_upper:
                        car.image = random.choice(['BMW.jpg', 'wallpaper_1.jpg'])
                    elif 'FORD' in category_upper:
                        car.image = random.choice(['snowy-mountain-peak-starry-galaxy-majesty-generative-ai.jpg', 'BMW.jpg'])
                    else:
                        car.image = random.choice(car_images)
                else:
                    car.image = random.choice(car_images)
                
                car.save()
            
            self.stdout.write(f'Updated {all_cars.count()} cars with category-specific images')
        else:
            # Only fix shared images
            image_counts = Counter([str(car.image) for car in all_cars])
            shared_images = {img: count for img, count in image_counts.items() if count > 1}
            
            if shared_images:
                self.stdout.write(f'Fixing {len(shared_images)} shared car images...')
                
                for img, count in shared_images.items():
                    cars_with_img = Car.objects.filter(image=img)
                    if len(cars_with_img) > 1:
                        # Keep first, assign new to others
                        first_car = cars_with_img.first()
                        other_cars = cars_with_img.exclude(pk=first_car.pk)
                        
                        for car in other_cars:
                            car.image = random.choice(['BMW.jpg', 'wallpaper_1.jpg', 'snowy-mountain-peak-starry-galaxy-majesty-generative-ai.jpg'])
                            car.save()
                
                self.stdout.write('Car image uniqueness ensured!')
            else:
                self.stdout.write('All cars already have unique images!')

    def handle_bikes(self, force):
        """Handle bike image assignment"""
        from collections import Counter
        
        all_bikes = Bike.objects.exclude(image='').exclude(image__isnull=True)
        
        # Available bike images
        bike_images = ['bike2.jpg', 'yamaha-fzs.jpg', 'ktm.jpg', 'Royal_Enfield.jpeg', 'compare_bike.jpg', 'Naked.jpg', 'Bajaj_Service.jpg']
        
        if force:
            self.stdout.write('Force reassigning all bike images...')
            
            for bike in all_bikes:
                # Assign based on brand
                bike_name_upper = bike.Bikename.upper()
                
                if 'HARLEY' in bike_name_upper:
                    bike.image = random.choice(['bike2.jpg', 'compare_bike.jpg'])
                elif 'KTM' in bike_name_upper:
                    bike.image = random.choice(['ktm.jpg', 'ktm_DE8YbF5.jpg', 'ktm_L32PZ2U.jpg'])
                elif 'YAMAHA' in bike_name_upper:
                    bike.image = random.choice(['yamaha-fzs.jpg', 'bike2_5YBgK2Z.jpg'])
                elif 'ROYAL' in bike_name_upper or 'ENFIELD' in bike_name_upper:
                    bike.image = random.choice(['Royal_Enfield.jpeg', 'Royal_Enfield_4J8D437.jpeg'])
                elif 'BAJAJ' in bike_name_upper:
                    bike.image = random.choice(['Bajaj_Service.jpg', 'bike2.jpg'])
                elif 'DUCATI' in bike_name_upper:
                    bike.image = random.choice(['Naked.jpg', 'compare_bike.jpg'])
                else:
                    bike.image = random.choice(bike_images)
                
                bike.save()
            
            self.stdout.write(f'Updated {all_bikes.count()} bikes with brand-specific images')
        else:
            # Only fix shared images
            image_counts = Counter([str(bike.image) for bike in all_bikes])
            shared_images = {img: count for img, count in image_counts.items() if count > 1}
            
            if shared_images:
                self.stdout.write(f'Fixing {len(shared_images)} shared bike images...')
                
                for img, count in shared_images.items():
                    bikes_with_img = Bike.objects.filter(image=img)
                    if len(bikes_with_img) > 1:
                        # Keep first, assign new to others
                        first_bike = bikes_with_img.first()
                        other_bikes = bikes_with_img.exclude(pk=first_bike.pk)
                        
                        for bike in other_bikes:
                            bike.image = random.choice(bike_images)
                            bike.save()
                
                self.stdout.write('Bike image uniqueness ensured!')
            else:
                self.stdout.write('All bikes already have unique images!')
