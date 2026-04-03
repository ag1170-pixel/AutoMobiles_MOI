from django.db import models
from django.utils import timezone


# Create data base CNG

class City(models.Model):
    name = models.CharField(max_length=100)
    latitude = models.FloatField()
    longitude = models.FloatField()

    def __str__(self):
        return self.name

class FuelPrice(models.Model):
    city = models.ForeignKey(City, on_delete=models.CASCADE)
    cng_price = models.DecimalField(max_digits=5, decimal_places=2)
    petrol_price = models.DecimalField(max_digits=5, decimal_places=2)
    diesel_price = models.DecimalField(max_digits=5, decimal_places=2)
    lpg_price = models.DecimalField(max_digits=5, decimal_places=2,default=0.00)
    fuel_price = models.DecimalField(max_digits=5, decimal_places=2,default =0.00)
    last_updated = models.DateTimeField(default=timezone.now)

    def __str__(self):
        return f"{self.city.name} Fuel Prices"



class CNGPrice(models.Model):
    city = models.ForeignKey(City, on_delete=models.CASCADE)
    price = models.DecimalField(max_digits=5, decimal_places=2)
    last_updated = models.DateTimeField(auto_now=True)

    def __str__(self):
        return f"{self.city.name}: ₹{self.price}/kg"


class DieselPrice(models.Model):
    city = models.ForeignKey(City, on_delete=models.CASCADE)
    price = models.DecimalField(max_digits=5, decimal_places=2)
    date = models.DateField(default=timezone.now)

    class Meta:
        get_latest_by = 'date'

    def __str__(self):
        return f"{self.city.name}: ₹{self.price}/L"

# class PetrolPrice(models.Model):
#     city = models.ForeignKey(City, on_delete=models.CASCADE)
#     price = models.DecimalField(max_digits=5, decimal_places=2)
#     date = models.DateField(default=timezone.now)
#
#     class Meta:
#         get_latest_by = 'date'
#
#     def __str__(self):
#         return f"{self.city.name}: ₹{self.price}/L"

class LPGPrice(models.Model):
    city = models.ForeignKey(City, on_delete=models.CASCADE)
    price = models.DecimalField(max_digits=6, decimal_places=2)
    previous_price = models.DecimalField(max_digits=6, decimal_places=2)
    last_updated = models.DateTimeField(auto_now=True)

    def __str__(self):
        return f"{self.city.name} - ₹{self.price}"

class PetrolPrice(models.Model):
    city = models.ForeignKey(City, on_delete=models.CASCADE)
    price = models.DecimalField(max_digits=5, decimal_places=2)
    previous_price = models.DecimalField(max_digits=5, decimal_places=2)
    last_updated = models.DateTimeField(auto_now=True)

    def __str__(self):
        return f"{self.city.name} - ₹{self.price}"




class State(models.Model):
    name = models.CharField(max_length=100, unique=True)

    def __str__(self):
        return self.name

class City_details(models.Model):
    name = models.CharField(max_length=100)
    state = models.ForeignKey(State, on_delete=models.CASCADE, related_name='cities')

    def __str__(self):
        return f"{self.name}, {self.state.name}"


class FuelModel(models.Model):
    name = models.CharField(max_length=100)
    fuel_type = models.CharField(max_length=50)

    def __str__(self):
        return self.name




