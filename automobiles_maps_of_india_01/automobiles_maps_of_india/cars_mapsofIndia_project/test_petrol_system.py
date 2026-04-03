#!/usr/bin/env python
"""
Test script to verify the unified petrol pump system is working correctly
"""
import os
import sys
import django

# Setup Django
sys.path.append(os.path.dirname(os.path.abspath(__file__)))
os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'cardealer.settings')
django.setup()

from cars.models import PetrolPump
from petrol_cng_stations.views import petrol_pump_list, get_cities_by_state, petrol_pump_autocomplete
from django.test import RequestFactory

def test_database_connection():
    """Test database connection and data availability"""
    print("🔍 Testing database connection...")
    count = PetrolPump.objects.count()
    print(f"✓ Database connected: {count:,} petrol pumps found")
    return count > 0

def test_unified_view():
    """Test the unified petrol_pump_list view"""
    print("\n🔍 Testing unified view...")
    factory = RequestFactory()
    
    # Test main page
    request = factory.get('/petrolstations/')
    response = petrol_pump_list(request)
    print(f"✓ Main page: {response.status_code}")
    
    # Test state page
    request = factory.get('/petrolstations/', {'state': 'Delhi'})
    response = petrol_pump_list(request)
    print(f"✓ State filter: {response.status_code}")
    
    # Test search
    request = factory.get('/petrolstations/', {'search': 'HP'})
    response = petrol_pump_list(request)
    print(f"✓ Search functionality: {response.status_code}")
    
    return True

def test_api_endpoints():
    """Test API endpoints"""
    print("\n🔍 Testing API endpoints...")
    factory = RequestFactory()
    
    # Test cities API
    request = factory.get('/get_cities_by_state/', {'state': 'Delhi'})
    response = get_cities_by_state(request)
    cities = response.get('json', [])
    print(f"✓ Cities API: {response.status_code} ({len(cities)} cities)")
    
    # Test autocomplete API
    request = factory.get('/api/petrol-pump-autocomplete/', {'q': 'HP'})
    response = petrol_pump_autocomplete(request)
    suggestions = response.get('suggestions', [])
    print(f"✓ Autocomplete API: {response.status_code} ({len(suggestions)} suggestions)")
    
    return True

def test_search_functionality():
    """Test search functionality directly"""
    print("\n🔍 Testing search functionality...")
    from django.db.models import Q
    
    # Test different search types
    searches = [
        ('name', 'HP'),
        ('company', 'IOCL'),
        ('location', 'Delhi'),
        ('address', 'Station')
    ]
    
    for search_type, query in searches:
        if search_type == 'name':
            results = PetrolPump.objects.filter(name__icontains=query)[:3]
        elif search_type == 'company':
            results = PetrolPump.objects.filter(company_name__icontains=query)[:3]
        elif search_type == 'location':
            results = PetrolPump.objects.filter(location__icontains=query)[:3]
        elif search_type == 'address':
            results = PetrolPump.objects.filter(address__icontains=query)[:3]
        
        print(f"✓ {search_type.title()} search '{query}': {len(results)} results")
    
    return True

def main():
    """Run all tests"""
    print("🚀 Testing Unified Petrol Pump System")
    print("=" * 50)
    
    tests = [
        test_database_connection,
        test_unified_view,
        test_api_endpoints,
        test_search_functionality
    ]
    
    passed = 0
    for test in tests:
        try:
            if test():
                passed += 1
        except Exception as e:
            print(f"❌ Test failed: {e}")
    
    print("\n" + "=" * 50)
    print(f"📊 Test Results: {passed}/{len(tests)} tests passed")
    
    if passed == len(tests):
        print("🎉 All tests passed! The unified petrol pump system is working correctly.")
        return True
    else:
        print("❌ Some tests failed. Please check the issues above.")
        return False

if __name__ == '__main__':
    success = main()
    sys.exit(0 if success else 1)
