#!/usr/bin/env python
"""
Safe seeding script for Useful Information models.
Contains curated, generic, non-copyrighted automobile information.
"""

import os
import django

# Set up Django
os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'cardealer.settings')
django.setup()

from usefulInfo.models import Useful, AutomobileTip, AutomobileInfo, InfoArticle
from django.utils.text import slugify

def seed_useful_info():
    """Seed the Useful model with safe, curated content"""
    print("=== SEEDING USEFUL INFO ===")
    
    useful_data = [
        {
            "title": "How to Improve Car Mileage",
            "content": """Improving your car's fuel efficiency is easier than you might think. Start by maintaining proper tire pressure - underinflated tires can reduce fuel economy by up to 3%. Regular engine maintenance is crucial; clean air filters and proper oil changes help your engine run more efficiently. 

Drive smoothly by avoiding rapid acceleration and hard braking. Use cruise control on highways when possible. Remove excess weight from your vehicle and avoid carrying unnecessary items in your trunk. 

Combine errands into one trip and plan your route to avoid traffic congestion. Using the recommended grade of motor oil can improve fuel economy by 1-2%. These simple habits can add up to significant savings over time."""
        },
        {
            "title": "Basic Bike Maintenance Checklist",
            "content": """Regular motorcycle maintenance ensures safety and longevity. Check tire pressure before every ride - proper inflation improves handling and fuel efficiency. Inspect tread depth and look for signs of wear or damage.

Check engine oil level weekly and change it according to your manufacturer's schedule. Test your brakes regularly - ensure pads have sufficient thickness and brake fluid is at the correct level.

Clean and lubricate the chain every 500-1000 km. Check all lights, signals, and horn functionality. Inspect cables for fraying or damage. Tighten any loose bolts and fasteners.

Replace air filters as recommended, usually every 12,000 km or sooner if riding in dusty conditions. Keep your battery clean and charged, especially during storage periods."""
        },
        {
            "title": "Petrol vs Diesel: Making the Right Choice",
            "content": """Choosing between petrol and diesel engines depends on your driving needs. Diesel engines typically offer better fuel economy and torque, making them ideal for long-distance highway driving and heavy loads.

Petrol engines generally have lower initial costs and are quieter. They're better suited for city driving with frequent stops and starts. Modern petrol engines have become much more fuel-efficient.

Consider your annual mileage - diesel becomes cost-effective only after driving 15,000-20,000 km per year. Factor in maintenance costs - diesel servicing can be more expensive but intervals are often longer.

Check emission regulations in your area. Some cities restrict diesel vehicles due to higher NOx emissions. Test drive both options to see which suits your driving style better."""
        },
        {
            "title": "EV Charging Tips for Indian Drivers",
            "content": """Electric vehicle charging in India requires planning. Home charging is most convenient - install a dedicated 15-amp socket with proper earthing. A full charge typically takes 6-8 hours using standard home charging.

Public charging stations are growing rapidly in major cities. Use apps like Tata Power or ChargePoint to locate stations near you. Fast charging can provide 80% charge in 45-60 minutes but costs more.

Plan longer journeys around charging infrastructure. Most highways between major cities now have charging stations every 100-150 km. Consider charging during meal breaks.

Maximize battery life by avoiding frequent fast charging and maintaining charge between 20-80%. Use regenerative braking when possible. Pre-cool your car while plugged in to save battery during driving."""
        },
        {
            "title": "When to Service Your Vehicle",
            "content": """Regular vehicle servicing prevents breakdowns and extends lifespan. Follow your manufacturer's recommended schedule, typically every 5,000-10,000 km or 6-12 months, whichever comes first.

Watch for warning signs: unusual noises, warning lights, decreased performance, or fluid leaks. Address these promptly to avoid costly repairs. Check oil level monthly and tire pressure weekly.

Seasonal checks are important. Before monsoon, check wipers, tires, and brakes. Before summer, verify AC performance and coolant levels. Before winter, ensure battery health and heater functionality.

Keep records of all services. This helps maintain resale value and helps diagnose recurring issues. Choose authorized service centers for warranty coverage, especially during the warranty period."""
        },
        {
            "title": "Understanding Vehicle Insurance Basics",
            "content": """Vehicle insurance is mandatory in India. Third-party insurance covers damage to other vehicles and property, but not your own vehicle. Comprehensive coverage includes third-party plus damage to your own vehicle.

Key factors affecting premium: vehicle type, engine capacity, location, and driver's age. No-claim bonus rewards safe driving with premium discounts up to 50% after 5 claim-free years.

Add-on covers include zero depreciation for new cars, roadside assistance, and engine protection. Evaluate these based on your needs and vehicle age.

Always carry valid insurance documents. Renew policies before expiry to avoid lapses. Compare quotes from multiple insurers but don't choose solely on price - consider claim settlement ratio and service quality."""
        }
    ]
    
    created_count = 0
    for data in useful_data:
        slug = slugify(data['title'])
        if not Useful.objects.filter(slug=slug).exists():
            Useful.objects.create(
                title=data['title'],
                slug=slug,
                content=data['content']
            )
            created_count += 1
            print(f"✓ Created: {data['title']}")
        else:
            print(f"⚠ Already exists: {data['title']}")
    
    print(f"Useful info seeding complete. Created {created_count} new records.")

