from django.db import models
from admin.basemodel.models import BaseModel

class LabTest(BaseModel):
    name = models.CharField(max_length=255)
    description = models.CharField(max_length=1000, null=True)

    def __str__(self):
        return self.name

    class Meta:
        db_table = 'lab_test'
