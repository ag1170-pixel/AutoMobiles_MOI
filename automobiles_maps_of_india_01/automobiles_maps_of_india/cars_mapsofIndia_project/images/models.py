from django.db import models
from django.core.validators import FileExtensionValidator
import os

def get_image_upload_path(instance, filename):
    """Generate upload path for images based on page reference"""
    if instance.page_reference:
        return os.path.join('images', instance.page_reference, filename)
    return os.path.join('images', 'general', filename)

class DynamicImage(models.Model):
    """Model to store dynamic images for different pages"""
    
    PAGE_CHOICES = [
        ('auto_news', 'Auto News Page'),
        ('trucks', 'Trucks Page'),
        ('buses', 'Buses Page'),
        ('shows', 'Auto Shows Page'),
        ('used_cars', 'Used Cars Page'),
        ('petrol_stations', 'Petrol Stations Page'),
        ('about', 'About Page'),
        ('general', 'General Purpose'),
    ]
    
    name = models.CharField(max_length=255, help_text="Descriptive name for the image")
    image = models.ImageField(
        upload_to=get_image_upload_path,
        validators=[FileExtensionValidator(allowed_extensions=['jpg', 'jpeg', 'png', 'gif', 'webp'])],
        help_text="Upload image file"
    )
    page_reference = models.CharField(
        max_length=50,
        choices=PAGE_CHOICES,
        default='general',
        help_text="Page where this image will be used"
    )
    alt_text = models.CharField(max_length=255, blank=True, help_text="Alt text for accessibility")
    is_active = models.BooleanField(default=True, help_text="Whether this image is active")
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)
    
    class Meta:
        db_table = 'dynamic_images'
        ordering = ['-created_at']
        verbose_name = 'Dynamic Image'
        verbose_name_plural = 'Dynamic Images'
    
    def __str__(self):
        return f"{self.name} ({self.page_reference})"
    
    @property
    def image_url(self):
        """Return the full URL of the image"""
        if self.image:
            return self.image.url
        return None
    
    def get_absolute_url(self):
        """Get absolute URL for the image"""
        return self.image_url if self.image_url else '/static/images/placeholder.jpg'
