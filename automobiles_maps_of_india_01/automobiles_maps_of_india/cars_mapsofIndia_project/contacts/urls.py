from django.urls import path
from . import views

urlpatterns = [
    path('inquiry', views.inquiry, name='inquiry'),
    path('submit', views.contact_form, name='contact_form'),
]
