from django.contrib import admin
from .models import VehicleType,VehicleModel,Manufacturer

admin.site.register(VehicleType)
admin.site.register(Manufacturer)
admin.site.register(VehicleModel)
# Register your models here.
