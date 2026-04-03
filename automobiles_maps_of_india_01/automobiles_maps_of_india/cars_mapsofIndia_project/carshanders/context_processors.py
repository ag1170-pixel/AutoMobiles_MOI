from .views import get_service_centers_context

def service_centers(request):
    return get_service_centers_context()