from django.shortcuts import render

# Create your views here.
from django.shortcuts import render, get_object_or_404
from .models import Useful, Manufacturer,AutomobileTip, TransmissionSystem, TransmissionTip, Article
from .models import SuspensionSystem,MotorPolicy,AutomobileInfo
from .models import InfoArticle
from django.core.paginator import Paginator


def index(request):
    useful_info_list = Useful.objects.all()
    return render(request, 'useful-information/index.html', {'useful_info_list': useful_info_list})

def useful_info_list(request):
    info_list = Useful.objects.all().order_by('-last_updated')
    paginator = Paginator(info_list, 10)  # Show 10 articles per page

    page_number = request.GET.get('page')
    page_obj = paginator.get_page(page_number)

    return render(request, 'useful-information/Automobile_info_list.html', {'page_obj': page_obj})

def useful_info_detail(request, slug):
    info = get_object_or_404(Useful, slug=slug)
    return render(request, 'useful-information/useful_details.html', {'info': info})


# def detail(request, slug):
#     info = get_object_or_404(UsefulInfo, slug=slug)
#     manufacturers = Manufacturer.objects.all()
#     return render(request, 'useful-information/useful_detail.html', {'info': info, 'manufacturers': manufacturers})

#Automobiles tips
def automobile_tips(request):
    tips = AutomobileTip.objects.all().order_by('order')
    return render(request, 'useful-information/automobile-tips.html', {'tips': tips})


#development Transmission
def transmission_system(request):
    systems = TransmissionSystem.objects.all()
    tips = TransmissionTip.objects.all()
    manufacturers = Manufacturer.objects.all()
    return render(request, 'useful-information/development-in-transmission-system.html', {
        'systems': systems,
        'tips': tips,
        'manufacturers': manufacturers
    })

#know car
def knowCarDetail(request, slug):
    article = get_object_or_404(Article, slug=slug)
    return render(request, 'useful-information/know-your-car.html', {'article': article})

#suspaension system

def suspension_detail(request):
    suspension = SuspensionSystem.objects.first()  # Assuming we have one entry for simplicity
    if suspension is None:
        # Create default suspension content if none exists
        suspension = {
            'title': 'Modern Suspension System',
            'content': '''
            <h2>Understanding Modern Suspension Systems</h2>
            <p>A vehicle's suspension system is a complex network of components designed to provide comfort, handling, and safety. Modern suspension systems have evolved significantly from simple spring setups to sophisticated electronic systems.</p>
            
            <h3>Key Components</h3>
            <ul>
                <li><strong>Shock Absorbers:</strong> Control the rate of suspension movement and dampen oscillations</li>
                <li><strong>Springs:</strong> Support the vehicle's weight and absorb road impacts</li>
                <li><strong>Control Arms:</strong> Connect the wheels to the vehicle frame</li>
                <li><strong>Anti-roll Bars:</strong> Reduce body roll during cornering</li>
            </ul>
            
            <h3>Types of Suspension Systems</h3>
            <p><strong>Independent Suspension:</strong> Each wheel moves independently, providing better comfort and handling.</p>
            <p><strong>Dependent Suspension:</strong> Wheels are connected, affecting each other's movement.</p>
            <p><strong>Air Suspension:</strong> Uses air springs instead of traditional coil springs for adjustable ride height.</p>
            <p><strong>Electronic Suspension:</strong> Automatically adjusts damping based on road conditions and driving style.</p>
            
            <h3>Benefits of Modern Suspension</h3>
            <ul>
                <li>Improved ride comfort</li>
                <li>Better handling and stability</li>
                <li>Enhanced safety features</li>
                <li>Adjustable settings for different driving conditions</li>
            </ul>
            ''',
            'last_updated': '2024-01-01'
        }
        return render(request, 'useful-information/modern-suspension-system.html', {'suspension': suspension})
    
    return render(request, 'useful-information/modern-suspension-system.html', {'suspension': suspension})

# model policy

# def motor_policy(request):
#     motor = MotorPolicy.objects.get(id=1)  # Replace with the ID of the motor policy you want to display
#     return render(request, 'useful-information/motor-policy.html', {'motor': motor})

def motor_policy(request):
    try:
        motor = MotorPolicy.objects.first()
        if motor is None:
            return render(request, 'useful-information/know-your-car.html')
    except MotorPolicy.DoesNotExist:
        return render(request, 'useful-information/know-your-car.html')

    return render(request, 'useful-information/motor-policy.html', {'motor': motor})


# Electrical  System

def electrical_list(request):
    info_pages = AutomobileInfo.objects.all()
    return render(request, 'useful-information/the-electrical-system.html', {'info_pages': info_pages})

def electrical_detail(request, slug):
    info = get_object_or_404(AutomobileInfo, slug=slug)
    return render(request, 'useful-information/the-electrical-system.html', {'info': info})


#vehicle Maintence

def vehicle_detail(request, slug):
    article = get_object_or_404(InfoArticle, slug=slug)
    return render(request, f'useful-information/{slug}vehicle-maintenance.html', {'article': article})

