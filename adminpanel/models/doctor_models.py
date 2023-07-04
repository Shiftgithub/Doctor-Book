import os
import datetime

from .department_models import *
from .user_models import *


class Doctor_Profile(models.Model):
    full_name = models.CharField(max_length=255)
    father_name = models.CharField(max_length=255)
    mother_name = models.CharField(max_length=255)
    gender = models.ForeignKey('Gender', on_delete=models.CASCADE, related_name="doctors")
    religion = models.ForeignKey('Religion', on_delete=models.CASCADE, related_name="doctors")
    matrimony = models.ForeignKey('Matrimony', on_delete=models.CASCADE, related_name="doctors")
    date_of_birth = models.DateField(auto_now_add=False)
    nid_no = models.CharField(max_length=255)
    blood_group = models.ForeignKey('Blood_Group', on_delete=models.CASCADE, related_name="doctors")
    phone_no = models.CharField(max_length=110)
    department = models.ForeignKey('Department', on_delete=models.CASCADE, related_name="doctors")
    experience = models.CharField(max_length=255, null=True)
    biography = models.CharField(max_length=255, null=True)
    languages_spoken = models.CharField(max_length=255)
    passport_no = models.CharField(max_length=255, null=True)
    user = models.ForeignKey('UserProfile', on_delete=models.SET_NULL, related_name="doctors", null=True)

    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now_add=False, null=True)
    deleted_at = models.DateTimeField(auto_now_add=False, null=True)


class PermanentAddress(models.Model):
    permanent_division = models.ForeignKey(
        'Division', on_delete=models.CASCADE, related_name="permanent_division")
    permanent_district = models.ForeignKey(
        'District', on_delete=models.CASCADE, related_name="permanent_district")
    permanent_upazila = models.ForeignKey(
        'Upazila', on_delete=models.CASCADE, related_name="permanent_upazila")
    permanent_village_state = models.CharField(max_length=255)
    permanent_postal_code = models.IntegerField()
    doctor_profile = models.ForeignKey(
        'Doctor_Profile', on_delete=models.CASCADE, related_name="permanent_addresses", null=True)

    def __str__(self):
        return self.permanent_address


class PresentAddress(models.Model):
    present_division = models.ForeignKey(
        'Division', on_delete=models.CASCADE, related_name="present_division")
    present_district = models.ForeignKey(
        'District', on_delete=models.CASCADE, related_name="present_district")
    present_upazila = models.ForeignKey(
        'Upazila', on_delete=models.CASCADE, related_name="present_upazila")
    present_village_state = models.CharField(max_length=255)
    present_postal_code = models.IntegerField()
    doctor_profile = models.ForeignKey(
        'Doctor_Profile', on_delete=models.CASCADE, related_name="present_addresses", null=True)

    def __str__(self):
        return self.present_address


def doctor_filepath(instance, filename):
    # Get the doctor's name
    doctor_name = instance.doctor_profile.full_name.replace(" ", "_")

    # Get the current timestamp
    time_now = datetime.datetime.now().strftime('%Y%m%d%H%M%S')

    # Get the file extension
    file_extension = os.path.splitext(filename)[1]

    # Generate a new filename using the timestamp, doctor's name, and file extension
    new_filename = "%s_%s%s" % (time_now, doctor_name, file_extension)

    # Return the relative path to the folder where you want to save the image
    return os.path.join('static', 'uploads', 'doctor_images', new_filename)


class Images(models.Model):
    doctor_photos = models.ImageField(upload_to=doctor_filepath, null=True)
    doctor_profile = models.ForeignKey('Doctor_Profile', on_delete=models.CASCADE, related_name="images", null=True)


class Availability(models.Model):
    doctor_profile = models.ForeignKey('Doctor_Profile', on_delete=models.CASCADE, related_name="availability",
                                       null=True)
    appointment_availability = models.DateTimeField(null=True)
    accepting_new_patients = models.CharField(max_length=255, null=True)
    average_wait_time = models.DurationField(null=True)
    consultation_fee = models.DecimalField(max_digits=10, decimal_places=2, null=True)
    available_facilities = models.CharField(max_length=255, null=True)


class Awards(models.Model):
    doctor_profile = models.ForeignKey('Doctor_Profile', on_delete=models.CASCADE, related_name="awards", null=True)
    awards_and_honors = models.CharField(max_length=255, null=True)
    publications = models.CharField(max_length=255, null=True)
    memberships = models.CharField(max_length=255, null=True)
    board_certification_number = models.CharField(max_length=255, null=True)  # doctor board certification number
    research_interests = models.CharField(max_length=255, null=True)


class Education(models.Model):
    doctor_profile = models.ForeignKey('Doctor_Profile', on_delete=models.CASCADE, related_name="education")
    certificate_degree = models.CharField(max_length=255)
    institution = models.CharField(max_length=255)
    board = models.ForeignKey('Board', on_delete=models.CASCADE, related_name="educationID")
    result = models.CharField(max_length=255)
    passing_year = models.DateField(auto_now_add=False)

    def get_all_education_by(self, doctor_profile_id):
        return self.objects.filter(doctor_profile_id=doctor_profile_id)


# all the information of this will be optional ...

class Services(models.Model):
    doctor_profile = models.ForeignKey('Doctor_Profile', on_delete=models.CASCADE, related_name="services", null=True)
    treatments = models.CharField(max_length=255)
    procedures = models.CharField(max_length=255)
    hours = models.CharField(max_length=255)
    location = models.CharField(max_length=255)


class Social_Media(models.Model):
    website = models.URLField(null=True)
    facebook = models.URLField(null=True)
    instagram = models.URLField(null=True)
    linkedin = models.URLField(null=True)
    doctor_profile = models.ForeignKey('Doctor_Profile', on_delete=models.CASCADE, related_name="social_media",
                                       null=True)


class Gender(models.Model):
    name = models.CharField(max_length=255)


class Religion(models.Model):
    name = models.CharField(max_length=255)


class Matrimony(models.Model):
    name = models.CharField(max_length=110)

    def __str__(self):
        return self.name


class Blood_Group(models.Model):
    name = models.CharField(max_length=255)


class Board(models.Model):
    name = models.CharField(max_length=255)

    def __str__(self):
        return self.name


class Division(models.Model):
    name = models.CharField(max_length=255)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now_add=False, null=True)
    deleted_at = models.DateTimeField(auto_now_add=False, null=True)

    def __str__(self):
        return self.name


class District(models.Model):
    name = models.CharField(max_length=255)
    division = models.ForeignKey('Division', on_delete=models.CASCADE)

    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now_add=False, null=True)
    deleted_at = models.DateTimeField(auto_now_add=False, null=True)

    def __str__(self):
        return self.name


class Upazila(models.Model):
    name = models.CharField(max_length=255)
    district = models.ForeignKey('District', on_delete=models.CASCADE)

    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now_add=False, null=True)
    deleted_at = models.DateTimeField(auto_now_add=False, null=True)

    def __str__(self):
        return self.name
