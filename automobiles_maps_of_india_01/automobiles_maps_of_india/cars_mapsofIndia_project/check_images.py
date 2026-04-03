#!/usr/bin/env python
import os
import django

# Set up Django
os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'cardealer.settings')
django.setup()

from images.models import DynamicImage

print('=== Dynamic Images in Database ===')
print(f'Total images: {DynamicImage.objects.count()}')
print()

for img in DynamicImage.objects.all():
    print(f'Name: {img.name}')
    print(f'Page: {img.page_reference}')
    print(f'Image URL: {img.image.url if img.image else "No file"}')
    print(f'Active: {img.is_active}')
    print('---')
