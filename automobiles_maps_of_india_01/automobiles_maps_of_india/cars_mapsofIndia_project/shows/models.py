from django.db import models

# Create your models here.
def reverse(param, args):
    pass


class Expo(models.Model):
    year = models.IntegerField(unique=True)
    title = models.CharField(max_length=200)
    description = models.TextField()
    start_date = models.DateField()
    end_date = models.DateField()

    def __str__(self):
        return f"Auto Expo {self.year}"

    def get_absolute_url(self):
        return reverse('expo_app:auto_expo_detail', args=[self.year])

class Event(models.Model):
    expo = models.ForeignKey(Expo, related_name='events', on_delete=models.CASCADE)
    name = models.CharField(max_length=200)
    description = models.TextField()
    date = models.DateTimeField()
    location = models.CharField(max_length=200)

    def __str__(self):
        return self.name

    def get_absolute_url(self):
        return reverse('expo_app:event_detail', args=[self.id])

class AutoShow(models.Model):
    name = models.CharField(max_length=200)
    date = models.DateField()
    venue = models.CharField(max_length=200)
    country = models.CharField(max_length=100)
    description = models.TextField()

    def __str__(self):
        return self.name

class TVShow(models.Model):
    day = models.CharField(max_length=20)
    time = models.TimeField()
    show_name = models.CharField(max_length=200)
    channel = models.CharField(max_length=100)

    def __str__(self):
        return self.show_name

class RelatedLink(models.Model):
    title = models.CharField(max_length=200)
    url = models.URLField()

    def __str__(self):
        return self.title



