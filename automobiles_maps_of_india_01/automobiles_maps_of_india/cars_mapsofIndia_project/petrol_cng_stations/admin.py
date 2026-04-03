from django.contrib import admin

# Register your models here.
from .models import (
    City,FuelPrice,CNGPrice,DieselPrice,PetrolPrice,LPGPrice,
    State,City_details,FuelModel
    )
admin.site.register(City)
admin.site.register(FuelPrice)
admin.site.register(CNGPrice)
admin.site.register(DieselPrice)
admin.site.register(PetrolPrice)
admin.site.register(LPGPrice)
admin.site.register(State)
admin.site.register(City_details)
admin.site.register(FuelModel)