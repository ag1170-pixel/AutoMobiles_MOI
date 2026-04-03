from bikes.models import Bike
import random
import os

def assign_unique_bike_images():
    """Assign unique images to different bike brands/categories"""
    
    # Available bike images
    bike_images = [
        'bike2.jpg',
        'bike2_5YBgK2Z.jpg', 
        'ktm.jpg',
        'ktm_DE8YbF5.jpg',
        'ktm_L32PZ2U.jpg',
        'ktm_SOiIMvB.jpg',
        'ktm_hd4BQAb.jpg',
        'ktm_vYDQJs1.jpg',
        'Royal_Enfield.jpeg',
        'Royal_Enfield_4J8D437.jpeg',
        'yamaha-fzs.jpg',
        'electric_bike.webp',
        'electric_bike_mqCJE9a.webp',
        'electric_bike_nnIsuq8.webp',
        'compare_bike.jpg',
        'Naked.jpg',
        'Hybrid_motercyle.jpg',
        'Bajaj_Service.jpg'
    ]
    
    # Brand to image mappings for better organization
    brand_image_mapping = {
        'HARLEY': ['bike2.jpg', 'compare_bike.jpg'],
        'KTM': ['ktm.jpg', 'ktm_DE8YbF5.jpg', 'ktm_L32PZ2U.jpg', 'ktm_SOiIMvB.jpg', 'ktm_hd4BQAb.jpg', 'ktm_vYDQJs1.jpg'],
        'YAMAHA': ['yamaha-fzs.jpg', 'bike2_5YBgK2Z.jpg'],
        'ROYAL': ['Royal_Enfield.jpeg', 'Royal_Enfield_4J8D437.jpeg'],
        'ROYAL ENFIELD': ['Royal_Enfield.jpeg', 'Royal_Enfield_4J8D437.jpeg'],
        'HONDA': ['bike2.jpg', 'compare_bike.jpg'],
        'KAWASAKI': ['bike2.jpg', 'compare_bike.jpg'],
        'BAJAJ': ['Bajaj_Service.jpg', 'bike2.jpg'],
        'HERO': ['bike2.jpg', 'compare_bike.jpg'],
        'DUCATI': ['Naked.jpg', 'compare_bike.jpg'],
        'BMW': ['bike2.jpg', 'compare_bike.jpg'],
        'SUZUKI': ['bike2.jpg', 'compare_bike.jpg'],
        'INDIAN': ['bike2.jpg', 'compare_bike.jpg'],
        'TRIUMPH': ['bike2.jpg', 'compare_bike.jpg']
    }
    
    # Get all bikes with images
    all_bikes = Bike.objects.exclude(image='').exclude(image__isnull=True)
    print(f"Processing {all_bikes.count()} bikes...")
    
    total_updated = 0
    
    # Process each bike
    for bike in all_bikes:
        bike_name_upper = bike.Bikename.upper()
        
        # Find matching brand images
        available_images = bike_images  # default to all images
        for brand, brand_images in brand_image_mapping.items():
            if brand in bike_name_upper:
                available_images = brand_images
                break
        
        # Assign random image from available options
        new_image = random.choice(available_images)
        bike.image = new_image
        bike.save()
        total_updated += 1
        
        if total_updated <= 10:  # Show first 10 updates
            print(f"Updated {bike.Bikename} {bike.Bikemodel}: {new_image}")
    
    print(f"\nSuccessfully updated {total_updated} bikes with unique images!")
    
    # Show final distribution
    print("\nFinal image distribution:")
    final_counts = {}
    for bike in all_bikes:
        img = str(bike.image)
        if img not in final_counts:
            final_counts[img] = 0
        final_counts[img] += 1
    
    for img, count in sorted(final_counts.items(), key=lambda x: x[1], reverse=True)[:10]:
        print(f"  {img}: {count} bikes")
    
    # Show specific examples
    print("\nSample results by brand:")
    brands_to_check = ['HARLEY', 'KTM', 'YAMAHA', 'ROYAL']
    for brand in brands_to_check:
        sample_bikes = Bike.objects.filter(Bikename__icontains=brand)[:2]
        for bike in sample_bikes:
            print(f"  {bike.Bikename} {bike.Bikemodel}: {bike.image}")

if __name__ == '__main__':
    assign_unique_bike_images()
