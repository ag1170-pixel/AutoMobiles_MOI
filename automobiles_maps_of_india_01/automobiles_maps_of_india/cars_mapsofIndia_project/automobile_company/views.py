from django.shortcuts import render,get_object_or_404
from .models import (
    Company, ProfitData, News,SidebarLink,Lubricant,Additive,
    Manufacturer, Vehicle,CarManufacturer,HistoryArticle,CarModels
    )
from django.views.generic import TemplateView
from django.utils import timezone
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger
from django.core.serializers.json import DjangoJSONEncoder
import json
from django.core.serializers import serialize


# Automobile Companies in india
def automobile_companies(request):
    try:
        # Get available years and default to the most recent year with data
        available_years = list(ProfitData.objects.values_list('year', flat=True).distinct().order_by('-year'))
        
        # Handle empty years gracefully
        if not available_years:
            available_years = [timezone.now().year]
        
        year = request.GET.get('year', available_years[0] if available_years else timezone.now().year)
        try:
            year = int(year)
        except (ValueError, TypeError):
            year = available_years[0] if available_years else timezone.now().year

        # Safely get data with fallbacks
        intro_text = ("In recent years the automobile industry in India has grown by leaps and bounds. "
                     "This phenomenal growth rate is owing to two factors mainly, which are better standard of living of the Indian middle class and "
                     "a subsequent rise in their disposable income which in turn increases the purchasing power adding to the growth of the automobile industry as a whole and "
                     "the automobile companies in particular. According to a market survey results the sale of passenger cars have increased by three folds than what it used to be five years down the line. "
                     "Apparently there are 1 million passenger cars already on the Indian roads and the figure only promises to increase as the days go by. Be it small cars, medium cars or luxury cars all have their target customers and all do well in the market so much so that global giants from USA and Japan are entering the Indian automobile sector and working in collaboration with the Indian automobile majors.")
        
        # Get companies with error handling
        top_companies = Company.objects.all()[:12]  # Limit to prevent performance issues
        
        # Get profit data with error handling
        profit_data = ProfitData.objects.filter(year=year)[:10]  # Limit data
        
        # Prepare chart data as JSON
        chart_data = []
        for item in profit_data:
            chart_data.append({
                'company': item.company.name,
                'profit': float(item.profit)
            })
        
        # Default quick links
        quick_links = [
            {'text': 'Commercial Vehicles', 'url': '#'},
            {'text': 'Car Manufacturers', 'url':'/car-manufacturers/'},
            {'text': 'Two Wheeler Manufacturers', 'url': '#'},
        ]
        
        # Get latest news with fallback
        try:
            latest_news = News.objects.order_by('-pub_date')[:6]  # Limit to 6 items
        except:
            latest_news = []

        context = {
            'intro_text': intro_text,
            'top_companies': top_companies,
            'profit_data': profit_data,
            'chart_data': json.dumps(chart_data),
            'quick_links': quick_links,
            'latest_news': latest_news,
            'selected_year': year,
            'available_years': available_years,
        }
        
        return render(request, 'automobile_company/automobile-companies-in-india/automobile_companies.html', context)
        
    except Exception as e:
        # Fallback context in case of errors
        context = {
            'intro_text': "Automobile industry information is currently being updated.",
            'top_companies': [],
            'profit_data': [],
            'chart_data': json.dumps([]),
            'quick_links': [
                {'text': 'Commercial Vehicles', 'url': '#'},
                {'text': 'Car Manufacturers', 'url':'/car-manufacturers/'},
                {'text': 'Two Wheeler Manufacturers', 'url': '#'},
            ],
            'latest_news': [],
            'selected_year': timezone.now().year,
            'available_years': [timezone.now().year],
            'error_message': str(e)
        }
        
        return render(request, 'automobile_company/automobile-companies-in-india/automobile_companies.html', context)

def home(request):
    companies = Company.objects.all()
    vehicles = Vehicle.objects.all()
    news_items = News.objects.all().order_by('-pub_date')

    context = {
        'companies': companies,
        'vehicles': vehicles,
        'news_items': news_items,
    }
    return render(request, 'automobile_company/automobile_companies/index.html', context)

    # end Automobile company

#Automobile company in india

