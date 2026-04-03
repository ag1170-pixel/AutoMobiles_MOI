from django.urls import path
from .import views
from .views import CommercialVehicles

urlpatterns = [
    # autmoblie company
    path('automobile-companies-in-india',views.automobile_companies, name='automobile_companies'),
    path('automobile-companies-in-india/car-manufacturers',views.car_manufacturers, name='car_manufacturers'),
    # path('automobile-companies-in-india/commercial-vehicles',views.CommercialVehicles, name='commercial_vehicles'),
    # path('automobile-companies-in-india/commercial_company',views.CommercialVehicles,name='commercial_vehicles'),
    # path('automobile-companies-in-india/two-wheeler', views.two_wheeler_manufacturers, name='two_wheeler_manufacturers'),

    # Automobile History
    # path('auto-history/', views.auto_history_detail, name='auto_history_detail'),
    # path('auto-history/<slug:slug>/', views.auto_history_detail, name='auto_history_detail'),
    path('automobile-history/', views.auto_history_list, name='auto_history_list'),
    path('auto-history/<slug:slug>/', views.auto_history_detail, name='auto_history_detail'),



    path('auto-history/the-birth-of-automobiles/<slug:slug>',views.birth_detail, name='the-birth-of-automobiles-details'),
    path('auto-history/the-birth-of-automobiles',views.birth_list, name='the-birth-of-automobiles-list'),
    path('auto-history/automobile-inventions',views.automobile_inventions, name='automobile_inventions'),
    path('auto-historry/changing-faces-of-car/', views.changing_faces_of_car_list, name='changing_faces_of_car'),
    path('auto-history/<slug:slug>/', views.changing_faces_of_car, name='article_detail'),


    # Lubricants
    path('lubricants', views.lubricants_page, name='lubricants'),


]
