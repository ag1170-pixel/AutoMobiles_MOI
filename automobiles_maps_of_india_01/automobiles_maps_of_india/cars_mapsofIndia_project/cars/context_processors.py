def petrol_pump_data(request):
    from .models import PetrolPump

    try:
        state_search = PetrolPump.objects.values_list('state', flat=True).distinct()
    except:
        state_search = []

    return {
        'state_search': state_search,
    }