from django.urls import path
from . import views

urlpatterns = [
    # path('', views.index, name='index'),
    path('useful-information/', views.useful_info_list, name='useful_info_list'),
    path('useful-information/<slug:slug>/', views.useful_info_detail, name='useful_info_detail'),
    path('automobile-tips/', views.automobile_tips, name='automobile_tips'),
    path('transmission_system/',views.transmission_system,name='develop_transmission'),
    # path('<slug:slug>/', views.knowCarDetail, name='knowCarDetail'),
    path('suspension/', views.suspension_detail, name='modern_suspension'),
    path('motor-policy/', views.motor_policy, name='motor-policy'),
    path('<slug:slug>/', views.knowCarDetail, name='knowCarDetail'),
    # path('motor-policy/', views.motor_policy, name='motor-policy'),

    path('useful-information/', views.electrical_list, name='electrical_list'),
    path('useful-information/<slug:slug>/', views.electrical_detail, name='electrical_detail'),

    path('vehile_maintence', views.vehicle_list, name='vehicle_list'),
    path('<slug:slug>/', views.vehicle_detail, name='vehicle_detail'),
    
    path('shows/', views.show_home, name='show_home'),
]