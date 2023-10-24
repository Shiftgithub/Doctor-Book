from django.db import models
from admin.personal_data.models import *
from admin.basemodel.models import BaseModel
from admin.authentication.user.models import User


class Patient_Profile(BaseModel):
    full_name = models.CharField(max_length=255, null=True)
    father_name = models.CharField(max_length=255, null=True)
    mother_name = models.CharField(max_length=255, null=True)
    phone_no = models.CharField(max_length=110, null=True)
    unique_id = models.CharField(unique=True, max_length=255, null=True)

    date_of_birth = models.DateField(auto_now_add=False, null=True)
    nid_no = models.IntegerField(null=True)
    address = models.CharField(max_length=255, null=True)
    gender = models.ForeignKey(Gender, on_delete=models.CASCADE, related_name='patients', null=True)
    religion = models.ForeignKey(Religion, on_delete=models.CASCADE, related_name='patients', null=True)
    matrimony = models.ForeignKey(Matrimony, on_delete=models.CASCADE, related_name='patients', null=True)
    blood_group = models.ForeignKey(Blood_Group, on_delete=models.CASCADE, related_name='patients', null=True)
    user = models.ForeignKey(User, on_delete=models.SET_NULL, related_name='patients', null=True)

    def __str__(self):
        return self.full_name

    class Meta:
        db_table = 'patient'


class Appointment_fixed(BaseModel):
    patient = models.ForeignKey(Patient_Profile, on_delete=models.CASCADE, related_name='patients_appointments')
    doctor = models.ForeignKey(User, on_delete=models.CASCADE, related_name='patients_appointments')
    appointment_date = models.DateField(auto_now_add=False)
    appointment_time = models.TimeField(auto_now_add=False)
    reason_for_visit = models.TextField(null=True)
    is_confirmed = models.BooleanField(default=False)

    def __str__(self):
        return f'Appointment with {self.doctor} on {self.appointment_datetime}'

    class Meta:
        db_table = 'patient_appointment'