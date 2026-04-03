from django.db import models
from django.core.validators import FileExtensionValidator
import os

def get_image_upload_path(instance, filename):
    """Generate upload path for images based on page reference"""
    if instance.page_reference:
        return os.path.join('images', instance.page_reference, filename)
    return os.path.join('images', 'general', filename)

def get_vehicle_image_upload_path(instance, filename):
    """Generate upload path for vehicle images based on vehicle type"""
    if instance.vehicle_type == 'car':
        return os.path.join('vehicle_images', 'cars', filename)
    elif instance.vehicle_type == 'bike':
        return os.path.join('vehicle_images', 'bikes', filename)
    return os.path.join('vehicle_images', 'general', filename)

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


class VehicleImage(models.Model):
    """Model to store dynamic images for vehicles (cars and bikes)"""
    
    VEHICLE_TYPE_CHOICES = [
        ('car', 'Car'),
        ('bike', 'Bike'),
    ]
    
    vehicle_type = models.CharField(
        max_length=10,
        choices=VEHICLE_TYPE_CHOICES,
        help_text="Type of vehicle (car or bike)"
    )
    brand = models.CharField(
        max_length=100,
        help_text="Vehicle brand (e.g., Toyota, Honda, Royal Enfield)"
    )
    category = models.CharField(
        max_length=100,
        blank=True,
        help_text="Vehicle category (e.g., SUV, Sedan, Sports Bike, Cruiser)"
    )
    model_name = models.CharField(
        max_length=100,
        blank=True,
        help_text="Specific model name this image is for"
    )
    image = models.ImageField(
        upload_to=get_vehicle_image_upload_path,
        validators=[FileExtensionValidator(allowed_extensions=['jpg', 'jpeg', 'png', 'gif', 'webp'])],
        help_text="Upload vehicle image"
    )
    alt_text = models.CharField(
        max_length=255,
        blank=True,
        help_text="Alt text for accessibility"
    )
    is_primary = models.BooleanField(
        default=False,
        help_text="Whether this is the primary image for the vehicle"
    )
    is_active = models.BooleanField(
        default=True,
        help_text="Whether this image is active"
    )
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)
    
    class Meta:
        db_table = 'vehicle_images'
        ordering = ['-is_primary', '-created_at']
        verbose_name = 'Vehicle Image'
        verbose_name_plural = 'Vehicle Images'
        indexes = [
            models.Index(fields=['vehicle_type', 'brand']),
            models.Index(fields=['vehicle_type', 'category']),
            models.Index(fields=['brand', 'model_name']),
        ]
    
    def __str__(self):
        return f"{self.brand} {self.model_name} ({self.vehicle_type})"
    
    @property
    def image_url(self):
        """Return the full URL of the image"""
        if self.image:
            return self.image.url
        return None
    
    def get_absolute_url(self):
        """Get absolute URL for the image"""
        return self.image_url if self.image_url else '/static/images/vehicle-placeholder.jpg'
