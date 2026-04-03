from django.db import models
from datetime import datetime
from ckeditor.fields import RichTextField
from multiselectfield import MultiSelectField
from django.urls import reverse
from django.utils.text import slugify

class Car(models.Model):
    MANUFACTURER_CHOICES = [
        ('GM', 'General Motors'),
        ('HM', 'Hindustan Motors'),
        ('LR', 'Land Rover'),
        ('RR', 'Rolls Royce'),
        ('DC', 'DaimlerChrysler'),
        ('VW', 'Volkswagen Group'),
        ('BMW', 'BMW Group'),
        ('MB', 'Mercedes-Benz'),
        ('TO', 'Toyota'),
        ('HO', 'Honda'),
        ('HY', 'Hyundai'),
        ('MA', 'Maruti Suzuki'),
        ('TA', 'Tata Motors'),
        ('NI', 'Nissan'),
        ('SK', 'Skoda'),
    ]
    FUEL_TYPE_CHOICES = [
        ('EV', 'Electric Vehicle'),
        ('Petrol', 'Petrol'),
        ('Diesel', 'Diesel'),
        ('CNG', 'Compressed Natural Gas'),
        ('Hybrid', 'Hybrid'),
    ]

    BODY_TYPE_CHOICES = [
        ('Sedan', 'Sedan'),
        ('SUV', 'SUV'),
        ('Hatchback', 'Hatchback'),
        ('Coupe', 'Coupe'),
        ('Convertible', 'Convertible'),
        ('Pickup', 'Pickup Truck'),
    ]


    category = models.CharField(max_length=100)
    name = models.CharField(max_length=100)
    model = models.CharField(max_length=100)
    price = models.IntegerField(help_text="Price in rupees (integer)")
    length = models.CharField(max_length=100)
    height = models.CharField(max_length=100)
    width = models.CharField(max_length=100)
    wheelbase = models.CharField(max_length=100)
    kerb = models.CharField(max_length=100)
    vehicle_type = models.CharField(max_length=100)
    ground_clearance = models.CharField(max_length=100)
    trunk_capacity = models.CharField(max_length=100)
    fuel_tank_capacity = models.CharField(max_length=100)
    engine = models.CharField(max_length=100)
    gears = models.CharField(max_length=100)
    fuel_economy = models.CharField(max_length=100)
    top_speed = models.CharField(max_length=100)
    airbags = models.CharField(max_length=100)
    seat_belts = models.CharField(max_length=100)
    image = models.ImageField(max_length=1000)
    manufac_place = models.CharField(max_length=100)
    vehicle_overview = models.TextField(null=True)
    features = models.TextField(null=True)
    manufacturer = models.CharField(max_length=3, choices=MANUFACTURER_CHOICES, default='GM')
    fuel_type = models.CharField(max_length=10, choices=FUEL_TYPE_CHOICES, default='Petrol')
    user_rating = models.FloatField(default=0.0, help_text="Rating out of 5")
    mileage = models.CharField(max_length=100, help_text="Mileage (e.g., km/l or miles/gal)",blank=True)
    num_of_cylinders = models.PositiveIntegerField(default=4, help_text="Number of engine cylinders")
    body_type = models.CharField(max_length=20, choices=BODY_TYPE_CHOICES, default='Sedan')
    slug = models.SlugField(max_length=200, blank=True)

    def save(self, *args, **kwargs):
        if not self.slug:
            # Generate slug from name, model, and category
            base_slug = slugify(f"{self.name} {self.model} {self.category}")
            slug = base_slug
            counter = 1
            # Ensure uniqueness
            while Car.objects.filter(slug=slug).exclude(pk=self.pk).exists():
                slug = f"{base_slug}-{counter}"
                counter += 1
            self.slug = slug
        super().save(*args, **kwargs)

    def get_absolute_url(self):
        return reverse('car_detail_seo', kwargs={'slug': self.slug})

    def __str__(self):
        return f"{self.name} - {self.model}"



class PetrolPump(models.Model):
    state = models.CharField(max_length=100,null=True)
    location = models.CharField(max_length=100,null=True)
    name = models.CharField(max_length=200,null=True)
    address = models.TextField(null=True)
    phone = models.CharField(max_length=100,null=True)
    company_name = models.CharField(max_length=100,null=True)


    