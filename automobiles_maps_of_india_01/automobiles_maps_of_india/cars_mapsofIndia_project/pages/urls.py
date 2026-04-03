from django.urls import path
from . import views

urlpatterns = [
    path('', views.home, name='home'),
    path('about', views.about, name='about'),
    path('services', views.services, name='services'),
    path('contact', views.contact, name='contact'),
    path('whats-new/', views.whats_new, name='whats_new'),
    path('auto-news/', views.auto_news_list, name='auto_news_list'),
    path('search/', views.search_redirect, name='search'),
]
