from django.db import models
from admin.personal_data.models import *
from admin.basemodel.models import BaseModel
from admin.patient.models import PatientProfile
from admin.doctor.models import DoctorProfile


class GetAppointment(BaseModel):
    patient = models.ForeignKey(PatientProfile, on_delete=models.CASCADE, related_name='patients_appointments')
    doctor = models.ForeignKey(DoctorProfile, on_delete=models.CASCADE, related_name='patients_appointments')
    appointment_date = models.TextField(max_length=255, null=True)
    appointment_time = models.TextField(max_length=255, null=True)
    is_confirmed = models.BooleanField(default=False, null=True)

    class Meta:
        db_table = 'patient_appointment'
