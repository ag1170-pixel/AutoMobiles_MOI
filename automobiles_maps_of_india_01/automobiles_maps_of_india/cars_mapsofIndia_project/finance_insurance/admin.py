from django.contrib import admin
from .models import FinanceInsuranceArticle,FinanceCompany,InsuranceCompany

admin.site.register(FinanceInsuranceArticle)
admin.site.register(FinanceCompany)
admin.site.register(InsuranceCompany)
# Register your models here.
