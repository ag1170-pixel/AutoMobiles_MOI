from django.contrib import admin
from .models import Expo,Event,AutoShow,TVShow,RelatedLink

# Register your models here.
admin.site.register(Expo)
admin.site.register(Event)
admin.site.register(AutoShow)
admin.site.register(TVShow)
admin.site.register(RelatedLink)