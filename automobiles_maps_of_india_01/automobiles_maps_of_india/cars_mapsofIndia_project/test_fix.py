import os, django
os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'cardealer.settings')
django.setup()

from cars.models import Car

print('=== TESTING FIXED FILTER LOGIC ===')

# Test brands that should work
test_brands = ['AUDI', 'BMW', 'HONDA', 'HYUNDAI', 'Toyota', 'Honda']

for brand in test_brands:
    # Test the NEW logic (filter by category)
    category_count = Car.objects.filter(category__iexact=brand).count()
    
    # Test the OLD logic (filter by name) 
    name_count = Car.objects.filter(name__iexact=brand).count()
    
    print(f'{brand:12} -> Category: {category_count:3} | Name: {name_count:3}')

print('\n=== MAXUS TEST ===')
maxus_category = Car.objects.filter(category__iexact='Maxus').count()
maxus_name = Car.objects.filter(name__iexact='Maxus').count()
print(f'Maxus       -> Category: {maxus_category:3} | Name: {maxus_name:3}')

print('\n=== ACTUAL CATEGORIES IN DATABASE ===')
categories = Car.objects.values_list('category', flat=True).distinct()
for cat in sorted(set(categories)):
    count = Car.objects.filter(category=cat).count()
    print(f'[{cat}] -> {count} cars')
