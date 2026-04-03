from django.db import models

# Create your models here.

#Second hand car data base

class Second_Car(models.Model):
    name = models.CharField(max_length=200)
    model = models.CharField(max_length=50)
    year = models.IntegerField()
    price = models.DecimalField(max_digits=10, decimal_places=2)
    mileage = models.IntegerField()
    description= models.TextField()

    def __str__(self):
        return f"{self.year} {self.make} {self.model}"

class UsedCar(models.Model):
    title = models.CharField(max_length=200)
    content = models.TextField()
    price = models.DecimalField(max_digits=10, decimal_places=2)
    mileage = models.IntegerField()
    year = models.IntegerField()
    last_updated = models.DateField(auto_now=True)
    image = models.ImageField(upload_to='car_images/', null=True, blank=True)

    def __str__(self):
        return self.title

class CarDealer(models.Model):
    name = models.CharField(max_length=200)
    address = models.TextField()
    phone = models.CharField(max_length=20)
    city = models.CharField(max_length=100)
    email = models.EmailField()
    rating = models.DecimalField(max_digits=3, decimal_places=1)

def __str__(self):
    return self.name

class BuyingTip(models.Model):
    tip = models.TextField()

    def __str__(self):
        return self.tip[:50]



class CarCareTip(models.Model):
    title = models.CharField(max_length=200)
    description = models.TextField()
    icon = models.CharField(max_length=50)  # Font Awesome icon class
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    def __str__(self):
        return self.title

    class Meta:
        ordering = ['-created_at']