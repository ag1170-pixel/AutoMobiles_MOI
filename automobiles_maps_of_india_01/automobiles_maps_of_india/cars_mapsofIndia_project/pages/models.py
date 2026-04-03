from django.db import models
from django.utils import timezone


# Create your models here.

class Team(models.Model):
    first_name = models.CharField(max_length=255)
    last_name = models.CharField(max_length=255)
    designation = models.CharField(max_length=255)
    photo = models.ImageField(upload_to='photos/%Y/%m/%d/')
    facebook_link = models.URLField(max_length=100)
    twitter_link = models.URLField(max_length=100)
    google_plus_link = models.URLField(max_length=100)
    created_date = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return self.first_name


class AutoNews(models.Model):
    CATEGORY_CHOICES = [
        ('care_tips', 'Car Care Tips'),
        ('industry_news', 'India Automobile Industry'),
    ]

    title = models.CharField(max_length=200)
    content = models.TextField()
    category = models.CharField(max_length=20, choices=CATEGORY_CHOICES)
    pub_date = models.DateTimeField(default=timezone.now)
    image = models.ImageField(upload_to='auto_news/', blank=True, null=True)

    def __str__(self):
        return self.title

    class Meta:
        ordering = ['-pub_date']


