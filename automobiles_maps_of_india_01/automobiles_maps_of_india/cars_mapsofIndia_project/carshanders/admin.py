from django.contrib import admin
from .models import (
    Category,Component,Spare,
    College,Accessory,CategoryComponent,CarAccessory,Shop,AccessoryType,Store,
    RelatedLink,TyreManufacturer,TyreType,ServiceCenter,CarBrand,
    MarketShare,ExportData,CarMarketInfo,CarCategory,CarLink

)
from django.utils.html import format_html

# Register your models here.

# admin.site.register(Company)
# admin.site.register(ProfitData)
# admin.site.register(News)
# admin.site.register(TwoWheeler)
admin.site.register(Category)
admin.site.register(CategoryComponent)
admin.site.register(Component)
admin.site.register(Spare)
admin.site.register(College)
admin.site.register(Accessory)
admin.site.register(CarAccessory)
admin.site.register(Shop)
admin.site.register(AccessoryType)
admin.site.register(Store)
admin.site.register(RelatedLink)
admin.site.register(TyreManufacturer)
admin.site.register(TyreType)
admin.site.register(ServiceCenter)
admin.site.register(CarBrand)
admin.site.register(MarketShare)
admin.site.register(ExportData)
admin.site.register(CarMarketInfo)
admin.site.register(CarCategory)
admin.site.register(CarLink)