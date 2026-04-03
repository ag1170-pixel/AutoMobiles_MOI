from django.urls import path
from . import views

urlpatterns = [
    path('', views.home, name='motors_home'),
    path('get_manufacturers/', views.get_manufacturers, name='get_manufacturers'),
    path('get_models/', views.get_models, name='get_models'),
    path('submit_form/', views.submit_form, name='submit_form'),
]