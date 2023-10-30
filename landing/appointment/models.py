from django.db import models
from admin.personal_data.models import *
from admin.basemodel.models import BaseModel
from admin.patient.models import Patient_Profile
from admin.authentication.user.models import User


class GetAppointment(BaseModel):
    patient = models.ForeignKey(Patient_Profile, on_delete=models.CASCADE, related_name='patients_appointments',
                                null=True)
    doctor = models.ForeignKey(User, on_delete=models.CASCADE, related_name='patients_appointments', null=True)
    appointment_date = models.DateField(auto_now_add=False)
    appointment_time = models.TimeField(auto_now_add=False)
    is_confirmed = models.BooleanField(default=False, null=True)

    def __str__(self):
        return f'Appointment with {self.doctor} on {self.appointment_datetime}'

    class Meta:
        db_table = 'patient_appointment'
