from django.db import models
from admin.department.models import *
from admin.basemodel.models import BaseModel
from admin.organ_problem_speci.models import *


class DepartmentSpecification(BaseModel):
    description = models.CharField(max_length=1000)
    department = models.ForeignKey(
        Department, on_delete=models.SET_NULL, related_name='departmentID', blank=True, null=True)
    organ_problem_specification = models.ForeignKey(OrgansProblemSpecification, on_delete=models.SET_NULL,
                                                    related_name='organ_problem_specificationID', null=True)

    def __str__(self):
        return self.description

    class Meta:
        db_table = 'department_speci'