def seed_automobile_tips():
    """Seed AutomobileTip model with practical tips"""
    print("\n=== SEEDING AUTOMOBILE TIPS ===")
    
    tips_data = [
        {
            "title": "Emergency Kit Essentials",
            "content": "Every vehicle should have an emergency kit: spare tire, jack, jumper cables, basic tools, flashlight, first-aid supplies, water, and emergency contact numbers. Check and replenish every six months.",
            "order": 1
        },
        {
            "title": "Fuel Efficiency Hacks",
            "content": "Maintain steady speeds, avoid excessive idling, keep windows closed at high speeds, remove roof racks when not needed, and use air conditioning judiciously to maximize fuel efficiency.",
            "order": 2
        },
        {
            "title": "Monsoon Driving Safety",
            "content": "Check tire tread depth, replace worn wipers, ensure working defrosters, drive slower in wet conditions, maintain greater following distance, and avoid flooded roads during monsoon season.",
            "order": 3
        },
        {
            "title": "Battery Maintenance",
            "content": "Clean battery terminals regularly, check electrolyte levels, ensure tight connections, test battery voltage monthly, and replace batteries every 3-4 years for reliable performance.",
            "order": 4
        },
        {
            "title": "Summer Vehicle Care",
            "content": "Check coolant levels, test AC performance, inspect hoses for cracks, monitor tire pressure (increases with heat), and park in shade when possible during hot summer months.",
            "order": 5
        }
    ]
    
    created_count = 0
    for data in tips_data:
        if not AutomobileTip.objects.filter(title=data['title']).exists():
            AutomobileTip.objects.create(
                title=data['title'],
                content=data['content'],
                order=data['order']
            )
            created_count += 1
            print(f"✓ Created: {data['title']}")
        else:
            print(f"⚠ Already exists: {data['title']}")
    
    print(f"Automobile tips seeding complete. Created {created_count} new records.")

def seed_automobile_info():
    """Seed AutomobileInfo model with technical information"""
    print("\n=== SEEDING AUTOMOBILE INFO ===")
    
    info_data = [
        {
            "title": "Understanding ABS Brakes",
            "content": """Anti-lock Braking System (ABS) prevents wheels from locking during hard braking. It allows steering control while braking maximally. ABS works by rapidly pumping brakes when it detects wheel lock.

Benefits include shorter stopping distances on most surfaces, ability to steer around obstacles, and stability during emergency braking. ABS is especially valuable on wet or slippery roads.

Remember to press brake pedal firmly and continuously - don't pump ABS brakes yourself. The system will make pulsing sensations and noises during operation, which is normal."""
        },
        {
            "title": "Airbag Safety Systems",
            "content": """Airbags supplement seatbelts in frontal collisions. They deploy in milliseconds when sensors detect severe impact. Modern vehicles may have multiple airbags: front, side, curtain, and knee airbags.

Airbags are most effective when seated properly - at least 10 inches from steering wheel, with seatbelt correctly positioned. Children under 12 should always ride in back seats.

Airbags require replacement after deployment. Some vehicles have seatbelt pretensioners that work with airbags for optimal protection. Never disable airbag systems unless medically necessary."""
        },
        {
            "title": "Transmission Types Explained",
            "content": """Manual transmissions offer driver control and typically better fuel efficiency. They require clutch operation and gear selection. Learning curve exists but many drivers prefer the engagement.

Automatic transmissions provide convenience, especially in traffic. Modern automatics are efficient and may have manual modes. CVT (continuously variable) transmissions offer smooth acceleration without gear shifts.

Dual-clutch transmissions combine manual efficiency with automatic convenience. They use two clutches for pre-selected gears, providing very fast shifts. Each type has advantages depending on driving conditions."""
        }
    ]
    
    created_count = 0
    for data in info_data:
        slug = slugify(data['title'])
        if not AutomobileInfo.objects.filter(slug=slug).exists():
            AutomobileInfo.objects.create(
                title=data['title'],
                slug=slug,
                content=data['content']
            )
            created_count += 1
            print(f"✓ Created: {data['title']}")
        else:
            print(f"⚠ Already exists: {data['title']}")
    
    print(f"Automobile info seeding complete. Created {created_count} new records.")

