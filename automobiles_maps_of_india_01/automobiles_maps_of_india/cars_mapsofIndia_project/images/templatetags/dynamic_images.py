from django import template
from ..models import DynamicImage

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
