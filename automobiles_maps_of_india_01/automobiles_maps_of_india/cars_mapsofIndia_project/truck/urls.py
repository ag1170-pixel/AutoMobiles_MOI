from django.urls import path
from . import views

urlpatterns = [
    path('trucks-in-india/', views.trucks_in_india, name='trucks_in_india'),
    path('buses-in-india/', views.buses_in_india, name='buses_in_india'),
]