def seed_info_articles():
    """Seed InfoArticle model with maintenance guides"""
    print("\n=== SEEDING INFO ARTICLES ===")
    
    articles_data = [
        {
            "title": "Monthly Vehicle Maintenance",
            "slug": "monthly-vehicle-maintenance",
            "content": """Monthly checks keep your vehicle running smoothly. Check tire pressure when cold - including the spare. Inspect tread wear using the coin test. Check all fluid levels: engine oil, coolant, brake fluid, and windshield washer.

Test all lights: headlights, brake lights, turn signals, and reverse lights. Clean mirrors and windows for visibility. Check wiper blades for streaking or skipping. Listen for unusual noises during operation.

Inspect belts and hoses for cracks or wear. Check battery terminals for corrosion. Test horn operation. Look under vehicle for any fluid leaks. Address any issues promptly to prevent costly repairs."""
        },
        {
            "title": "Pre-Trip Vehicle Inspection",
            "slug": "pre-trip-vehicle-inspection",
            "content": """Before long journeys, perform thorough checks. Verify tire condition and pressure. Check oil level and top up if needed. Ensure coolant is at proper level. Test brakes for proper operation.

Verify all lights and signals work. Check spare tire condition and tools. Ensure jack and wheel wrench are present. Test windshield washer operation and fill fluid.

Pack emergency kit, first-aid supplies, and necessary documents. Plan route and identify service stations along the way. Inform someone of your travel plans. Ensure phone is charged for emergencies."""
        },
        {
            "title": "Winter Vehicle Preparation",
            "slug": "winter-vehicle-preparation",
            "content": """Winter requires special vehicle preparation. Install winter tires if temperatures regularly drop below 7°C. Check antifreeze concentration and protection level. Test battery health - cold weather reduces battery efficiency.

Replace worn wiper blades and use winter washer fluid. Check heater and defroster operation. Keep fuel tank at least half full to prevent fuel line freezing. Carry emergency supplies including blankets and snacks.

Pack winter-specific items: ice scraper, snow brush, small shovel, and sand or cat litter for traction. Practice winter driving techniques in safe areas before challenging conditions."""
        }
    ]
    
    created_count = 0
    for data in articles_data:
        if not InfoArticle.objects.filter(slug=data['slug']).exists():
            InfoArticle.objects.create(
                title=data['title'],
                slug=data['slug'],
                content=data['content']
            )
            created_count += 1
            print(f"✓ Created: {data['title']}")
        else:
            print(f"⚠ Already exists: {data['title']}")
    
    print(f"Info articles seeding complete. Created {created_count} new records.")

def main():
    """Main seeding function"""
    print("Starting safe automobile information seeding...")
    print("This script creates curated, non-copyrighted content only.\n")
    
    try:
        seed_useful_info()
        seed_automobile_tips()
        seed_automobile_info()
        seed_info_articles()
        
        print("\n=== SEEDING COMPLETE ===")
        print("✓ All models seeded successfully")
        print("✓ Content is safe and original")
        print("✓ Ready for testing")
        
    except Exception as e:
        print(f"\n✗ SEEDING FAILED: {e}")
        return False
    
    return True

if __name__ == "__main__":
    main()
