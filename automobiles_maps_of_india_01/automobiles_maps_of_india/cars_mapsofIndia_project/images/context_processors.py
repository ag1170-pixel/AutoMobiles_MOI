from .models import DynamicImage

def dynamic_images_context(request):
    """
    Context processor to provide dynamic images to all templates
    """
    from .models import DynamicImage
    
    # Get all active images grouped by page reference
    images_by_page = {}
    
    try:
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
        }
    
    return context
