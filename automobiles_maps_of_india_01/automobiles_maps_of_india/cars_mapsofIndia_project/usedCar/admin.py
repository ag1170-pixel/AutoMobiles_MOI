from django.contrib import admin
from .models import UsedCar,CarDealer,BuyingTip,CarCareTip


# Register your models here.
admin.site.register(UsedCar)
admin.site.register(CarDealer)
admin.site.register(BuyingTip)
admin.site.register(CarCareTip)