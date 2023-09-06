from django.db import models
from admin.organ.models import *


class OrgansProblemSpecification(models.Model):
    problem = models.CharField(max_length=255)
    problem_specification = models.CharField(max_length=1000)
    organ = models.ForeignKey(Organ, on_delete=models.CASCADE, null=True)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now_add=False, null=True)
    deleted_at = models.DateTimeField(auto_now_add=False, null=True)

    def __str__(self):
        return self.problem

    class Meta:
        db_table = "organ_problem_speci"