def show_home(request):
    # You can fetch data for auto_shows and tv_shows here if needed
    # For now, let's create some sample data to demonstrate pagination and search
    sample_auto_shows = [
        {'name': 'Detroit Auto Show', 'description': 'North American International Auto Show featuring the latest vehicles from major manufacturers.'},
        {'name': 'Geneva Motor Show', 'description': 'International Motor Show showcasing new models and concept cars from around the world.'},
        {'name': 'Tokyo Motor Show', 'description': 'Japanese automotive exhibition featuring cutting-edge technology and innovative designs.'},
        {'name': 'Frankfurt Motor Show', 'description': 'German automotive exhibition highlighting luxury vehicles and performance cars.'},
        {'name': 'Paris Motor Show', 'description': 'French automotive show featuring European manufacturers and concept vehicles.'},
        {'name': 'British Motor Show', 'description': 'UK automotive exhibition showcasing British heritage and modern vehicles.'},
        {'name': 'Auto Shanghai', 'description': 'Chinese automotive show featuring domestic and international manufacturers.'},
        {'name': 'Auto Expo India', 'description': 'Indian automotive exhibition featuring the latest vehicles for the Indian market.'},
        {'name': 'Los Angeles Auto Show', 'description': 'West Coast automotive show featuring new models and green technology.'},
        {'name': 'New York International Auto Show', 'description': 'East Coast automotive show featuring luxury and performance vehicles.'},
        {'name': 'Chicago Auto Show', 'description': 'Americas largest auto show featuring hundreds of vehicles from major manufacturers.'},
        {'name': 'SEMA Show', 'description': 'Specialty Equipment Market Association show featuring aftermarket products and custom vehicles.'},
        {'name': 'CES Auto Tech', 'description': 'Consumer Electronics Show automotive section featuring future technology and electric vehicles.'},
        {'name': 'Monaco Grand Prix', 'description': 'Formula 1 racing event showcasing high-performance vehicles and racing technology.'},
        {'name': 'Goodwood Festival of Speed', 'description': 'British automotive festival featuring classic cars, supercars, and racing vehicles.'},
    ]
    
    sample_tv_shows = [
        {'name': 'Top Gear', 'description': 'British motoring show featuring car reviews, challenges, and celebrity interviews.'},
        {'name': 'The Grand Tour', 'description': 'Amazon Prime motoring show featuring former Top Gear hosts.'},
        {'name': 'Fifth Gear', 'description': 'British motoring show focusing on practical car advice and reviews.'},
        {'name': 'MotorWeek', 'description': 'American automotive television show featuring road tests and industry news.'},
        {'name': 'Car SOS', 'description': 'British show restoring classic cars to their former glory.'},
        {'name': 'Wheeler Dealers', 'description': 'British show about buying and restoring used cars for profit.'},
        {'name': 'Overhaulin\'', 'description': 'American show where cars are completely redesigned and rebuilt.'},
        {'name': 'Pimp My Ride', 'description': 'American show customizing and upgrading participants\' vehicles.'},
        {'name': 'Fast N\' Loud', 'description': 'American show about finding and restoring classic cars.'},
        {'name': 'Velocity', 'description': 'Automotive show featuring high-performance vehicles and racing.'},
        {'name': 'Mecum Auto Auctions', 'description': 'Television coverage of classic car auctions and collector vehicles.'},
        {'name': 'Chasing Classic Cars', 'description': 'Show following collectors as they hunt for rare and valuable classic cars.'},
        {'name': 'Garage Squad', 'description': 'American show helping people restore and repair their dream cars.'},
        {'name': 'Iron Resurrection', 'description': 'Texas-based show transforming rusted vehicles into custom masterpieces.'},
        {'name': 'Bitchin\' Rides', 'description': 'California-based custom car shop building unique vehicles for clients.'},
    ]
    
    # Search functionality for auto shows
    auto_shows_search = request.GET.get('auto_shows_search')
    if auto_shows_search:
        sample_auto_shows = [show for show in sample_auto_shows if 
                           auto_shows_search.lower() in show['name'].lower() or 
                           auto_shows_search.lower() in show['description'].lower()]
    
    # Search functionality for TV shows
    tv_shows_search = request.GET.get('tv_shows_search')
    if tv_shows_search:
        sample_tv_shows = [show for show in sample_tv_shows if 
                         tv_shows_search.lower() in show['name'].lower() or 
                         tv_shows_search.lower() in show['description'].lower()]
    
    # Pagination for auto shows
    from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger
    auto_shows_paginator = Paginator(sample_auto_shows, 6)  # Show 6 auto shows per page
    auto_shows_page = request.GET.get('auto_shows_page')
    try:
        auto_shows = auto_shows_paginator.page(auto_shows_page)
    except PageNotAnInteger:
        auto_shows = auto_shows_paginator.page(1)
    except EmptyPage:
        auto_shows = auto_shows_paginator.page(auto_shows_paginator.num_pages)
    
    # Pagination for TV shows
    tv_shows_paginator = Paginator(sample_tv_shows, 6)  # Show 6 TV shows per page
    tv_shows_page = request.GET.get('tv_shows_page')
    try:
        tv_shows = tv_shows_paginator.page(tv_shows_page)
    except PageNotAnInteger:
        tv_shows = tv_shows_paginator.page(1)
    except EmptyPage:
        tv_shows = tv_shows_paginator.page(tv_shows_paginator.num_pages)
    
    context = {
        'auto_shows': auto_shows,
        'tv_shows': tv_shows,
        'auto_shows_search': auto_shows_search or '',
        'tv_shows_search': tv_shows_search or '',
    }
    return render(request, 'shows/show_home.html', context)

def vehicle_list(request):
    articles = InfoArticle.objects.all()
    return render(request, 'useful-information/vehicle-maintenance.html', {'articles': articles})

