from django import template
from ..models import DynamicImage, VehicleImage

register = template.Library()

@register.simple_tag
def get_dynamic_image(page_reference, fallback_url=None):
    """
    Template tag to get the first available dynamic image for a page
    Usage: {% get_dynamic_image 'auto_news' '/static/img/car-1.jpg' %}
    """
    try:
        image = DynamicImage.objects.filter(
            page_reference=page_reference, 
            is_active=True
        ).first()
        
        if image and image.image:
            return image.image.url
        elif fallback_url:
            return fallback_url
        else:
            return '/static/images/placeholder.jpg'
    except Exception:
        return fallback_url or '/static/images/placeholder.jpg'

@register.simple_tag
def get_dynamic_images(page_reference, limit=3):
    """
    Template tag to get multiple dynamic images for a page
    Usage: {% get_dynamic_images 'auto_news' 3 %}
    """
    try:
        images = DynamicImage.objects.filter(
            page_reference=page_reference, 
            is_active=True
        )[:limit]
        
        return [{'url': img.image.url if img.image else None, 'alt': img.alt_text or img.name} 
                for img in images if img.image]
    except Exception:
        return []

@register.simple_tag
def get_vehicle_image(vehicle_type, brand, category=None, model_name=None, fallback_url=None):
    """
    Template tag to get the primary vehicle image for a specific vehicle
    Usage: {% get_vehicle_image 'car' 'Toyota' 'SUV' 'Fortuner' '/static/img/car-placeholder.jpg' %}
    """
    try:
        # Try to find primary image first
        image = VehicleImage.objects.filter(
            vehicle_type=vehicle_type,
            brand__iexact=brand,
            is_active=True
        )
        
        if category:
            image = image.filter(category__iexact=category)
        if model_name:
            image = image.filter(model_name__iexact=model_name)
            
        image = image.filter(is_primary=True).first()
        
        # If no primary image found, get any image
        if not image:
            image = VehicleImage.objects.filter(
                vehicle_type=vehicle_type,
                brand__iexact=brand,
                is_active=True
            )
            
            if category:
                image = image.filter(category__iexact=category)
            if model_name:
                image = image.filter(model_name__iexact=model_name)
                
            image = image.first()
        
        if image and image.image:
            return image.image.url
        elif fallback_url:
            return fallback_url
        else:
            return f'/static/images/{vehicle_type}-placeholder.jpg'
    except Exception:
        return fallback_url or f'/static/images/{vehicle_type}-placeholder.jpg'

@register.simple_tag
def get_vehicle_images(vehicle_type, brand, limit=5):
    """
    Template tag to get multiple vehicle images for a brand
    Usage: {% get_vehicle_images 'car' 'Toyota' 5 %}
    """
    try:
        images = VehicleImage.objects.filter(
            vehicle_type=vehicle_type,
            brand__iexact=brand,
            is_active=True
        )[:limit]
        
        return [{
            'url': img.image.url if img.image else None, 
            'alt': img.alt_text or f"{img.brand} {img.model_name}",
            'is_primary': img.is_primary,
            'model_name': img.model_name,
            'category': img.category
        } for img in images if img.image]
    except Exception:
        return []

@register.simple_tag
def get_brand_logo(vehicle_type, brand, fallback_url=None):
    """
    Template tag to get brand logo or primary vehicle image as logo
    Usage: {% get_brand_logo 'car' 'Toyota' '/static/img/toyota-logo.png' %}
    """
    return get_vehicle_image(vehicle_type, brand, None, None, fallback_url)
