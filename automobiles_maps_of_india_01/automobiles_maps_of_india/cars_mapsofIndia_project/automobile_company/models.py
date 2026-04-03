from django.db import models
from django.utils import timezone

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
    # image = models.ImageField(upload_to='news_images/')
    url = models.URLField()
    pub_date = models.DateTimeField(default=timezone.now)

    def __str__(self):
        return self.title

# end Automobile company

#Automobil company india

class CarManufacturer(models.Model): # car_manufactures
    name = models.CharField(max_length=100)
    founded_year = models.IntegerField()
    description = models.TextField()
    logo = models.URLField()

    def __str__(self):
        return self.name

class CarModel(models.Model): # Car_Manufactures
    manufacturer = models.ForeignKey(CarManufacturer, related_name='models', on_delete=models.CASCADE)
    name = models.CharField(max_length=100)
    year = models.IntegerField()

def __str__(self):
        return f"{self.manufacturer.name} {self.name} ({self.year})"


class Manufacturer(models.Model): # commercial_vehicle
    name = models.CharField(max_length=100)
    description = models.TextField()

    def __str__(self):
        return self.name

class Vehicle(models.Model): # commercial_vehicle
    manufacturer = models.ForeignKey(Manufacturer, on_delete=models.CASCADE, related_name='vehicles')
    model = models.CharField(max_length=100)
    price = models.DecimalField(max_digits=10, decimal_places=2, null=True, blank=True)

    def __str__(self):
        return f"{self.manufacturer.name} - {self.model}"

class Specification(models.Model): # commercial_vehicle
    vehicle = models.ForeignKey(Vehicle, on_delete=models.CASCADE, related_name='specifications')
    name = models.CharField(max_length=100)
    value = models.CharField(max_length=100)

    def __str__(self):
        return f"{self.vehicle.model} - {self.name}: {self.value}"


# class TwoWheeler(models.Model): # Two Wheeler
#     manufacturers = models.ForeignKey(CarManufacturer, related_name='models', on_delete=models.CASCADE)
#     name = models.CharField(max_length=100)
#     year = models.IntegerField()
#
#     def __str__(self):
#         return f"{self.manufacturers.name} {self.name} ({self.year})"


#end Automobile comapny

# Auto mobile data Base
class HistoryArticle(models.Model):
    title = models.CharField(max_length=500)
    content = models.TextField()
    slug = models.SlugField(unique=True)
    published_date = models.DateTimeField(auto_now_add=True)
    last_updated = models.DateField(auto_now=True)



def __str__(self):
    return self.title


class SidebarLink(models.Model):
    title = models.CharField(max_length=100)
    url = models.CharField(max_length=200)

    def __str__(self):
        return self.title


class CarModels(models.Model):
    name = models.CharField(max_length=100)
    year = models.IntegerField()
    description = models.TextField()
    article = models.ForeignKey(HistoryArticle, on_delete=models.CASCADE, related_name='car_models', null=True, blank=True)

def __str__(self):
        return f"{self.name} ({self.year})"



# Start Lubricants

class Lubricant(models.Model):
    name = models.CharField(max_length=100)
    description = models.TextField()
    usage = models.TextField()

    def __str__(self):
        return self.name

class Additive(models.Model):
    name = models.CharField(max_length=100)
    purpose = models.TextField()

    def __str__(self):
        return self.name


# end lubricant


