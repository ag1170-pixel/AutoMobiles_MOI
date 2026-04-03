from django.db import models

# Create your models here.
class UpcomingCar(models.Model):
    name = models.CharField(max_length=200)
    brand = models.CharField(max_length=255, default='default_brand')
    engine = models.CharField(max_length=100)
    power_torque = models.CharField(max_length=100)
    kerb_weight = models.CharField(max_length=100, blank=True, null=True)
    dimensions = models.CharField(max_length=200, blank=True, null=True)
    estimated_price = models.CharField(max_length=100)
    expected_launch = models.CharField(max_length=100)
    description = models.TextField(default='default_description')
    image = models.ImageField(upload_to='cars/')
    slug = models.SlugField(unique=True, null=True, blank=True)

    def save(self, *args, **kwargs):
        if not self.slug:
            self.slug = generate_unique_slug(self, 'name')
        super().save(*args, **kwargs)

class New_Car(models.Model):
    name = models.CharField(max_length=100)
    brand = models.CharField(max_length=50)
    description = models.TextField()
    price = models.DecimalField(max_digits=10, decimal_places=2)
    engine = models.CharField(max_length=100)
    horsepower = models.IntegerField()
    mileage = models.DecimalField(max_digits=5, decimal_places=2)
    image = models.ImageField(upload_to='cars/')
    slug = models.SlugField(unique=True, null=True, blank=True)

    def save(self, *args, **kwargs):
        if not self.slug:
            self.slug = generate_unique_slug(self, 'name')
        super().save(*args, **kwargs)

class New_Car_Feature(models.Model):
    car = models.ForeignKey(New_Car, on_delete=models.CASCADE, related_name='features')
    feature = models.TextField()

    def __str__(self):
        return f"{self.car.name} - {self.feature}"



