from django.core.management.base import BaseCommand
from django.core.files import File
import os
from images.models import DynamicImage

class Command(BaseCommand):
    help = 'Seed the database with initial images from static files'
    
    def handle(self, *args, **options):
        # Define image mappings
        image_mappings = [
            {
                'name': 'Auto News Fallback 1',
                'static_path': 'static/image/img.png',
                'page_reference': 'auto_news',
                'alt_text': 'Auto news placeholder image 1'
            },
            {
                'name': 'CNG Price Map',
                'static_path': 'static/image/CNG_Price_in_India.jpg',
                'page_reference': 'petrol_stations',
                'alt_text': 'CNG Price Map of India'
            },
            {
                'name': 'India Map',
                'static_path': 'static/image/India Map.jpg',
                'page_reference': 'general',
                'alt_text': 'Map of India'
            },
            {
                'name': 'Diesel Price Map',
                'static_path': 'static/image/Diesel_price_maps.jpg',
                'page_reference': 'petrol_stations',
                'alt_text': 'Diesel Price Map of India'
            },
            {
                'name': 'Petrol Price Map',
                'static_path': 'static/image/Petrol Price in India.jpg',
                'page_reference': 'petrol_stations',
                'alt_text': 'Petrol Price Map of India'
            },
        ]
        
        # Get the project root directory (go up from management/commands/)
        base_path = os.path.dirname(os.path.dirname(os.path.dirname(os.path.dirname(__file__))))
        
        for mapping in image_mappings:
            # Check if image already exists
            if DynamicImage.objects.filter(name=mapping['name']).exists():
                self.stdout.write(
                    self.style.WARNING(f'Image "{mapping["name"]}" already exists')
                )
                continue
            
            # Get the static file path
            static_file_path = os.path.join(base_path, mapping['static_path'])
            
            if os.path.exists(static_file_path):
                try:
                    # Create DynamicImage instance
                    with open(static_file_path, 'rb') as f:
                        image_instance = DynamicImage.objects.create(
                            name=mapping['name'],
                            page_reference=mapping['page_reference'],
                            alt_text=mapping['alt_text']
                        )
                        image_instance.image.save(
                            os.path.basename(static_file_path),
                            File(f),
                            save=True
                        )
                    
                    self.stdout.write(
                        self.style.SUCCESS(f'Successfully created image: {mapping["name"]}')
                    )
                    
                except Exception as e:
                    self.stdout.write(
                        self.style.ERROR(f'Error creating image "{mapping["name"]}": {str(e)}')
                    )
            else:
                self.stdout.write(
                    self.style.WARNING(f'Static file not found: {static_file_path}')
                )
        
        self.stdout.write(
            self.style.SUCCESS('Image seeding completed!')
        )
