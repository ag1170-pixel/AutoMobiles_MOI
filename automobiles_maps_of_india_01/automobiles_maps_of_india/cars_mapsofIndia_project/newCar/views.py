from django.shortcuts import render

# Create your views here.
from django.shortcuts import get_object_or_404
from django.views.generic import ListView, DetailView
from .models import New_Car
# from cars.models import Car
from .models import UpcomingCar
from django.core.paginator import Paginator


# upcoming_cars/views.py
def upcoming_cars_list(request):
    cars_list = UpcomingCar.objects.all().order_by('expected_launch')
    paginator = Paginator(cars_list, 12)  # Show 12 cars per page
    page_number = request.GET.get('page')
    cars = paginator.get_page(page_number)
    return render(request, 'newCars/upcoming-cars/upcoming-cars.html', {'cars': cars})


def upcoming_car_detail(request, car_id):
    Upcoming_car = get_object_or_404(UpcomingCar, id=car_id)
    upcoming_car = get_object_or_404(UpcomingCar)
    return render(request, 'newCars/upcoming-cars/upcoming-cars-details.html', {'upcoming_car': upcoming_car})




#New Cars

class NewCarList(ListView):
    model = New_Car
    template_name = 'newCars/news_cars/news_cars_list.html'
    context_object_name = 'cars'
    paginate_by = 10

class NewCarDetail(DetailView):
    model = New_Car
    template_name = 'newCars/news_cars/news_cars_detail.html'
    context_object_name = 'car'
    slug_url_kwarg = 'car_slug'

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['related_cars'] = New_Car.objects.filter(brand=self.object.brand).exclude(id=self.object.id)[:3]
        return context