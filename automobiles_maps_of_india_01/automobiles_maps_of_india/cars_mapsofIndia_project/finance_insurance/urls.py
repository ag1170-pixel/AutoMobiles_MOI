from django.urls import path
from . import views

urlpatterns = [
    path('', views.article_list, name='article_list'),
    path('article/<slug:slug>/', views.article_detail, name='article_detail'),
    path('insurance-companies/', views.finance_companies, name='finance_companies'),
    path('car_insurance/', views.car_insurance, name='car_insurance'),
    path('finance-companies/', views.insurance_company, name='insurance_company'),
    path('api/insurance-company-autocomplete/', views.insurance_company_autocomplete, name='insurance_company_autocomplete'),
]