import os
import datetime
from django.db import models
from admin.department.models import *
from admin.personal_data.models import *
from admin.authentication.user.models import User


class Doctor_Profile(models.Model):
    full_name = models.CharField(max_length=255)
    father_name = models.CharField(max_length=255)
    mother_name = models.CharField(max_length=255)
    gender = models.ForeignKey(Gender, on_delete=models.CASCADE, related_name='doctors')
    religion = models.ForeignKey(
        Religion, on_delete=models.CASCADE, related_name='doctors'
    )
    matrimony = models.ForeignKey(
        Matrimony, on_delete=models.CASCADE, related_name='doctors'
    )
    date_of_birth = models.DateField(auto_now_add=False)
    birth_registration_no = models.IntegerField(null=True)
    blood_group = models.ForeignKey(
        Blood_Group, on_delete=models.CASCADE, related_name='doctors'
    )
    phone_no = models.CharField(max_length=110, null=True)
    department = models.ForeignKey(
        Department, on_delete=models.CASCADE, related_name='doctors'
    )
    nid_no = models.IntegerField(null=True)
    experience = models.CharField(max_length=1000, null=True)
    biography = models.CharField(max_length=1000, null=True)
    languages_spoken = models.CharField(max_length=255, null=True)
    passport_no = models.CharField(max_length=255, null=True)
    user = models.ForeignKey(
        User, on_delete=models.SET_NULL, related_name='doctors', null=True
    )

    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now_add=False, null=True)
    deleted_at = models.DateTimeField(auto_now_add=False, null=True)

    class Meta:
        db_table = 'doctor_profile'


class Education(models.Model):
    doctor_profile = models.ForeignKey(Doctor_Profile, on_delete=models.CASCADE, related_name='education')
    certificate_degree = models.CharField(max_length=255)
    institution = models.CharField(max_length=255)
    board = models.ForeignKey(Board, on_delete=models.CASCADE, related_name='educationID')
    result = models.DecimalField(max_digits=10, decimal_places=2, null=True)
    passing_year = models.DateField(auto_now_add=False)

    def get_all_education_by(self, doctor_profile_id):
        return self.objects.filter(doctor_profile_id=doctor_profile_id)

    class Meta:
        db_table = 'doctor_educations'


class Social_Media(models.Model):
    website = models.URLField(null=True)
    facebook = models.URLField(null=True)
    instagram = models.URLField(null=True)
    linkedin = models.URLField(null=True)
    doctor_profile = models.ForeignKey(Doctor_Profile, on_delete=models.CASCADE, related_name='social_media', null=True)

    class Meta:
        db_table = 'doctor_social_media'


class AppointmentSchedule(models.Model):
    doctor_profile = models.ForeignKey(Doctor_Profile, on_delete=models.CASCADE, related_name='appointment',
                                       null=True)
    per_patient_time = models.IntegerField(null=True)
    consultation_fee = models.IntegerField(null=True)

    created_by = models.ForeignKey(User, on_delete=models.CASCADE, related_name='created_appointment', null=True)
    modified_by = models.ForeignKey(User, on_delete=models.CASCADE, related_name='modified_appointment', null=True)

    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now_add=False, null=True)
    deleted_at = models.DateTimeField(auto_now_add=False, null=True)

    class Meta:
        db_table = 'doctor_availability'


class ScheduleTime(models.Model):
    doctor_profile = models.ForeignKey(Doctor_Profile, on_delete=models.CASCADE, related_name='schedule_time',
                                       null=True)
    start_time = models.TimeField(null=True)
    end_time = models.TimeField(null=True)

    created_by = models.ForeignKey(User, on_delete=models.CASCADE, related_name='created_schedule_time', null=True)
    modified_by = models.ForeignKey(User, on_delete=models.CASCADE, related_name='modified_schedule_time', null=True)

    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now_add=False, null=True)
    deleted_at = models.DateTimeField(auto_now_add=False, null=True)

    class Meta:
        db_table = 'schedule_time'


class OffDay(models.Model):
    doctor_profile = models.ForeignKey(Doctor_Profile, on_delete=models.CASCADE, related_name='off_day',
                                       null=True)
    off_day = models.ForeignKey(Day, on_delete=models.CASCADE, related_name='off_day', null=True)

    created_by = models.ForeignKey(User, on_delete=models.CASCADE, related_name='created_off_day', null=True)
    modified_by = models.ForeignKey(User, on_delete=models.CASCADE, related_name='modified_off_day', null=True)

    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now_add=False, null=True)
    deleted_at = models.DateTimeField(auto_now_add=False, null=True)

    class Meta:
        db_table = 'off_day'


class Awards(models.Model):
    doctor_profile = models.ForeignKey(
        Doctor_Profile, on_delete=models.CASCADE, related_name='awards', null=True
    )
    awards_and_honors = models.CharField(max_length=255, null=True)
    publications = models.CharField(max_length=255, null=True)
    memberships = models.CharField(max_length=255, null=True)
    board_certification_number = models.CharField(
        max_length=255, null=True
    )  # doctor board certification number
    research_interests = models.CharField(max_length=255, null=True)

    created_by = models.ForeignKey(User, on_delete=models.CASCADE, related_name='created_awards', null=True)
    modified_by = models.ForeignKey(User, on_delete=models.CASCADE, related_name='modified_awards', null=True)

    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now_add=False, null=True)
    deleted_at = models.DateTimeField(auto_now_add=False, null=True)

    class Meta:
        db_table = 'doctor_awards'
