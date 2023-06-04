from django.db import models
from myadmin.models import Department


class Doctor(models.Model):
    name = models.CharField(max_length=255)
    description = models.CharField(max_length=1000)
    department = models.ForeignKey(Department, on_delete=models.SET_NULL, related_name="departments", blank=True,
                                   null=True)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now_add=False, null=True)
    deleted_at = models.DateTimeField(auto_now_add=False, null=True)

    def __str__(self):
        return self.name
