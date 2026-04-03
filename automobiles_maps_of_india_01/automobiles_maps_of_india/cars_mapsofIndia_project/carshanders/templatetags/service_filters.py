from django import template

register = template.Library()

@register.filter
def filter_by_brand(centers, brand_name):
    return [center for center in centers if center.brand == brand_name]