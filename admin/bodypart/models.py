from django.db import models
from admin.basemodel.models import BaseModel


class BodyPart(BaseModel):
    name = models.CharField(max_length=255)
    description = models.CharField(max_length=1000)

    def __str__(self):
        return self.name

    class Meta:
        db_table = 'body_part'
