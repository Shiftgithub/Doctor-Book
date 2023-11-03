from django.db import models
from admin.personal_data.models import *
from admin.basemodel.models import BaseModel
from admin.patient.models import Patient_Profile
from admin.doctor.models import Doctor_Profile


class GetAppointment(BaseModel):
    patient = models.ForeignKey(Patient_Profile, on_delete=models.CASCADE, related_name='patients_appointments',
                                null=True)
    doctor = models.ForeignKey(Doctor_Profile, on_delete=models.CASCADE, related_name='patients_appointments',
                               null=True)
    appointment_date = models.TextField(max_length=255, null=True)
    appointment_time = models.TextField(max_length=255, null=True)
    is_confirmed = models.BooleanField(default=False, null=True)

    class Meta:
        db_table = 'patient_appointment'