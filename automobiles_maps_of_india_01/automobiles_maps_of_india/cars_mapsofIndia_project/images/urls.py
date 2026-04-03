from django.urls import path
from . import views

app_name = 'images'

urlpatterns = [
    path('', views.get_all_images, name='get_all_images'),
    path('<str:page_reference>/', views.get_images_by_page, name='get_images_by_page'),
    path('detail/<int:image_id>/', views.get_image_by_id, name='get_image_by_id'),
    path('upload/', views.upload_image, name='upload_image'),
    path('fallback/<str:page_reference>/<str:image_name>/', views.get_fallback_image, name='get_fallback_image'),
]
