from django.urls import path
from . import views

# app_name = 'your_app_name'  # Replace with your actual app name

urlpatterns = [
    # path('', views.home, name='home'),
    path('commercial-vehicles', views.commercial_vehicles, name='commercial_vehicles'),



    # Components and Spares
    path('automobile-components-and-spares/automobile-components', views.category_list, name='category_list'),
    path('automobile-components-and-spares/automobile-components', views.category_component_list, name='category_component'),
    path('automobile-components-and-spares/automobile-components', views.component_list, name='component_list'),
    path('automobile-components-and-spares/automobile-components/<int:component_id>/', views.component_detail, name='component_detail'),

    # path('automobile-components-and-spares/automobile-components<int:component_id>/', views.component_detail, name='component_detail'),
    path('automobile-components-and-spares/auto-spares', views.spare_list, name='spare_list'),
    path('automobile-components-and-spares/auto-spares/<int:spare_id>/', views.spare_detail, name='spare_detail'),

    # Colleges
    path('automobile-engineer-colleges/', views.college_list, name='college_list'),

    # Auto Accessories
    path('automobile-components-and-spares/auto-accessories', views.auto_accessories, name='auto_accessories'),

    # Service Centers
    
    path('brands/', views.get_brands, name='get_brands'),
    path('search-service-centers/', views.search_service_centers, name='search_service_centers'),
    path('service-centers/', views.service_centers, name='service_centers'),
    path('service-centers/', views.search_service_centers, name='search_service_centers'),
    path('service-centers/list/', views.service_centers, name='service_centers_list'),



# Industry Overview
    path('industry-overview/', views.industry_overview, name='industry_overview'),

    #car accessories
    path('car-accessories', views.car_accessories, name='car_accessories'),
    path('car-accessories/car-air-conditioning', views.accessories_details, name='accessories_details'),
    path('car-accessories/auto-tyres-india', views.auto_tyres_india, name='auto_tyres_india'),

]