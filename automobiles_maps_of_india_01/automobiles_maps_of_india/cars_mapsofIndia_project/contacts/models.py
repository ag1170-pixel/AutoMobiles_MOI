from django.db import models
from datetime import datetime

# Create your models here.
class Contact(models.Model):
    # General contact form fields
    name = models.CharField(max_length=200, blank=True, null=True)
    email = models.EmailField(max_length=100)
    subject = models.CharField(max_length=200, blank=True, null=True)
    phone = models.CharField(max_length=20, blank=True)
    message = models.TextField()
    
    # Car inquiry specific fields (for backward compatibility)
    car_id = models.IntegerField(null=True, blank=True)
    car_title = models.CharField(max_length=100, blank=True)
    first_name = models.CharField(max_length=100, blank=True)
    last_name = models.CharField(max_length=100, blank=True)
    customer_need = models.CharField(max_length=100, blank=True)
    city = models.CharField(max_length=100, blank=True)
    state = models.CharField(max_length=100, blank=True)
    
    contact_type = models.CharField(max_length=20, default='general', choices=[
        ('general', 'General Inquiry'),
        ('car_inquiry', 'Car Inquiry'),
    ])
    
    create_date = models.DateTimeField(auto_now_add=True)
    is_read = models.BooleanField(default=False)

    class Meta:
        ordering = ['-create_date']

    def __str__(self):
        return f"{self.name} - {self.subject}"

    @property
    def full_name(self):
        return self.name
