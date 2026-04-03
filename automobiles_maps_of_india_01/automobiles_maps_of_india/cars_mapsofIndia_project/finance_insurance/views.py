from django.shortcuts import render
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger
from django.http import JsonResponse
from django.db.models import Q

# Create your views here.
from django.shortcuts import get_object_or_404
from .models import FinanceInsuranceArticle, FinanceCompany, InsuranceCompany

def article_list(request):
    articles = FinanceInsuranceArticle.objects.all().order_by('-last_updated')
    return render(request, 'car-finance-and-insurance/article_list.html', {'articles': articles})

def article_detail(request, slug):
    article = get_object_or_404(FinanceInsuranceArticle, slug=slug)
    return render(request, 'car-finance-and-insurance/article_details.html', {'article': article})

def finance_companies(request):
    companies = FinanceCompany.objects.all()
    return render(request, 'car-finance-and-insurance/car_finance_companies.html', {'companies': companies})

def car_insurance(request):
    companies_list = InsuranceCompany.objects.all()
    
    # Search functionality
    search_query = request.GET.get('search')
    if search_query:
        companies_list = companies_list.filter(name__icontains=search_query)
    
    # Pagination
    paginator = Paginator(companies_list, 6)  # Show 6 companies per page
    page = request.GET.get('page')
    
    try:
        companies = paginator.page(page)
    except PageNotAnInteger:
        companies = paginator.page(1)
    except EmptyPage:
        companies = paginator.page(paginator.num_pages)
    
    return render(request, 'car-finance-and-insurance/car-insurance.html', {'companies': companies})

def insurance_company(request):
    companies=InsuranceCompany.objects.all()
    return render(request,'car-finance-and-insurance/car_insurance_companies.html',{'companies':companies})

def insurance_company_autocomplete(request):
    """Autocomplete endpoint for insurance companies"""
    query = request.GET.get('q', '').strip()
    
    if not query or len(query) < 1:
        return JsonResponse({'suggestions': []})
    
    # Use istartswith for prefix-based matching on company name
    companies = InsuranceCompany.objects.filter(
        Q(name__istartswith=query)
    ).distinct()[:20]  # Limit to 20 results for performance
    
    suggestions = []
    for company in companies:
        suggestions.append({
            'name': company.name,
            'description': company.description[:100] + '...' if len(company.description) > 100 else company.description,
            'display_text': company.name
        })
    
    return JsonResponse({'suggestions': suggestions})