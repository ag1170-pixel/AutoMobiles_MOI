"""
Shared budget filtering utility for Cars and Bikes.

This module provides a unified function to handle budget range filtering
across different vehicle types, normalizing price values to absolute rupees
before applying numeric range-based filtering.
"""

from django.db.models import Q
import logging

logger = logging.getLogger(__name__)

def parse_budget_range(budget_range):
    """
    Parse budget range string into min and max prices in absolute rupees.
    
    Args:
        budget_range (str): Budget range string like "1-3", "3-5", "5-10", "10+"
        
    Returns:
        tuple: (min_price, max_price) in absolute rupees, or (None, None) if invalid
    """
    if not budget_range or not isinstance(budget_range, str):
        return None, None
    
    budget_range = budget_range.strip()
    
    try:
        if budget_range.endswith('+'):
            # Handle "10+" format
            min_lakh = float(budget_range[:-1])
            min_price = int(min_lakh * 100000)
            return min_price, None
            
        elif '-' in budget_range:
            # Handle "1-3" format
            parts = budget_range.split('-', 1)
            if len(parts) == 2:
                min_lakh = float(parts[0].strip())
                max_lakh = float(parts[1].strip())
                min_price = int(min_lakh * 100000)
                max_price = int(max_lakh * 100000)
                return min_price, max_price
                
    except (ValueError, TypeError) as e:
        logger.warning(f"Invalid budget range format: {budget_range} - {e}")
        
    return None, None


def apply_budget_filter(queryset, budget_range, vehicle_type='car'):
    """
    Apply budget range filter to a queryset, normalizing prices to absolute rupees.
    
    Args:
        queryset: Django queryset to filter
        budget_range (str): Budget range string like "1-3", "3-5", "5-10", "10+"
        vehicle_type (str): 'car' or 'bike' to determine price normalization
        
    Returns:
        Filtered queryset
    """
    if not budget_range:
        return queryset
    
    min_price, max_price = parse_budget_range(budget_range)
    
    if min_price is None and max_price is None:
        # Invalid budget range, return empty queryset
        return queryset.none()
    
    # Build price filter based on vehicle type
    price_filter = Q()
    
    if vehicle_type.lower() == 'car':
        # Cars store prices in Lakhs, convert to absolute rupees for comparison
        if min_price is not None:
            price_filter &= Q(price__gte=min_price / 100000.0)
        if max_price is not None:
            price_filter &= Q(price__lte=max_price / 100000.0)
            
    elif vehicle_type.lower() == 'bike':
        # Bikes store prices in absolute rupees
        if min_price is not None:
            price_filter &= Q(price__gte=min_price)
        if max_price is not None:
            price_filter &= Q(price__lte=max_price)
            
    else:
        logger.warning(f"Unknown vehicle type: {vehicle_type}")
        return queryset.none()
    
    # Exclude vehicles with null or invalid prices
    price_filter &= Q(price__isnull=False)
    
    filtered_queryset = queryset.filter(price_filter)
    
    logger.info(f"Budget filter applied: {budget_range} -> {vehicle_type} -> "
                f"{filtered_queryset.count()} results (from {queryset.count()} total)")
    
    return filtered_queryset


def normalize_price_for_display(price, vehicle_type='car'):
    """
    Normalize price for consistent display across vehicle types.
    
    Args:
        price (float): Raw price from database
        vehicle_type (str): 'car' or 'bike'
        
    Returns:
        float: Price in absolute rupees
    """
    if price is None:
        return 0
    
    if vehicle_type.lower() == 'car':
        # Cars store prices in Lakhs, convert to absolute rupees
        return float(price) * 100000
    else:
        # Bikes already store prices in absolute rupees
        return float(price)


def format_price_for_display(price, vehicle_type='car'):
    """
    Format price for display with appropriate units.
    
    Args:
        price (float): Price in database units
        vehicle_type (str): 'car' or 'bike'
        
    Returns:
        str: Formatted price string
    """
    if price is None:
        return "Price Not Available"
    
    absolute_price = normalize_price_for_display(price, vehicle_type)
    
    if absolute_price >= 10000000:  # 1 Crore or more
        return f"₹{absolute_price/10000000:.2f} Cr"
    elif absolute_price >= 100000:  # 1 Lakh or more
        return f"₹{absolute_price/100000:.2f} Lakh"
    else:
        return f"₹{absolute_price:,.0f}"
