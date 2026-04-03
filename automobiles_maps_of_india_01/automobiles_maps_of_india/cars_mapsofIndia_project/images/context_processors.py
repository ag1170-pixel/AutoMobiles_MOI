from .models import DynamicImage, VehicleImage

def dynamic_images_context(request):
    """
    Context processor to provide dynamic images to all templates
    """
    from .models import DynamicImage, VehicleImage
    
    # Get all active images grouped by page reference
    images_by_page = {}
    
    # Get vehicle images grouped by type and brand
    car_images_by_brand = {}
    bike_images_by_brand = {}
    
    try:
        # Get dynamic page images
        active_images = DynamicImage.objects.filter(is_active=True)
        
        for image in active_images:
            page_ref = image.page_reference
            if page_ref not in images_by_page:
                images_by_page[page_ref] = []
            
            images_by_page[page_ref].append({
                'id': image.id,
                'name': image.name,
                'image_url': image.image_url,
                'alt_text': image.alt_text or image.name,
            })
        
        # Get vehicle images
        vehicle_images = VehicleImage.objects.filter(is_active=True)
        
        for img in vehicle_images:
            image_data = {
                'id': img.id,
                'brand': img.brand,
                'category': img.category,
                'model_name': img.model_name,
                'image_url': img.image_url,
                'alt_text': img.alt_text or f"{img.brand} {img.model_name}",
                'is_primary': img.is_primary,
            }
            
            if img.vehicle_type == 'car':
                if img.brand not in car_images_by_brand:
                    car_images_by_brand[img.brand] = []
                car_images_by_brand[img.brand].append(image_data)
            elif img.vehicle_type == 'bike':
                if img.brand not in bike_images_by_brand:
                    bike_images_by_brand[img.brand] = []
                bike_images_by_brand[img.brand].append(image_data)
        
        # Add specific image shortcuts for common use cases
        context = {}
        context['dynamic_images'] = images_by_page
        
        # Add specific page image shortcuts
        context['auto_news_images'] = images_by_page.get('auto_news', [])
        context['truck_images'] = images_by_page.get('trucks', [])
        context['bus_images'] = images_by_page.get('buses', [])
        context['show_images'] = images_by_page.get('shows', [])
        context['used_car_images'] = images_by_page.get('used_cars', [])
        context['petrol_station_images'] = images_by_page.get('petrol_stations', [])
        context['about_images'] = images_by_page.get('about', [])
        
        # Add vehicle image shortcuts
        context['car_images_by_brand'] = car_images_by_brand
        context['bike_images_by_brand'] = bike_images_by_brand
        
    except Exception as e:
        # Return empty context in case of error
        context = {
            'dynamic_images': {},
            'auto_news_images': [],
            'truck_images': [],
            'bus_images': [],
            'show_images': [],
            'used_car_images': [],
            'petrol_station_images': [],
            'about_images': [],
            'car_images_by_brand': {},
            'bike_images_by_brand': {},
        }
    
    return context
