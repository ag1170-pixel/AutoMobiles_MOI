from django.db import models
from django.urls import reverse
from django.core.validators import RegexValidator


# Automobile-companies in india
class Company(models.Model):
    name = models.CharField(max_length=100)
    logo_url = models.URLField()
    # logo = models.ImageField(upload_to='company_logos/')
    description = models.TextField()

    def __str__(self):
        return self.name


class ProfitData(models.Model):
    company = models.ForeignKey(Company, on_delete=models.CASCADE)
    year = models.IntegerField()
    profit = models.DecimalField(max_digits=15, decimal_places=2)

    def __str__(self):
        return f"{self.company.name} - {self.year}"


class News(models.Model):
    title = models.CharField(max_length=200)
    summary = models.TextField()
    image_url = models.URLField()
    image = models.ImageField(upload_to='news_images/',null=True, blank=True)
    url = models.URLField()

    def __str__(self):
        return self.title




# class TwoWheeler(models.Model):
#     manufacturer = models.ForeignKey(Manufacturer, related_name='models', on_delete=models.CASCADE)
#     name = models.CharField(max_length=100)
#     year = models.IntegerField()
#
#     def __str__(self):
#         return f"{self.manufacturer.name} {self.name} ({self.year})"


#automobile -companies -in -india




class Category(models.Model): # spare category
    name = models.CharField(max_length=100)
    description = models.TextField()

    def __str__(self):
        return self.name

class CategoryComponent(models.Model): #component category
    name = models.CharField(max_length=100)
    description = models.TextField()

    def __str__(self):
        return self.name


class Component(models.Model):
    name = models.CharField(max_length=200)
    description = models.TextField()
    price = models.DecimalField(max_digits=10, decimal_places=2)
    # categoryComponent= models.ForeignKey(CategoryComponent, on_delete=models.CASCADE)
    categoryComponent = models.ForeignKey(CategoryComponent, on_delete=models.CASCADE, null=True, blank=True)
    image = models.ImageField(upload_to='components/', null=True, blank=True)


    def __str__(self):
        return self.name

class Spare(models.Model):
    name = models.CharField(max_length=200)
    description = models.TextField()
    price = models.DecimalField(max_digits=10, decimal_places=2)
    category = models.ForeignKey(Category, on_delete=models.CASCADE)
    image = models.ImageField(upload_to='spares/', null=True, blank=True)

    def __str__(self):
        return self.name

#Automobile Engineering college

class College(models.Model):
    name = models.CharField(max_length=200)
    location = models.CharField(max_length=100)
    placement_percentage = models.CharField(max_length=10)
    average_package = models.CharField(max_length=50)
    contact_details = models.TextField()
    industry_interface = models.TextField()

    def __str__(self):
        return self.name


# Accessor databse

class Accessory(models.Model):
    CATEGORY_CHOICES = (
        ('interior', 'Interior'),
        ('exterior', 'Exterior'),
        ('other', 'Other'),
    )
    name = models.CharField(max_length=100)
    category = models.CharField(max_length=20, choices=CATEGORY_CHOICES)

    def __str__(self):
        return self.name

class CarAccessory(models.Model):
    CATEGORY_CHOICES = [
        ('shop', 'Shop'),
        ('safety', 'Safety'),
        ('comfort', 'Comfort'),
        ('exterior', 'Exterior'),
        ('audio', 'Audio'),
        ('interior', 'Interior'),
        ('performance', 'Performance'),
    ]

    name = models.CharField(max_length=100)
    description = models.TextField()
    category = models.CharField(max_length=20, choices=CATEGORY_CHOICES)
    price = models.DecimalField(max_digits=10, decimal_places=2)
    image = models.ImageField(upload_to='car_accessories/', null=True, blank=True)

    def __str__(self):
        return self.name

class Shop(models.Model):
    name = models.CharField(max_length=100)
    address = models.TextField()
    phone = models.CharField(max_length=20)
    website = models.URLField(blank=True)

    def __str__(self):
        return self.name
class AccessoryType(models.Model):
    name = models.CharField(max_length=100)
    description = models.TextField()
    price_range = models.CharField(max_length=100, blank=True, null=True)

    def __str__(self):
        return self.name

class Store(models.Model):
    name = models.CharField(max_length=100)
    address = models.TextField()
    phone = models.CharField(max_length=20)

    def __str__(self):
        return self.name

class RelatedLink(models.Model):
    name = models.CharField(max_length=100)
    url = models.URLField()

    def __str__(self):
        return self.name



class TyreManufacturer(models.Model):
    name = models.CharField(max_length=100)
    address = models.TextField()
    phone = models.CharField(max_length=20)

    def __str__(self):
        return self.name

class TyreType(models.Model):
    name = models.CharField(max_length=100)
    description = models.TextField()

    def __str__(self):
        return self.name


# Automobile Service Station in India
class CarBrand(models.Model): #services centre
    name = models.CharField(max_length=100)
    is_active = models.BooleanField(default=True)

    def __str__(self):
        return self.name

class ServiceCenter(models.Model): #service centre
    name = models.CharField(max_length=255)
    description = models.TextField(blank=True)
    phone_regex = RegexValidator(
        regex=r'^\+?1?\d{9,15}$',
        message="Phone number must be entered in the format: '+999999999'. Up to 15 digits allowed."
    )
    phone = models.CharField(validators=[phone_regex], max_length=15, blank=True, null=True)
    address = models.TextField()
    state = models.CharField(max_length=100)
    city = models.CharField(max_length=100)
    brand = models.ForeignKey(CarBrand, on_delete=models.CASCADE, related_name='service_centers')
    image = models.ImageField(null=True, blank=True)
    is_active = models.BooleanField(default=True)
    updated_at = models.DateTimeField(auto_now=True)
    working_hours = models.CharField(max_length=255, blank=True, null=True)
    rating = models.FloatField(null=True, blank=True)

    class Meta:
        ordering = ['name']
        # unique_together = ['name', 'city']

    def __str__(self):
        return f"{self.name} - {self.brand.name} ({self.city})"





# Automobile Industry In India DataBase
class MarketShare(models.Model):
    category = models.CharField(max_length=100)
    share = models.DecimalField(max_digits=5, decimal_places=2)

    def __str__(self):
        return f"{self.category}: {self.share}%"

class ExportData(models.Model):
    year = models.IntegerField()
    growth = models.DecimalField(max_digits=5, decimal_places=2)

    def __str__(self):
        return f"{self.year}: {self.growth}%"


class CarMarketInfo(models.Model):
    title = models.CharField(max_length=200)
    content = models.TextField()
    last_updated = models.DateField(auto_now=True)

class CarCategory(models.Model):
    name = models.CharField(max_length=100)
    slug = models.SlugField(unique=True)



class CarLink(models.Model):
    title = models.CharField(max_length=200)
    url = models.URLField()
    category = models.ForeignKey(CarCategory, on_delete=models.CASCADE)