# def car_manufacturers(request):
#     manufacturers = Manufacturer.objects.all()  # Assuming you have a Manufacturer model
#     manufacturers_data = []
#
#     for manufacturer in manufacturers:
#         manufacturer_data = {
#             'id': manufacturer.id,
#             'name': manufacturer.name,
#             'logo': manufacturer.logo.url if manufacturer.logo else '',  # Make sure this is correct
#             'foundedYear': manufacturer.founded_year,
#             'description': manufacturer.description,
#             'models': [
#                 {'name': model.name, 'year': model.year}
#                 for model in manufacturer.model_set.all()
#             ]
#         }
#         manufacturers_data.append(manufacturer_data)
#
#     manufacturers_json = json.dumps(manufacturers_data)
def car_manufacturers(request):
    manufacturers = CarManufacturer.objects.all()
    manufacturers_json = serialize('json', manufacturers)
    context = {
        'manufacturers_json': manufacturers_json,
    }
    # return render(request, 'car_manufacturers.html', context)

    return render(request, 'automobile_company/automobile-companies-in-india/car-manufacturers/car_manufacturers.html', context)



class CommercialVehicles(TemplateView):
    template_name = 'automobile_company/automobile-companies-in-india/commercial-vehicles-manufactures/commercial-vehicles.html'

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        manufacturers = Manufacturer.objects.all()
        manufacturer_data = {}

        for manufacturer in manufacturers:
            vehicles = manufacturer.vehicles.all().prefetch_related('specifications')
            manufacturer_data[manufacturer] = vehicles

        context['manufacturer_data'] = manufacturer_data
        context['last_updated'] = timezone.now()
        return context

# def two_wheeler_manufacturers(request):
#     manufacturers = Manufacturer.objects.all().prefetch_related('models')
#     return render(request, 'automobile_company/automobile-companies-in-india/two-wheelers-manufacturers/index.html', {'manufacturers': manufacturers})


# Automobile History Start

def auto_history_list(request):
    articles = HistoryArticle.objects.all()
    context = {
        'articles': articles,
    }
    return render(request, 'automobile_company/automobile-history/automoobile-history-list.html', context)


def auto_history_detail(request, slug):
    article = get_object_or_404(HistoryArticle, slug=slug)
    car_models = CarModels.objects.filter(article=article)

    prev_article = HistoryArticle.objects.filter(id__lt=article.id).order_by('-id').first()
    next_article = HistoryArticle.objects.filter(id__gt=article.id).order_by('id').first()

    sidebar_links = [
        {'url': '#', 'title': 'Link 1', 'description': 'Description 1'},
        {'url': '#', 'title': 'Link 2', 'description': 'Description 2'},
        # Add more links as needed
    ]

    context = {
        'article': article,
        'car_models': car_models,
        'prev_article': prev_article,
        'next_article': next_article,
        'sidebar_links': sidebar_links,
    }
    return render(request, 'automobile_company/automobile-history/automobile-history.html', context)


# def auto_history_detail(request):
#     # Option 1: If you want to retrieve all HistoryArticle objects
#     history_articles = HistoryArticle.objects.all()
#     return render(request, 'automobile_company/automobile-history/automobile-history.html', {'history_articles': history_articles})

def birth_detail(request, slug):
    return auto_history_detail(request, slug)

def birth_list(request):
    articles = HistoryArticle.objects.all().order_by('-published_date')
    sidebar_links = SidebarLink.objects.all()
    context = {
        'articles': articles,
        'sidebar_links': sidebar_links,
    }
    return render(request, 'automobile_company/automobile-history/the-birth-of-automobiles.html', context)

def automobile_inventions(request):
    try:
        article = HistoryArticle.objects.get(slug='automobile-inventions')
        return auto_history_detail(request, article.slug)
    except HistoryArticle.DoesNotExist:
        # If the article doesn't exist, we'll render a default template
        sidebar_links = SidebarLink.objects.all()
        context = {
            'title': 'Automobile Inventions',
            'content': 'Information about automobile inventions will be available soon.',
            'sidebar_links': sidebar_links,
        }
        return render(request, 'automobile_company/automobile-history/automobile-inventions.html', context)



def changing_faces_of_car(request, slug):
    article = get_object_or_404(HistoryArticle, slug=slug)
    context = {
        'article': article,
        'latest_articles': HistoryArticle.objects.exclude(id=article.id).order_by('-published_date')[:5]
    }
    return render(request, 'automobile_company/automobile-history/changing-faces-of-the-car.html', context)

def changing_faces_of_car_list(request):
    article = HistoryArticle.objects.all().order_by('-published_date')
    context = {
        'article': article
    }

    return render(request, 'automobile_company/automobile-history/changing-faces-of-the-car.html', context)



def car_models(request, article_slug):
    article = get_object_or_404(HistoryArticle, slug=article_slug)
    car_models = article.car_models.all()
    return render(request, 'automobile_company/automobile-history/changing-faces-of-the-car.html', {'article': article, 'car_models': car_models})


# Automobile History end


#Lubricants/lubricants
def lubricants_page(request):
    lubricants = Lubricant.objects.all()
    additives = Additive.objects.all()
    context = {
        'lubricants': lubricants,
        'additives': additives,
    }
    return render(request, 'automobile_company/lubricants/lubricants.html', context)


