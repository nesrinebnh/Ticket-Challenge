from django.db import models

# Create your models here.
class Ticket(models.Model):
    title = models.TextField(max_length=255)
    description = models.TextField(max_length=255)
    open_date = models.DateTimeField(auto_now_add=True)
    close_date = models.DateTimeField(null=True, blank=True)
    status = models.TextField(max_length=12)
