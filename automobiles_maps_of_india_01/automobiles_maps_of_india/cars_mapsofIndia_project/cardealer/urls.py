from django.contrib import admin
from django.urls import path, include
from django.conf.urls.static import static
from django.conf import settings



urlpatterns = [
    path('admin/', admin.site.urls),
    path('', include('pages.urls')),
    path('cars/', include('cars.urls')),
    # path('socialaccounts/', include('allauth.urls')),
    path('contacts/', include('contacts.urls')),
    path('',include('automobile_company.urls')),
    path('usedCar/',include('usedCar.urls')),
    path('newcars/',include('newCar.urls')),
    path('truck/',include('truck.urls')),
    path('useful_information/',include('usefulInfo.urls')),
    path('finance/',include('finance_insurance.urls')),
    path('petrolstations/',include('petrol_cng_stations.urls')),
    path('carshanders/',include('carshanders.urls')),
    path('motors/',include('motors.urls')),
    path('show/',include('shows.urls')),
    path('bikes/',include('bikes.urls')),
    path('images/', include('images.urls')),
] + static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)

if settings.DEBUG:
    urlpatterns += static(settings.STATIC_URL, document_root=settings.STATIC_ROOT)
