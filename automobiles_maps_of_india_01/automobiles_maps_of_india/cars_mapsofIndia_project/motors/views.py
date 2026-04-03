from django.shortcuts import render
from django.http import JsonResponse
from .models import VehicleType, Manufacturer, VehicleModel

def home(request):
    """Motorsports home page"""
    return render(request, 'motors/home.html')

def list(manufacturers):
    pass

def get_manufacturers(request):
    vehicle_type_id = request.GET.get('vehicle_type')
    manufacturers = Manufacturer.objects.filter(vehicle_type_id=vehicle_type_id).values('id', 'name')
    return JsonResponse(list(manufacturers), safe=False)

def get_models(request):
    manufacturer_id = request.GET.get('manufacturer')
    models = VehicleModel.objects.filter(manufacturer_id=manufacturer_id).values('id', 'name')
    return JsonResponse(list(models), safe=False)

def submit_form(request):
    if request.method == 'POST':
        vehicle_type = request.POST.get('vehicle_type')
        manufacturer = request.POST.get('manufacturer')
        model = request.POST.get('model')
        # Process the data (e.g., save to database, perform actions)
        return JsonResponse({'status': 'success', 'message': 'Form submitted successfully'})
    return JsonResponse({'status': 'error', 'message': 'Invalid request method'})