from django.db import models

# Create your models here.
from django.utils.text import slugify


class FinanceInsuranceArticle(models.Model):
    title = models.CharField(max_length=200)
    slug = models.SlugField(unique=True, blank=True)
    content = models.TextField()
    last_updated = models.DateField(auto_now=True)

    # def save(self, *args, **kwargs):
    #     if not self.slug:
    #         self.slug = slugify(self.title)
    #     super().save(*args, **kwargs)
    def save(self, *args, **kwargs):
        if not self.slug:
            self.slug = slugify(self.title)
        try:
            super().save(*args, **kwargs)
        except Exception as e:
            print(f"Error saving object: {e}")
            raise e


    def __str__(self):
        return self.title

class InsuranceCompany(models.Model):
    name = models.CharField(max_length=200)
    description = models.TextField()

    def __str__(self):
        return self.name

class FinanceCompany(models.Model):
    name = models.CharField(max_length=200)
    description = models.TextField()

    def __str__(self):
        return self.name