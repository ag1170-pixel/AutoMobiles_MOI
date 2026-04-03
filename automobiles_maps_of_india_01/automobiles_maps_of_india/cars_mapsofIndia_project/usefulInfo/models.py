from django.db import models

from django.db import models
from django.utils.text import slugify

#Useful Information   data base

class Useful(models.Model):
    title = models.CharField(max_length=200)
    slug = models.SlugField(unique=True)
    content = models.TextField()
    last_updated = models.DateField(auto_now=True)

    def __str__(self):
        return self.title

class Manufacturer(models.Model):
    name = models.CharField(max_length=200)
    address = models.TextField()
    phone = models.CharField(max_length=50)

    def __str__(self):
        return self.name

#Automobile Tip
class AutomobileTip(models.Model):
    title = models.CharField(max_length=200)
    content = models.TextField()
    order = models.IntegerField(default=0)

    def __str__(self):
        return self.title

#development Transmission

class TransmissionSystem(models.Model):
    name = models.CharField(max_length=200)
    description = models.TextField()
    advantages = models.TextField()
    disadvantages = models.TextField()

    def __str__(self):
        return self.name

class TransmissionTip(models.Model):
    tip = models.TextField()

    def __str__(self):
        return self.tip[:50]


#know cars

class Article(models.Model):
    title = models.CharField(max_length=200)
    content = models.TextField()
    slug = models.SlugField(unique=True)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    def __str__(self):
        return self.title

#suspension system

class SuspensionSystem(models.Model):
    title = models.CharField(max_length=200)
    content = models.TextField()
    last_updated = models.DateField()

    def __str__(self):
        return self.title


#model policy
class MotorPolicy(models.Model):
    title = models.CharField(max_length=255)
    content = models.TextField()
    last_updated = models.DateTimeField(auto_now=True)

    def __str__(self):
        return self.title



# Electrical System
class AutomobileInfo(models.Model):
    title = models.CharField(max_length=200)
    content = models.TextField()
    last_updated = models.DateField(auto_now=True)
    slug = models.SlugField(unique=True, blank=True)

    def save(self, *args, **kwargs):
        if not self.slug:
            self.slug = slugify(self.title)
        super().save(*args, **kwargs)

    def __str__(self):
        return self.title

class AutomobileInfoSection(models.Model):
    automobile_info = models.ForeignKey(AutomobileInfo, related_name='sections', on_delete=models.CASCADE)
    title = models.CharField(max_length=200)
    content = models.TextField()

    def __str__(self):
        return f"{self.automobile_info.title} - {self.title}"



#vehicle Maintenace
class InfoArticle(models.Model):
    title = models.CharField(max_length=200)
    slug = models.SlugField(unique=True)
    content = models.TextField()
    last_updated = models.DateField(auto_now=True)

    def __str__(self):
        return self.title



class RelatedLink(models.Model):
    automobile_info = models.ForeignKey(AutomobileInfo, related_name='related_links', on_delete=models.CASCADE)
    title = models.CharField(max_length=200)
    url = models.URLField()

    def __str__(self):
        return self.title