from django.core.management.base import BaseCommand
from petrol_cng_stations.models import City, DieselPrice,FuelPrice
import random
import requests
import logging


class Command(BaseCommand):
    help = 'Updates diesel prices from an external API'

    def handle(self, *args, **options):
        # Replace this URL with the actual API endpoint
        api_url = 'https://api.example.com/diesel_prices'

        try:
            response = requests.get(api_url)
            data = response.json()

            for city_data in data:
                city, created = City.objects.get_or_create(
                    name=city_data['name'],
                    defaults={'latitude': city_data['lat'], 'longitude': city_data['lng']}
                )

                DieselPrice.objects.create(
                    city=city,
                    price=city_data['price']
                )

            self.stdout.write(self.style.SUCCESS('Successfully updated diesel prices'))
        except Exception as e:
            self.stdout.write(self.style.ERROR(f'Error updating prices: {str(e)}'))



logger = logging.getLogger(__name__)

class Command(BaseCommand):
    help = 'Updates fuel prices'

    def handle(self, *args, **options):
        try:
            for price in FuelPrice.objects.all():
                price.cng_price += random.uniform(-1, 1)
                price.petrol_price += random.uniform(-1, 1)
                price.diesel_price += random.uniform(-1, 1)
                price.save()
            logger.info('Successfully updated fuel prices')
            self.stdout.write(self.style.SUCCESS('Successfully updated fuel prices'))
        except Exception as e:
            logger.error(f'Error updating fuel prices: {str(e)}')
            self.stdout.write(self.style.ERROR(f'Error updating fuel prices: {str(e)}'))