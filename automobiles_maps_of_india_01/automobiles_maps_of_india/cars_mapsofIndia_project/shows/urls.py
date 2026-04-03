from django.urls import path
from . import views

app_name = 'shows'

urlpatterns = [
    path('', views.show_home, name='show_home'),
    path('show/<int:show_id>/', views.auto_show_detail, name='auto_show_detail'),
    path('auto-expo/search/', views.search_expos, name='search_expos'),
    path('auto-expo/<int:year>/', views.auto_expo_detail, name='auto_expo_detail'),
    path('auto-expo/event/<int:event_id>/', views.event_detail, name='event_detail'),
]

