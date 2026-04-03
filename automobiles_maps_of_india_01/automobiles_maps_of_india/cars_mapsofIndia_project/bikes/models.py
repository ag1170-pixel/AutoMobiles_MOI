from django.db import models
from django.utils.text import slugify
from django.urls import reverse

class Bike(models.Model):
    categoryBike = models.CharField(max_length=100)
    Bikename = models.CharField(max_length=100)
    Bikemodel = models.CharField(max_length=100)
    price = models.IntegerField(help_text="Price in rupees (integer)")

    # Fuel and Engine Specifications
    FUEL_CHOICES = [
        ('Petrol', 'Petrol'),
        ('Diesel', 'Diesel'),
        ('Electric', 'Electric'),
        ('CNG', 'CNG'),
        ('Hybrid', 'Hybrid'),
    ]
    fuel_type = models.CharField(max_length=50, choices=FUEL_CHOICES,blank=True)
    engine_capacity = models.CharField(max_length=100, blank=True, null=True)  
    engine_type = models.CharField(max_length=100, blank=True, null=True)      
    motor_power = models.CharField(max_length=100, blank=True, null=True)      
    number_of_cylinders = models.PositiveIntegerField(blank=True, null=True)
    mileage = models.CharField(max_length=100, blank=True, null=True)    
    max_speed = models.CharField(max_length=100, blank=True, null=True)  
    gears = models.PositiveIntegerField(blank=True, null=True)
    wheelbase = models.CharField(max_length=100, blank=True, null=True)  
    body_type = models.CharField(max_length=100)                         
    fuel_tank_capacity = models.CharField(max_length=100, blank=True, null=True)  
    trunk_capacity = models.CharField(max_length=100, blank=True, null=True)
    manufacturer = models.CharField(max_length=100, blank=True)          
    manufacturing_place = models.CharField(max_length=100, blank=True)   
    manufacturing_year = models.PositiveIntegerField(default=2022,blank=False)                   
    vehicle_overview = models.TextField(null=True, blank=True)  
    features = models.TextField(null=True, blank=True)          
    image = models.ImageField(upload_to='bike_images/')         
    user_rating = models.FloatField(default=0.0)                
    slug = models.SlugField(max_length=200, blank=True)

    def save(self, *args, **kwargs):
        if not self.slug:
            # Generate slug from name, model, and category
            base_slug = slugify(f"{self.Bikename} {self.Bikemodel} {self.categoryBike}")
            slug = base_slug
            counter = 1
            # Ensure uniqueness
            while Bike.objects.filter(slug=slug).exclude(pk=self.pk).exists():
                slug = f"{base_slug}-{counter}"
                counter += 1
            self.slug = slug
        super().save(*args, **kwargs)

    def get_absolute_url(self):
        return reverse('bike_detail_seo', kwargs={'slug': self.slug})                

    def __str__(self):
        return f"{self.Bikename} - {self.Bikemodel} ({self.fuel_type})"
