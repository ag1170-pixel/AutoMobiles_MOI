from django.urls import path
from . import views
from .views import NewCarList, NewCarDetail

urlpatterns = [
    path('upcomingcarList/', views.upcoming_cars_list, name='upcoming_car_list'),
    path('upcomingcar/<int:car_id>/', views.upcoming_car_detail, name='upcoming_car_detail'),

    #NewCars views page
    path('', NewCarList.as_view(), name='news_cars_list'),
    path('<slug:car_slug>/', NewCarDetail.as_view(), name='news_cars_detail'),

]