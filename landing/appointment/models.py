from django.db import models
from admin.personal_data.models import *
from admin.basemodel.models import BaseModel
from admin.patient.models import PatientProfile
from admin.doctor.models import DoctorProfile
from landing.prediction.models import Prediction


class GetAppointment(BaseModel):
    patient = models.ForeignKey(PatientProfile, on_delete=models.CASCADE, related_name='patients_appointments',
                                null=True)
    doctor = models.ForeignKey(DoctorProfile, on_delete=models.CASCADE, related_name='patients_appointments', null=True)
    appointment_date = models.TextField(max_length=255, null=True)
    appointment_time = models.TextField(max_length=255, null=True)
    is_check_up = models.BooleanField(default=False, null=True)
    payment_id = models.TextField(max_length=255, null=True)
    prediction_id = models.ForeignKey(Prediction, on_delete=models.CASCADE, related_name='patients_appointments',
                                      null=True)

    class Meta:
        db_table = 'patient_appointment'
