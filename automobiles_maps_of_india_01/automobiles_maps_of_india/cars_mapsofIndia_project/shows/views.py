from django.shortcuts import render, get_object_or_404
from django.utils import timezone
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger
from .models import (
     Expo, Event,AutoShow, TVShow, RelatedLink
)

# Create your views here.
def search_expos(request):
    query = request.GET.get('q')
    if query:
        results = Expo.objects.filter(title__icontains=query)
    else:
        results = []
    context = {
        'results': results,
        'query': query,
    }
    return render(request, 'shows/autoexpo/search_results.html', context)

def auto_expo_detail(request, year):
    expo = get_object_or_404(Expo, year=year)
    events = expo.events.all()

    paginator = Paginator(events, 10)
    page = request.GET.get('page')
    try:
        events = paginator.page(page)
    except PageNotAnInteger:
        events = paginator.page(1)
    except EmptyPage:
        events = paginator.page(paginator.num_pages)

    context = {
        'expo': expo,
        'events': events,
    }
    return render(request, 'shows/autoexpo/autoexpo-details.html', context)

def event_detail(request, event_id):
    event = get_object_or_404(Event, pk=event_id)
    context = {
        'event': event,
    }
    return render(request, 'shows/autoexpo/autoexpo-details.html', context)


def show_home(request):
    auto_shows = AutoShow.objects.all()
    tv_shows = TVShow.objects.all()
    related_links = RelatedLink.objects.all()
    return render(request, 'shows/show_home.html', {
        'auto_shows': auto_shows,
        'tv_shows': tv_shows,
        'related_links': related_links,
    })

def auto_show_detail(request, show_id):
    # show = AutoShow.objects.get(id=show_id)
    show = get_object_or_404(AutoShow, id=show_id)
    return render(request, 'shows/auto_show_detail.html', {'show': show})
