from django.urls import path, re_path
from django.urls import include
from . import views

# urlpatterns = [
#     path('cng-price-maps/', views.cng_price_map, name='cng_price_map'),
#     path('get-cng-prices/', views.get_cng_prices, name='get_cng_prices'),

#     # path('api/get-cng-pries/',views.cng_price_map,name='get_cng_prices'),
#     path('fule_price', views.fuel_price_map, name='fuel_price_map'),
#     path('api/get-fuel-prices/', views.get_fuel_prices, name='get_fuel_prices'),


#     path('diesel-price', views.diesel_price_map, name='diesel_price_map'),
#     path('city/<str:city_name>/', views.city_detail, name='city_detail'),


#     path('Lpg-price', views.lpg_prices, name='lpg_price_map'),
#     path('city/<str:city_name>/', views.city_detail, name='city_detail'),


#     path('petrol-price', views.petrol_prices, name='petrol_price_map'),
#     path('city/<str:city_name>/', views.city_detail, name='city_detail'),




#     path('petrol-pump-finder/', views.petrol_pump_finder, name='petrol_pump_finder'),

#     # Legacy redirects for old URL patterns (must come before generic state pattern)
#     path('petrol-stations-delhi/', views.redirect_to_delhi),
#     path('petrol_stations_maharashtra/', views.redirect_to_maharashtra),
#     path('petrol_stations_uttarpradesh/', views.redirect_to_uttarpradesh),
#     path('petrol_stations_tamilnadu/', views.redirect_to_tamilnadu),

#     # Unified petrol pump routes
#     path('', views.petrol_pump_list, name='petrol_pump_list'),
#     path('<str:state_slug>/', views.petrol_pump_list, name='petrol_pump_list_state'),

#     path('api/states/', views.get_states, name='get_states'),
#     path('api/cities/', views.get_cities, name='get_cities'),
#     path('get_cities_by_state/', views.get_cities_by_state, name='get_cities_by_state'),
#     path('api/petrol-pump-autocomplete/', views.petrol_pump_autocomplete, name='petrol_pump_autocomplete'),

#     path('api/petrol-stations/', views.petrol_stations, name='petrol_stations_api'),
# ]


urlpatterns = [

    # ---- API ROUTES FIRST ----
    path('api/states/', views.get_states, name='get_states'),
    path('api/cities/', views.get_cities, name='get_cities'),
    path('get_cities_by_state/', views.get_cities_by_state, name='get_cities_by_state'),
    path('api/petrol-pump-autocomplete/', views.petrol_pump_autocomplete, name='petrol_pump_autocomplete'),
    path('api/petrol-stations/', views.petrol_stations, name='petrol_stations_api'),

    # ---- OTHER STATIC ROUTES ----
    path('cng-price-maps/', views.cng_price_map, name='cng_price_map'),
    path('get-cng-prices/', views.get_cng_prices, name='get_cng_prices'),
    path('fule_price', views.fuel_price_map, name='fuel_price_map'),
    path('api/get-fuel-prices/', views.get_fuel_prices, name='get_fuel_prices'),
    path('diesel-price', views.diesel_price_map, name='diesel_price_map'),
    path('Lpg-price', views.lpg_prices, name='lpg_price_map'),
    path('petrol-price', views.petrol_prices, name='petrol_price_map'),
    path('petrol-pump-finder/', views.petrol_pump_finder, name='petrol_pump_finder'),

    # ---- STATE DYNAMIC ROUTE LAST ----
    path('', views.petrol_pump_list, name='petrol_pump_list'),
    path('<str:state_slug>/', views.petrol_pump_list, name='petrol_pump_list_state'),
]