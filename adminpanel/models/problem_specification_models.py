from django.db import models
from .organ_problem_models import *

class ProblemSpecification(models.Model):
    specification = models.CharField(max_length=1000)
    description = models.CharField(max_length=1000)
    organ_problem = models.ForeignKey(
        OrgansProblem, on_delete=models.SET_NULL, related_name="organ_problem", blank=True, null=True)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now_add=False, null=True)
    deleted_at = models.DateTimeField(auto_now_add=False, null=True)

    def __str__(self):
        return self.name