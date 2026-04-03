from django.urls import path
from . import views

urlpatterns = [
    path('', views.bikes, name='bikes'),
    path('bike/<slug:slug>/', views.bikes_detail_seo, name='bike_detail_seo'),
    path('brand/<slug:brand_slug>/', views.bikes_by_brand, name='bikes_by_brand'),
    path('brand/<slug:brand_slug>/model/<slug:model_slug>/', views.bikes_by_brand_model, name='bikes_by_brand_model'),
    path('<int:id>', views.bikes_detail, name='bikes_detail'),
    path('compare/', views.compare_bikes, name='compare_bikes'),
    path('get_categories/', views.get_bike_categories, name='get_bike_categories'),
    path('get_models/', views.get_bike_models, name='get_bike_models'),
    path('get_names/', views.get_bike_names, name='get_bike_names'),
    path('search', views.search_Bikes, name='search_Bikes'),
    path('test_bike_images', views.test_bike_images, name='test_bike_images'),
    path('test/search/', views.test_bike_search_images, name='test_bike_search_images'),
    path('test/detail/', views.test_bike_detail_images, name='test_bike_detail_images'),
    path('debug/', views.debug_bike_images, name='debug_bike_images'),
]
