#!/usr/bin/env python
import os
import django

# Set up Django
os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'cardealer.settings')
django.setup()

from usefulInfo.models import Useful, AutomobileTip, AutomobileInfo, InfoArticle
from django.db import connection

def test_database_connection():
    """Test database connectivity and model data"""
    print("=== DATABASE CONNECTION TEST ===")
    
    # Test database connection
    try:
        with connection.cursor() as cursor:
            cursor.execute("SELECT 1")
            result = cursor.fetchone()
            print(f"✓ Database connection successful: {result}")
    except Exception as e:
        print(f"✗ Database connection failed: {e}")
        return False
    
    # Test Useful model
    print("\n=== USEFUL MODEL TEST ===")
    try:
        useful_count = Useful.objects.count()
        print(f"✓ Useful model accessible - Total records: {useful_count}")
        
        if useful_count > 0:
            print("Sample records:")
            for i, useful in enumerate(Useful.objects.all()[:3]):
                print(f"  {i+1}. {useful.title} (slug: {useful.slug})")
        else:
            print("  No records found in Useful model")
            
    except Exception as e:
        print(f"✗ Useful model error: {e}")
        return False
    
    # Test AutomobileTip model
    print("\n=== AUTOMOBILE TIP MODEL TEST ===")
    try:
        tips_count = AutomobileTip.objects.count()
        print(f"✓ AutomobileTip model accessible - Total records: {tips_count}")
        
        if tips_count > 0:
            print("Sample records:")
            for i, tip in enumerate(AutomobileTip.objects.all()[:3]):
                print(f"  {i+1}. {tip.title}")
        else:
            print("  No records found in AutomobileTip model")
            
    except Exception as e:
        print(f"✗ AutomobileTip model error: {e}")
        return False
    
    # Test AutomobileInfo model
    print("\n=== AUTOMOBILE INFO MODEL TEST ===")
    try:
        info_count = AutomobileInfo.objects.count()
        print(f"✓ AutomobileInfo model accessible - Total records: {info_count}")
        
        if info_count > 0:
            print("Sample records:")
            for i, info in enumerate(AutomobileInfo.objects.all()[:3]):
                print(f"  {i+1}. {info.title} (slug: {info.slug})")
        else:
            print("  No records found in AutomobileInfo model")
            
    except Exception as e:
        print(f"✗ AutomobileInfo model error: {e}")
        return False
    
    # Test InfoArticle model
    print("\n=== INFO ARTICLE MODEL TEST ===")
    try:
        articles_count = InfoArticle.objects.count()
        print(f"✓ InfoArticle model accessible - Total records: {articles_count}")
        
        if articles_count > 0:
            print("Sample records:")
            for i, article in enumerate(InfoArticle.objects.all()[:3]):
                print(f"  {i+1}. {article.title} (slug: {article.slug})")
        else:
            print("  No records found in InfoArticle model")
            
    except Exception as e:
        print(f"✗ InfoArticle model error: {e}")
        return False
    
    print("\n=== SUMMARY ===")
    total_records = useful_count + tips_count + info_count + articles_count
    print(f"Total records across all models: {total_records}")
    
    if total_records == 0:
        print("⚠️  All models are empty - NEEDS SEEDING")
        return False
    else:
        print("✓ Database contains data")
        return True

if __name__ == "__main__":
    test_database_connection()
