import os
import datetime
from django.db import models

from admin.authentication.user.models import User
from admin.department.models import *
from admin.personal_data.models import *


class Doctor_Profile(models.Model):
    full_name = models.CharField(max_length=255)
    father_name = models.CharField(max_length=255)
    mother_name = models.CharField(max_length=255)
    gender = models.ForeignKey(Gender, on_delete=models.CASCADE, related_name="doctors")
    religion = models.ForeignKey(
        Religion, on_delete=models.CASCADE, related_name="doctors"
    )
    matrimony = models.ForeignKey(
        Matrimony, on_delete=models.CASCADE, related_name="doctors"
    )
    date_of_birth = models.DateField(auto_now_add=False)
    nid_no = models.CharField(max_length=255, null=True)
    blood_group = models.ForeignKey(
        Blood_Group, on_delete=models.CASCADE, related_name="doctors"
    )
    phone_no = models.CharField(max_length=110, null=True)
    department = models.ForeignKey(
        Department, on_delete=models.CASCADE, related_name="doctors"
    )
    experience = models.CharField(max_length=255, null=True)
    biography = models.CharField(max_length=255, null=True)
    languages_spoken = models.CharField(max_length=255, null=True)
    passport_no = models.CharField(max_length=255, null=True)
    user = models.ForeignKey(
        User, on_delete=models.SET_NULL, related_name="doctors", null=True
    )

    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now_add=False, null=True)
    deleted_at = models.DateTimeField(auto_now_add=False, null=True)

    class Meta:
        db_table = "doctor_profile"


class Availability(models.Model):
    doctor_profile = models.ForeignKey(Doctor_Profile, on_delete=models.CASCADE, related_name="availability",
                                       null=True, )
    appointment_availability = models.CharField(max_length=255, null=True)
    accepting_new_patients = models.CharField(max_length=255, null=True)
    average_wait_time = models.CharField(max_length=255, null=True)
    consultation_fee = models.DecimalField(max_digits=10, decimal_places=2, null=True)
    available_facilities = models.CharField(max_length=255, null=True)

    class Meta:
        db_table = "doctor_availability"


class Awards(models.Model):
    doctor_profile = models.ForeignKey(
        Doctor_Profile, on_delete=models.CASCADE, related_name="awards", null=True
    )
    awards_and_honors = models.CharField(max_length=255, null=True)
    publications = models.CharField(max_length=255, null=True)
    memberships = models.CharField(max_length=255, null=True)
    board_certification_number = models.CharField(
        max_length=255, null=True
    )  # doctor board certification number
    research_interests = models.CharField(max_length=255, null=True)

    class Meta:
        db_table = "doctor_awards"


class Education(models.Model):
    doctor_profile = models.ForeignKey(Doctor_Profile, on_delete=models.CASCADE, related_name="education")
    certificate_degree = models.CharField(max_length=255)
    institution = models.CharField(max_length=255)
    board = models.ForeignKey(Board, on_delete=models.CASCADE, related_name="educationID")
    result = models.CharField(max_length=255)
    passing_year = models.DateField(auto_now_add=False)

    def get_all_education_by(self, doctor_profile_id):
        return self.objects.filter(doctor_profile_id=doctor_profile_id)

    class Meta:
        db_table = "doctor_educations"


class Services(models.Model):
    doctor_profile = models.ForeignKey(Doctor_Profile, on_delete=models.CASCADE, related_name="services", null=True)
    treatments = models.CharField(max_length=255, null=True)
    procedures = models.CharField(max_length=255, null=True)
    hours = models.CharField(max_length=255, null=True)
    location = models.CharField(max_length=255, null=True)

    class Meta:
        db_table = "doctor_services"


class Social_Media(models.Model):
    website = models.URLField(null=True)
    facebook = models.URLField(null=True)
    instagram = models.URLField(null=True)
    linkedin = models.URLField(null=True)
    doctor_profile = models.ForeignKey(Doctor_Profile, on_delete=models.CASCADE, related_name="social_media", null=True)

    class Meta:
        db_table = "doctor_social_media"
