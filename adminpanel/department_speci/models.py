from django.db import models
from adminpanel.department.models import *
from adminpanel.organ_problem_speci.models import *


class DepartmentSpecification(models.Model):
    description = models.CharField(max_length=1000)
    department = models.ForeignKey(
        Department, on_delete=models.SET_NULL, related_name="departmentID", blank=True, null=True)
    organ_problem_specification = models.ForeignKey(OrgansProblemSpecification, on_delete=models.SET_NULL, related_name="organ_problem_specificationID",
                                blank=True, null=True)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now_add=False, null=True)
    deleted_at = models.DateTimeField(auto_now_add=False, null=True)

    def __str__(self):
        return self.description
