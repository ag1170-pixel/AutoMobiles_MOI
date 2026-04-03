from django.shortcuts import render
from .models import TruckType, FamousTruck, TruckManufacturer, TruckOverview, BusType, FamousBus, BusManufacturer, Overview

def trucks_in_india(request):
    truck_types = TruckType.objects.all()
    famous_trucks = FamousTruck.objects.all()
    manufacturers = TruckManufacturer.objects.all()
    overview = TruckOverview.objects.first()

    context = {
        'truck_types': truck_types,
        'famous_trucks': famous_trucks,
        'manufacturers': manufacturers,
        'overview': overview,
    }
    return render(request, 'truck/trucks/trucks-in-india.html', context)

# Legacy bus view (kept for backward compatibility)
def buses_in_india(request):
    bus_types = BusType.objects.all()
    famous_buses = FamousBus.objects.all()
    manufacturers = BusManufacturer.objects.all()
    overview = Overview.objects.first()

    context = {
        'bus_types': bus_types,
        'famous_buses': famous_buses,
        'manufacturers': manufacturers,
        'overview': overview,
    }
    return render(request, 'truck/buses/buses-in-india.html', context)