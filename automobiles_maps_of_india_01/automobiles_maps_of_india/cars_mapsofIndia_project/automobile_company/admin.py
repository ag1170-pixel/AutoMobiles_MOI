from django.contrib import admin
from .models import (
    Company,ProfitData,News,CarManufacturer,
    CarModel,Manufacturer,Vehicle,Specification,
    HistoryArticle,SidebarLink,CarModels,Lubricant,Additive

    )




class HistoryArticleAdmin(admin.ModelAdmin):
    list_display = ('title', 'published_date', 'last_updated')
    prepopulated_fields = {'slug': ('title',)}

admin.site.register(Company)
admin.site.register(ProfitData)
admin.site.register(News)
admin.site.register(CarManufacturer)
admin.site.register(CarModel)
admin.site.register(Manufacturer)
admin.site.register(Vehicle)
admin.site.register(Specification)
admin.site.register(HistoryArticle,HistoryArticleAdmin)
admin.site.register(SidebarLink)
admin.site.register(CarModels)
admin.site.register(Lubricant)
admin.site.register(Additive)
