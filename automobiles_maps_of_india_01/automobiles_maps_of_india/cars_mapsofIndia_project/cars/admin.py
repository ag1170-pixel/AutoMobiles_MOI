from django.contrib import admin
from .models import Car,PetrolPump
from django.utils.html import format_html

# Register your models here.

admin.site.register(Car)
admin.site.register(PetrolPump)

# import csv
# from django.contrib import admin
# from django.shortcuts import redirect
# from django.contrib import messages
# from django.utils.encoding import smart_str
# from .models import Car, PetrolPump
# from .forms import CSVUploadForm
# from django.http import HttpResponse
# from io import TextIOWrapper
# 
# class CarAdmin(admin.ModelAdmin):
#     list_display = ('name', 'model', 'price', 'manufacturer', 'fuel_type')
# 
#     def upload_csv(self, request):
#         if request.method == "POST":
#             form = CSVUploadForm(request.POST, request.FILES)
#             if form.is_valid():
#                 csv_file = TextIOWrapper(request.FILES["csv_file"].file, encoding="utf-8")
#                 reader = csv.DictReader(csv_file)
#                 for row in reader:
#                     Car.objects.create(
#                         category=row["category"],
#                         name=row["name"],
#                         model=row["model"],
#                         price=row["price"],
#                         length=row["length"],
#                         height=row["height"],
#                         width=row["width"],
#                         wheelbase=row["wheelbase"],
#                         kerb=row["kerb"],
#                         vehicle_type=row["vehicle_type"],
#                         ground_clearance=row["ground_clearance"],
#                         trunk_capacity=row["trunk_capacity"],
#                         fuel_tank_capacity=row["fuel_tank_capacity"],
#                         engine=row["engine"],
#                         gears=row["gears"],
#                         fuel_economy=row["fuel_economy"],
#                         top_speed=row["top_speed"],
#                         airbags=row["airbags"],
#                         seat_belts=row["seat_belts"],
#                         image=row["image"],
#                         manufac_place=row["manufac_place"],
#                         vehicle_overview=row["vehicle_overview"],
#                         features=row["features"],
#                         manufacturer=row["manufacturer"],
#                         fuel_type=row["fuel_type"],
#                         user_rating=row["user_rating"],
#                         mileage=row["mileage"],
#                         num_of_cylinders=row["num_of_cylinders"],
#                         body_type=row["body_type"],
#                     )
#                 messages.success(request, "CSV file uploaded successfully.")
#                 return redirect("..")
#         else:
#             form = CSVUploadForm()
#         return redirect("..")
# 
#     def get_urls(self):
#         from django.urls import path
#         urls = super().get_urls()
#         custom_urls = [
#             path("upload-csv/", self.upload_csv, name="car_upload_csv"),
#         ]
#         return custom_urls + urls
# 
# admin.site.register(Car, CarAdmin)
# 
# class PetrolPumpAdmin(admin.ModelAdmin):
#     list_display = ("name", "location", "state", "company_name")
# 
#     def upload_csv(self, request):
#         if request.method == "POST":
#             form = CSVUploadForm(request.POST, request.FILES)
#             if form.is_valid():
#                 csv_file = TextIOWrapper(request.FILES["csv_file"].file, encoding="utf-8")
#                 reader = csv.DictReader(csv_file)
#                 for row in reader:
#                     PetrolPump.objects.create(
#                         state=row["state"],
#                         location=row["location"],
#                         name=row["name"],
#                         address=row["address"],
#                         phone=row["phone"],
#                         company_name=row["company_name"],
#                     )
#                 messages.success(request, "CSV file uploaded successfully.")
#                 return redirect("..")
#         else:
#             form = CSVUploadForm()
#         return redirect("..")
# 
#     def get_urls(self):
#         from django.urls import path
#         urls = super().get_urls()
#         custom_urls = [
#             path("upload-csv/", self.upload_csv, name="petrolpump_upload_csv"),
#         ]
#         return custom_urls + urls
# 
# admin.site.register(PetrolPump, PetrolPumpAdmin)
# 
# 
# def has_add_permission(self, request):
#     return request.user.is_superuser
# 
