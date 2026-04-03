from django.db import models

class TruckOverview(models.Model):
    title = models.CharField(max_length=200)
    content = models.TextField()
    image = models.ImageField(upload_to='truck_overview_images/', null=True, blank=True)

    def __str__(self):
        return self.title


class TruckManufacturer(models.Model):
    name = models.CharField(max_length=100)

    def __str__(self):
        return self.name

class TruckType(models.Model):
    name = models.CharField(max_length=100)
    description = models.TextField()

    def __str__(self):
        return self.name

class FamousTruck(models.Model):
    manufacturer = models.ForeignKey(TruckManufacturer, on_delete=models.CASCADE)
    name = models.CharField(max_length=100)

    def __str__(self):
        return f"{self.manufacturer.name} - {self.name}"


# Legacy bus models (kept for backward compatibility)
class Overview(models.Model):
    title = models.CharField(max_length=200)
    content = models.TextField()
    image = models.ImageField(upload_to='overview_images/', null=True, blank=True)

    def __str__(self):
        return self.title


class BusManufacturer(models.Model):
    name = models.CharField(max_length=100)

    def __str__(self):
        return self.name

class BusType(models.Model):
    name = models.CharField(max_length=100)
    description = models.TextField()

    def __str__(self):
        return self.name

class FamousBus(models.Model):
    manufacturer = models.ForeignKey(BusManufacturer, on_delete=models.CASCADE)
    name = models.CharField(max_length=100)

    def __str__(self):
        return f"{self.manufacturer.name} - {self.name}"

