from django.shortcuts import render, redirect
from .models import Team
from cars.models import Car,PetrolPump
from bikes.models import Bike
from django.contrib.auth.models import User
from django.core.mail import send_mail
from django.contrib import messages
from .models import AutoNews
from django.http import HttpResponseRedirect
from urllib.parse import urlencode
from django.conf import settings



# Create your views here.

def home(request):
    teams = Team.objects.all()
    # featured_cars = Car.objects.order_by('-created_date').filter(is_featured=True)
    all_cars = Car.objects.all()
    
    # Add bikes data
    all_bikes = Bike.objects.all()
    
    # model_search = Car.objects.values_list('model', flat=True).distinct()
    category_search = Car.objects.values_list('category', flat=True).distinct()
    # engine_search = Car.objects.values_list('engine', flat=True).distinct()
    
    # Add bike categories
    bike_category_search = Bike.objects.values_list('categoryBike', flat=True).distinct()
    
    state_search = PetrolPump.objects.values_list('state',flat=True).distinct()
    # city_search = PetrolPump.objects.values_list('City',flat=True).distinct()
    
    # Add AutoNews data
    care_tips = AutoNews.objects.filter(category='care_tips')[:3]
    industry_news = AutoNews.objects.filter(category='industry_news')[:3]
    
    # city_search = Car.objects.values_list('city', flat=True).distinct()
    # year_search = Car.objects.values_list('year', flat=True).distinct()
    # body_style_search = Car.objects.values_list('body_style', flat=True).distinct()
    data = {
        'teams': teams,
        # 'featured_cars': featured_cars,
        'all_cars': all_cars,
        'all_bikes': all_bikes,  # Add bikes data

        # 'model_search': model_search,
        'category_search': category_search,
        'bike_category_search': bike_category_search, # Add bike categories
        # 'engine_search': engine_search,
        
        'state_search': state_search,
        # 'city_search' : city_search,


        # 'city_search': city_search,
        # 'year_search': year_search,
        # 'body_style_search': body_style_search,
        
        # Add AutoNews data
        'care_tips': care_tips,
        'industry_news': industry_news,
    }
    return render(request, 'pages/home.html', data)


def about(request):
    # Static data for faster loading - no database queries
    data = {
        'teams': [],  # Empty teams to disable dynamic team section
    }
    return render(request, 'pages/about.html', data)

def services(request):
    return render(request, 'pages/services.html')

def contact(request):
    """Display contact page - form submission is handled by contacts app"""
    return render(request, 'pages/contact.html')

def auto_news_list(request):
    care_tips = AutoNews.objects.filter(category='care_tips')[:5]
    industry_news = AutoNews.objects.filter(category='industry_news')[:5]
    context = {
        'care_tips': care_tips,
        'industry_news': industry_news,
    }
    return render(request, 'auto_news/news_list.html', context)

def whats_new(request):
    """
    Display What's New page with latest AutoNews entries
    """
    # Get latest AutoNews entries, ordered by publication date
    posts = AutoNews.objects.order_by('-pub_date')[:10]
    
    context = {
        'posts': posts,
    }
    return render(request, 'pages/whats_new.html', context)


def search_redirect(request):
    """
    Redirect search requests to appropriate vehicle search pages
    """
    vehicle_type = request.GET.get('vehicleType', 'car')
    search_type = request.GET.get('searchType', 'brand')

    if vehicle_type == 'bike':
        redirect_url = '/bikes/search'
    else:
        redirect_url = '/cars/search/'

    # Home page fields
    brand = request.GET.get('brand', '')
    model = request.GET.get('model', '')
    variant = request.GET.get('variant', '')
    budget_range = request.GET.get('budgetRange', '')
    budget_brand = request.GET.get('budgetBrand', '')

    redirect_params = {}

    if search_type == 'brand':
        # Home uses: brand(category/company), model(name), variant(model)
        if vehicle_type == 'bike':
            if brand:
                redirect_params['categoryBike'] = brand
            if model:
                redirect_params['name'] = model
            if variant:
                redirect_params['model'] = variant
        else:
            if brand:
                redirect_params['category'] = brand
            if model:
                redirect_params['name'] = model
            if variant:
                redirect_params['model'] = variant
    else:
        # Budget search: pass budget params through, and optionally the selected brand/company
        if budget_range:
            redirect_params['budgetRange'] = budget_range
        if budget_brand:
            if vehicle_type == 'bike':
                redirect_params['categoryBike'] = budget_brand
            else:
                redirect_params['category'] = budget_brand

    if redirect_params:
        redirect_url = f"{redirect_url}?{urlencode(redirect_params)}"

    return HttpResponseRedirect(redirect_url)


