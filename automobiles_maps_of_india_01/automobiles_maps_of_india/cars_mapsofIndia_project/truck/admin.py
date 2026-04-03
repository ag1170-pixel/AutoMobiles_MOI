from django.contrib import admin
from .models import BusType, FamousBus, Overview,BusManufacturer

admin.site.register(Overview)
admin.site.register(BusType)
admin.site.register(FamousBus)
admin.site.register(BusManufacturer)

# Register your models here.
