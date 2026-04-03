from django.shortcuts import render, get_object_or_404
from django.http import JsonResponse, HttpResponse
from django.core.paginator import Paginator
from django.views.decorators.http import require_http_methods
from django.views.decorators.csrf import csrf_exempt
from django.core.files.storage import default_storage
from django.core.files.base import ContentFile
import json
import os
from .models import DynamicImage

def get_images_by_page(request, page_reference):
    """
    API endpoint to fetch images for a specific page
    GET /images/{page}/
    """
    images = DynamicImage.objects.filter(
        page_reference=page_reference, 
        is_active=True
    ).order_by('name')
    
    image_data = []
    for img in images:
        image_data.append({
            'id': img.id,
            'name': img.name,
            'image_url': img.image_url,
            'alt_text': img.alt_text,
            'page_reference': img.page_reference,
        })
    
    return JsonResponse({
        'success': True,
        'images': image_data,
        'count': len(image_data)
    })

def get_all_images(request):
    """
    API endpoint to fetch all active images
    GET /images/
    """
    images = DynamicImage.objects.filter(is_active=True).order_by('page_reference', 'name')
    
    # Group by page reference
    grouped_images = {}
    for img in images:
        page = img.page_reference
        if page not in grouped_images:
            grouped_images[page] = []
        grouped_images[page].append({
            'id': img.id,
            'name': img.name,
            'image_url': img.image_url,
            'alt_text': img.alt_text,
        })
    
    return JsonResponse({
        'success': True,
        'images': grouped_images,
        'count': len(images)
    })

def get_image_by_id(request, image_id):
    """
    API endpoint to fetch a specific image by ID
    GET /images/detail/{id}/
    """
    image = get_object_or_404(DynamicImage, id=image_id, is_active=True)
    
    return JsonResponse({
        'success': True,
        'image': {
            'id': image.id,
            'name': image.name,
            'image_url': image.image_url,
            'alt_text': image.alt_text,
            'page_reference': image.page_reference,
            'created_at': image.created_at.isoformat(),
        }
    })

@csrf_exempt
@require_http_methods(["POST"])
def upload_image(request):
    """
    API endpoint to upload a new image
    POST /images/upload/
    """
    try:
        data = json.loads(request.body)
        name = data.get('name')
        page_reference = data.get('page_reference', 'general')
        alt_text = data.get('alt_text', '')
        
        if not name:
            return JsonResponse({
                'success': False,
                'error': 'Image name is required'
            }, status=400)
        
        # Handle file upload (in a real implementation, you'd handle multipart form data)
        # For now, we'll create a placeholder
        image = DynamicImage.objects.create(
            name=name,
            page_reference=page_reference,
            alt_text=alt_text,
        )
        
        return JsonResponse({
            'success': True,
            'image': {
                'id': image.id,
                'name': image.name,
                'page_reference': image.page_reference,
                'alt_text': image.alt_text,
            }
        })
        
    except json.JSONDecodeError:
        return JsonResponse({
            'success': False,
            'error': 'Invalid JSON data'
        }, status=400)
    except Exception as e:
        return JsonResponse({
            'success': False,
            'error': str(e)
        }, status=500)

def get_fallback_image(request, page_reference, image_name):
    """
    Helper function to get fallback image for a page
    Returns the first available image for the page or a default placeholder
    """
    image = DynamicImage.objects.filter(
        page_reference=page_reference,
        is_active=True
    ).first()
    
    if image:
        return JsonResponse({
            'success': True,
            'image_url': image.image_url,
            'alt_text': image.alt_text or image.name,
        })
    
    # Return default placeholder
    return JsonResponse({
        'success': False,
        'fallback_url': '/static/images/placeholder.jpg',
        'message': 'No images found for this page'
    })
