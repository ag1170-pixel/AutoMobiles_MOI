
from django.urls import path
from . import views

urlpatterns = [
    path('', views.cars, name='cars'),
    path('car/<slug:slug>/', views.car_detail_seo, name='car_detail_seo'),
    path('brand/<slug:brand_slug>/', views.cars_by_brand, name='cars_by_brand'),
    path('brand/<slug:brand_slug>/model/<slug:model_slug>/', views.cars_by_brand_model, name='cars_by_brand_model'),
    path('<int:id>', views.car_detail, name='car_detail'),
    path('compare_cars', views.compare_cars, name='compare_cars'),
    path('test_images', views.test_images, name='test_images'),
    path('test_image_display', views.test_image_display, name='test_image_display'),
    path('get_cities/', views.get_cities, name='get_cities'),
    path('get_categories/', views.get_categories, name='get_categories'),
    path('get_models/',views.get_models, name='get_models'),
    path('get_names/',views.get_names, name='get_names'),
    path('search/', views.search, name='search'),

]
