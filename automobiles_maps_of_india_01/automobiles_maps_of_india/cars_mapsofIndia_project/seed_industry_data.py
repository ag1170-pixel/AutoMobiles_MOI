#!/usr/bin/env python
import os
import django

os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'cardealer.settings')
django.setup()

from carshanders.models import Company, MarketShare, ExportData

def seed_data():
    print("Creating seed data...")
    
    # Create Companies
    companies_data = [
        {
            'name': 'Maruti Suzuki',
            'logo_url': 'https://example.com/logos/maruti.png',
            'description': 'India\'s largest passenger car manufacturer with over 50% market share.'
        },
        {
            'name': 'Hyundai Motor India',
            'logo_url': 'https://example.com/logos/hyundai.png',
            'description': 'Second largest car manufacturer in India and a major exporter.'
        },
        {
            'name': 'Tata Motors',
            'logo_url': 'https://example.com/logos/tata.png',
            'description': 'Leading Indian automotive manufacturer known for commercial and passenger vehicles.'
        },
        {
            'name': 'Mahindra & Mahindra',
            'logo_url': 'https://example.com/logos/mahindra.png',
            'description': 'Major Indian SUV and utility vehicle manufacturer.'
        },
        {
            'name': 'Kia India',
            'logo_url': 'https://example.com/logos/kia.png',
            'description': 'Fastest growing automotive brand in India.'
        },
        {
            'name': 'Toyota Kirloskar',
            'logo_url': 'https://example.com/logos/toyota.png',
            'description': 'Joint venture between Toyota and Kirloskar Group.'
        },
        {
            'name': 'Honda Cars India',
            'logo_url': 'https://example.com/logos/honda.png',
            'description': 'Japanese automaker with strong presence in India.'
        },
        {
            'name': 'MG Motor India',
            'logo_url': 'https://example.com/logos/mg.png',
            'description': 'British automotive brand with Chinese ownership.'
        }
    ]
    
    for company_data in companies_data:
        company, created = Company.objects.get_or_create(
            name=company_data['name'],
            defaults=company_data
        )
        if created:
            print(f"Created company: {company.name}")
    
    # Create Market Share Data
    market_share_data = [
        {'category': 'Passenger Vehicles', 'share': 45.50},
        {'category': 'Commercial Vehicles', 'share': 25.30},
        {'category': 'Two Wheelers', 'share': 75.20},
        {'category': 'Three Wheelers', 'share': 12.80},
        {'category': 'Electric Vehicles', 'share': 3.20},
        {'category': 'Luxury Vehicles', 'share': 2.50},
        {'category': 'SUVs', 'share': 35.80},
        {'category': 'Compact Cars', 'share': 28.90}
    ]
    
    for share_data in market_share_data:
        share, created = MarketShare.objects.get_or_create(
            category=share_data['category'],
            defaults=share_data
        )
        if created:
            print(f"Created market share: {share.category}")
    
    # Create Export Data
    export_data = [
        {'year': 2018, 'growth': 14.50},
        {'year': 2019, 'growth': 8.30},
        {'year': 2020, 'growth': -5.20},
        {'year': 2021, 'growth': 22.80},
        {'year': 2022, 'growth': 18.60},
        {'year': 2023, 'growth': 25.40},
        {'year': 2024, 'growth': 31.20}
    ]
    
    for export_info in export_data:
        export, created = ExportData.objects.get_or_create(
            year=export_info['year'],
            defaults=export_info
        )
        if created:
            print(f"Created export data: {export.year}")
    
    print("Seed data creation completed!")
    print(f"Companies: {Company.objects.count()}")
    print(f"Market Shares: {MarketShare.objects.count()}")
    print(f"Export Data: {ExportData.objects.count()}")

if __name__ == '__main__':
    seed_data()
