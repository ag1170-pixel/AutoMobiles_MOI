from django.contrib import admin
from .models import DynamicImage

@admin.register(DynamicImage)
class DynamicImageAdmin(admin.ModelAdmin):
    list_display = ['name', 'page_reference', 'is_active', 'created_at', 'image_preview']
    list_filter = ['page_reference', 'is_active', 'created_at']
    search_fields = ['name', 'alt_text']
    readonly_fields = ['created_at', 'updated_at', 'image_preview']
    
    fieldsets = (
        ('Basic Information', {
            'fields': ('name', 'page_reference', 'alt_text', 'is_active')
        }),
        ('Image', {
            'fields': ('image', 'image_preview')
        }),
        ('Timestamps', {
            'fields': ('created_at', 'updated_at'),
            'classes': ('collapse',)
        }),
    )
    
    def image_preview(self, obj):
        if obj.image:
            return f'<img src="{obj.image.url}" width="100" height="auto" style="object-fit: cover;">'
        return "No image"
    image_preview.short_description = 'Preview'
    image_preview.allow_tags = True
