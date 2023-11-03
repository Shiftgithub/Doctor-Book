from django.db import models
from admin.organ.models import *
from admin.basemodel.models import BaseModel


class OrgansProblemSpecification(BaseModel):
    problem = models.CharField(max_length=255)
    problem_specification = models.CharField(max_length=1000)
    organ = models.ForeignKey(Organ, on_delete=models.CASCADE, null=True)

    def __str__(self):
        return self.problem

    class Meta:
        db_table = 'organ_problem_speci'
