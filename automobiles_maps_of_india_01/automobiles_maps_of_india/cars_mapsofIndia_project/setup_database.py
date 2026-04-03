#!/usr/bin/env python
"""
Database setup script for automobile companies application.
This script will:
1. Run Django migrations
2. Populate the database with sample data
3. Verify the setup
"""

import os
import sys
import django

# Add the project directory to Python path
project_dir = os.path.dirname(os.path.abspath(__file__))
sys.path.append(project_dir)

# Set Django settings
os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'cardealer.settings')
django.setup()

from django.core.management import call_command
from django.db import connection
from automobile_company.models import Company, ProfitData, News

def setup_database():
    """Setup the database with migrations and sample data."""
    print("🚀 Starting database setup for automobile companies...")
    
    try:
        # Test database connection
        with connection.cursor() as cursor:
            cursor.execute("SELECT 1")
        print("✅ Database connection successful")
        
        # Run migrations
        print("📋 Running migrations...")
        call_command('migrate', verbosity=0)
        print("✅ Migrations completed")
        
        # Setup sample data
        print("📊 Setting up sample data...")
        call_command('setup_database', verbosity=0)
        print("✅ Sample data created")
        
        # Verify setup
        print("🔍 Verifying setup...")
        company_count = Company.objects.count()
        profit_count = ProfitData.objects.count()
        news_count = News.objects.count()
        
        print(f"✅ Database setup completed successfully!")
        print(f"   📈 Companies: {company_count}")
        print(f"   💰 Profit records: {profit_count}")
        print(f"   📰 News articles: {news_count}")
        
        if company_count >= 6 and profit_count >= 18 and news_count >= 6:
            print("🎉 All sample data is ready! Your automobile companies page should now work perfectly.")
        else:
            print("⚠️  Some data might be missing. Please check the setup.")
            
    except Exception as e:
        print(f"❌ Error during setup: {e}")
        return False
    
    return True

if __name__ == '__main__':
    success = setup_database()
    if success:
        print("\n🎯 Next steps:")
        print("1. Start your Django development server: python manage.py runserver")
        print("2. Visit: http://127.0.0.1:8000/automobile-companies-in-india")
        print("3. The page should now load with sample data!")
    else:
        print("\n❌ Setup failed. Please check the error messages above.")
        sys.exit(1)
