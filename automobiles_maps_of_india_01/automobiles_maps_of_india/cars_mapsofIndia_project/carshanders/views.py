from django.shortcuts import render, get_object_or_404
from django.utils import timezone
from django.http import JsonResponse
from django.views.decorators.http import require_http_methods
from django.views.decorators.csrf import csrf_exempt
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger
from django.db.models import Q
import json
from .models import (
    Company, Category, Component, Spare,CategoryComponent,
    College, AccessoryType, Store, RelatedLink, ServiceCenter, CarBrand,
    MarketShare, ExportData, AccessoryType, Accessory,CarAccessory, Shop,TyreManufacturer, TyreType
)


def commercial_vehicles(request):
    companies = Company.objects.all()

    context = {
        'companies': companies,
        'last_updated': timezone.now(),
    }

    return render(request, 'automobile_company/automobile-companies-in-india/commercial-vehicles-manufactures/commerical-vehicles.html', context)

# Remove or update two_wheeler_manufacturers view as it references a non-existent model


def category_list(request):
    categories = Category.objects.all()
    return render(request, 'automobile_company/automobile-components-and-spares/automobile-components-spares.html', {
        'categories': categories,
    })

def component_list(request):
    components = Component.objects.all()
    return render(request, 'automobile_company/automobile-components-and-spares/automobile-components.html', {'components': components})


def category_component_list(request):
    categories = CategoryComponent.objects.all().prefetch_related('component_set')
    return render(request, 'automobile_company/automobile-components-and-spares/automobile-components.html', {
        'categories': categories,
    })
# def category_component_list(request):
#     categories = CategoryComponent.objects.all()
#     return render(request, 'automobile_company/automobile-components-and-spares/automobile-components.html', {
#         'categories': categories,
#     })
def spare_list(request):
    spares = Spare.objects.all()
    return render(request, 'automobile_company/automobile-components-and-spares/auto-spares.html', {'spares': spares})

def component_detail(request, component_id):
    component = get_object_or_404(Component, id=component_id)
    return render(request, 'automobile_company/automobile-components-and-spares/automobile-components-spares.html', {'component': component})

def spare_detail(request, spare_id):
    spare = get_object_or_404(Spare, id=spare_id)
    return render(request, 'automobile_company/automobile-components-and-spares/auto-spares.html', {'spare': spare})

def college_list(request):
    search_query = request.GET.get('search', '')
    
    colleges = College.objects.all().order_by('name')  # Add ordering to fix pagination
    
    if search_query:
        colleges = colleges.filter(
            Q(name__icontains=search_query) |
            Q(location__icontains=search_query) |
            Q(contact_details__icontains=search_query) |
            Q(industry_interface__icontains=search_query)
        )
    
    paginator = Paginator(colleges, 12)  # Show 12 colleges per page
    page = request.GET.get('page')
    
    try:
        colleges = paginator.page(page)
    except PageNotAnInteger:
        colleges = paginator.page(1)
    except EmptyPage:
        colleges = paginator.page(paginator.num_pages)
    
    return render(request, 'automobile_company/automobile-engineering-colleges/college_list.html', {
        'colleges': colleges,
        'search_query': search_query,
    })


@csrf_exempt
@require_http_methods(["POST"])
def search_service_centers(request):
    try:
        data = json.loads(request.body)
        brand_id = data.get('brand')
        state = data.get('state')
        city = data.get('city')

        centers = ServiceCenter.objects.filter(
            brand_id=brand_id,
            state__iexact=state,
            city__iexact=city,
            is_active=True
        ).values('name', 'address', 'phone', 'working_hours', 'rating')

        return JsonResponse(list(centers), safe=False)
    except Exception as e:
        return JsonResponse({'error': str(e)}, status=500)

def service_centers(request):
    context = get_service_centers_context()
    return render(request, 'automobile_company/automobile-service-stations-in-india/service_centers.html', context)

def get_service_centers_context():
    service_centers = ServiceCenter.objects.select_related('brand').filter(is_active=True).order_by('brand__name', 'state', 'city')
    
    return {'service_centers': service_centers}

@require_http_methods(["GET"])
def get_brands(request):
    try:
        brand = list(CarBrand.objects.filter(is_active=True).values('id', 'name'))
        return JsonResponse(brand, safe=False)
    except Exception as e:
        return JsonResponse({'error': str(e)}, status=500)

@csrf_exempt

@require_http_methods(["POST"])
def search_service_centers(request):
    try:
        data = json.loads(request.body)
        brand_id = data.get('brand')
        state = data.get('state')
        city = data.get('city')

        centers = ServiceCenter.objects.filter(
            brand_id=brand_id,
            state__iexact=state,
            city__iexact=city,
            is_active=True
        ).values('name', 'address', 'phone', 'working_hours', 'rating')

        return JsonResponse(list(centers), safe=False)
    except Exception as e:
        return JsonResponse({'error': str(e)}, status=500)

def industry_overview(request):
    companies = Company.objects.all()  
    market_shares = MarketShare.objects.all()
    export_data = ExportData.objects.all()
    
    # Debug prints
    print(f"DEBUG - Companies count: {companies.count()}")
    print(f"DEBUG - MarketShare count: {market_shares.count()}")
    print(f"DEBUG - ExportData count: {export_data.count()}")

    context = {
        'companies': companies,
        'market_shares': market_shares,
        'export_data': export_data,
    }
    return render(request, 'automobile_company/automobile-industry-in-india/index.html', context)



#Accessories views

def car_accessories(request):
    context = {
        'about_text': "Car accessories are additional components or features that can be added to a vehicle to enhance its functionality, appearance, or performance. These accessories cater to various needs and preferences of car owners in India.",
        'interior_accessories': Accessory.objects.filter(category='interior'),
        'exterior_accessories': Accessory.objects.filter(category='exterior'),
        'other_accessories': Accessory.objects.filter(category='other'),
        'related_links': RelatedLink.objects.all(),
    }
    return render(request, 'automobile_company/car-accessories/car_accessories.html', context)



def accessories_details(request):
    accessories = CarAccessory.objects.all()
    shops = Shop.objects.all()

    context = {
        'accessories': accessories,
        'shops': shops,
        'categories': CarAccessory.CATEGORY_CHOICES,
    }
    return render(request, 'automobile_company/car-accessories/accessories_details.html', context)

def auto_tyres_india(request):
    manufacturers = TyreManufacturer.objects.all()
    tyre_types = TyreType.objects.all()
    context = {
        'manufacturers': manufacturers,
        'tyre_types': tyre_types,
    }
    return render(request, 'automobile_company/car-accessories/auto-tyres-india.html', context)


# Auto _accessories
def auto_accessories(request):
    accessories = AccessoryType.objects.all()
    stores = Store.objects.all()
    related_links = RelatedLink.objects.all()

    context = {
        'accessories': accessories,
        'stores': stores,
        'related_links': related_links,
    }

    return render(request, 'automobile_company/automobile-components-and-spares/auto-accessories.html', context)

