from django.shortcuts import render
from .models import UsedCar, CarDealer, BuyingTip
from django.shortcuts import render
from django.http import JsonResponse
from .models import CarCareTip

# Create your views here.
#second -hand car market in india


def secondHand_Car_Dealer(request):
    dealers = CarDealer.objects.all().order_by('-rating')
    context = {
        'dealers': dealers,
    }
    return render(request, 'usedCar/second-hand-car-market-in-india/second-hand-car-dealers.html', context)

def secondHand_Car(request):
    dealers = CarDealer.objects.all().order_by('-rating')
    context = {
        'dealers': dealers,
    }
    return render(request, 'usedCar/second-hand-car-market-in-india/buying-used-cars.html', context)
def used_cars(request):
    cars = UsedCar.objects.all()
    return render(request, 'usedCar/second-hand-car-market-in-india/used-cars.html', {'cars': cars})

# def car_dealers(request):
#     dealers = CarDealer.objects.all()
#     return render(request, 'usedCar/second-hand-car-market-in-india/used-car-dealers.html', {'dealers': dealers})


def car_dealers(request):

    dealers = CarDealer.objects.all().order_by('-rating')
    context = {
        'dealers': dealers
    }
    return render(request, 'usedCar/second-hand-car-market-in-india/used-car-dealers.html', {'dealers': dealers})

def buying_tips(request):
    tips = BuyingTip.objects.all()
    return render(request, 'usedCar/second-hand-car-market-in-india/used-car-dealers.html', {'tips': tips})



# cars tips



def car_care_tips(request):
    return render(request, 'usedCar/car-care-tips/cars_tips.html')

def api_car_care_tips(request):
    tips = CarCareTip.objects.all()
    data = [{'title': tip.title, 'description': tip.description, 'icon': tip.icon} for tip in tips]
    return JsonResponse(data, safe=False)
