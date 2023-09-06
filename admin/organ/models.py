from django.db import models
from admin.bodypart.models import *


class Organ(models.Model):
    name = models.CharField(max_length=255)
    description = models.CharField(max_length=1000)
    body_part = models.ForeignKey(BodyPart, on_delete=models.CASCADE, null=True)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now_add=False, null=True)
    deleted_at = models.DateTimeField(auto_now_add=False, null=True)

    def __str__(self):
        return self.name

    class Meta:
        db_table = "organ"