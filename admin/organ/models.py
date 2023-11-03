from django.db import models
from admin.bodypart.models import *
from admin.basemodel.models import BaseModel


class Organ(BaseModel):
    name = models.CharField(max_length=255)
    description = models.CharField(max_length=1000)
    body_part = models.ForeignKey(BodyPart, on_delete=models.CASCADE, null=True)

    def __str__(self):
        return self.name

    class Meta:
        db_table = 'organ'
