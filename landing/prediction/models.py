from django.db import models
from admin.organ.models import Organ
from admin.bodypart.models import BodyPart
from admin.basemodel.models import BaseModel
from admin.department.models import Department
from admin.patient.models import PatientProfile
from admin.department_speci.models import DepartmentSpecification
from admin.organ_problem_speci.models import OrgansProblemSpecification


class Prediction(BaseModel):
    body_part = models.ForeignKey(BodyPart, on_delete=models.CASCADE, related_name='prediction', null=True)
    organ = models.ForeignKey(Organ, on_delete=models.CASCADE, related_name='prediction', null=True)
    department = models.ForeignKey(Department, on_delete=models.CASCADE, related_name='prediction', null=True)
    department_speci = models.ForeignKey(DepartmentSpecification, on_delete=models.CASCADE, related_name='prediction',
                                         null=True)
    created_by = models.ForeignKey(PatientProfile, on_delete=models.CASCADE, related_name='prediction', null=True)

    class Meta:
        db_table = "prediction"


class Specification(models.Model):
    prediction = models.ForeignKey(Prediction, on_delete=models.CASCADE, related_name='specification', null=True)

    problem_specification = models.ForeignKey(OrgansProblemSpecification, on_delete=models.CASCADE,
                                              related_name='specification', null=True)
    accuracy = models.DecimalField(max_digits=10, decimal_places=3, null=True)

    class Meta:
        db_table = "specification"
