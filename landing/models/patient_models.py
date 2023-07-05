from django.db import models

from adminpanel.models.user_models import *


class Patient_Profile(models.Model):
    full_name = models.CharField(max_length=255)
    father_name = models.CharField(max_length=255)
    mother_name = models.CharField(max_length=255)

    phone = models.CharField(max_length=255)
    address = models.CharField(max_length=255)

    user = models.ForeignKey(User_Profile, on_delete=models.SET_NULL, related_name="patients", null=True)

    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now_add=False, null=True)
    deleted_at = models.DateTimeField(auto_now_add=False, null=True)

    def __str__(self):
        return self.full_name
