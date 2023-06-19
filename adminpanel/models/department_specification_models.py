from django.db import models
from .department_models import *
from .problem_specification_models import *


class DepartmentSpecification(models.Model):
    description = models.CharField(max_length=1000)
    department = models.ForeignKey(
        Department, on_delete=models.SET_NULL, related_name="departmentId", blank=True, null=True)
    problem_specification = models.ForeignKey(
        ProblemSpecification, on_delete=models.SET_NULL, related_name="problem_specification", blank=True, null=True)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now_add=False, null=True)
    deleted_at = models.DateTimeField(auto_now_add=False, null=True)

    def __str__(self):
        return self.description