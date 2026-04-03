from django.urls import path
from . import views

urlpatterns = [
# second hand cars
path('second-hand-car-dealers/', views.secondHand_Car_Dealer, name='second_hand_car_dealers'),
path('second-hand-car-buy/',views.secondHand_Car,name='second_hand_car_buying'),
path('used-cars/',views.used_cars, name='used_cars'),
path('used-car-dealers/', views.car_dealers, name='car_dealers'),

path('buying-tips/',views.buying_tips, name='buying_tips'),
#cars tips
path('car-care-tips/',views.car_care_tips, name='car_care_tips'),
path('api/car-care-tips/',views.api_car_care_tips, name='api_car_care_tips'),


]