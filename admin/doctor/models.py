import os
import datetime
from django.db import models
from admin.department.models import *
from admin.personal_data.models import *
from admin.basemodel.models import BaseModel
from admin.authentication.user.models import User


class Doctor_Profile(BaseModel):
    full_name = models.CharField(max_length=255)
    father_name = models.CharField(max_length=255)
    mother_name = models.CharField(max_length=255)
    gender = models.ForeignKey(Gender, on_delete=models.CASCADE, related_name='doctors')
    religion = models.ForeignKey(Religion, on_delete=models.CASCADE, related_name='doctors')
    matrimony = models.ForeignKey(Matrimony, on_delete=models.CASCADE, related_name='doctors')
    date_of_birth = models.DateField(auto_now_add=False)
    birth_registration_no = models.CharField(max_length=255, null=True)
    blood_group = models.ForeignKey(Blood_Group, on_delete=models.CASCADE, related_name='doctors')
    phone_no = models.CharField(max_length=110, null=True)
    department = models.ForeignKey(Department, on_delete=models.CASCADE, related_name='doctors')
    nid_no = models.CharField(max_length=20, null=True)
    experience = models.CharField(max_length=1000, null=True)
    biography = models.CharField(max_length=1000, null=True)
    languages_spoken = models.CharField(max_length=255, null=True)
    passport_no = models.CharField(max_length=255, null=True)
    user = models.ForeignKey(User, on_delete=models.SET_NULL, related_name='doctors', null=True)

    class Meta:
        db_table = 'doctor_profile'


class AppointmentSchedule(BaseModel):
    doctor_profile = models.ForeignKey(Doctor_Profile, on_delete=models.CASCADE,
                                       related_name='appointment_schedules', null=True)

    per_patient_time = models.IntegerField(null=True)
    consultation_fee = models.IntegerField(null=True)

    created_by = models.ForeignKey(User, on_delete=models.CASCADE, related_name='created_appointment', null=True)
    modified_by = models.ForeignKey(User, on_delete=models.CASCADE, related_name='modified_appointment', null=True)

    class Meta:
        db_table = 'doctor_appointment_schedule'


class Awards(BaseModel):
    awards = models.CharField(max_length=255, null=True)
    honors = models.CharField(max_length=255, null=True)
    publications = models.CharField(max_length=255, null=True)
    research_interests = models.CharField(max_length=255, null=True)
    doctor_profile = models.ForeignKey(Doctor_Profile, on_delete=models.CASCADE, related_name='awards', null=True)

    created_by = models.ForeignKey(User, on_delete=models.CASCADE, related_name='created_awards', null=True)
    modified_by = models.ForeignKey(User, on_delete=models.CASCADE, related_name='modified_awards', null=True)

    class Meta:
        db_table = 'doctor_awards'


class Education(BaseModel):
    doctor_profile = models.ForeignKey(Doctor_Profile, on_delete=models.CASCADE, related_name='education')
    certificate_degree = models.CharField(max_length=255)
    institution = models.CharField(max_length=255)
    board = models.ForeignKey(Board, on_delete=models.CASCADE, related_name='educationID', null=True)
    result = models.DecimalField(max_digits=10, decimal_places=2, null=True)
    passing_year = models.DateField(auto_now_add=False)

    def get_all_education_by(self, doctor_profile_id):
        return self.objects.filter(doctor_profile_id=doctor_profile_id)

    class Meta:
        db_table = 'doctor_educations'


class OffDay(BaseModel):
    doctor_profile = models.ForeignKey(Doctor_Profile, on_delete=models.CASCADE, related_name='off_days')

    off_day = models.ForeignKey(Day, on_delete=models.CASCADE, related_name='off_day_name', null=True)

    created_by = models.ForeignKey(User, on_delete=models.CASCADE, related_name='created_off_day', null=True)
    modified_by = models.ForeignKey(User, on_delete=models.CASCADE, related_name='modified_off_day', null=True)

    class Meta:
        db_table = 'off_day'


class ScheduleTime(BaseModel):
    appointment_schedule = models.ForeignKey(AppointmentSchedule,
                                             on_delete=models.CASCADE, related_name='schedule_time', null=True)
    doctor_profile = models.ForeignKey(Doctor_Profile, on_delete=models.CASCADE, related_name='schedule_time')
    start_time = models.TimeField(null=True)
    end_time = models.TimeField(null=True)

    class Meta:
        db_table = 'doctor_schedule_times'


class SocialMedia(BaseModel):
    website = models.URLField(null=True)
    facebook = models.URLField(null=True)
    instagram = models.URLField(null=True)
    linkedin = models.URLField(null=True)
    doctor_profile = models.ForeignKey(Doctor_Profile, on_delete=models.CASCADE, related_name='social_media', null=True)

    class Meta:
        db_table = 'doctor_social_media'
