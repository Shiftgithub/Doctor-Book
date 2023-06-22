import os
import datetime

from adminpanel.models.user_models import *


class Doctor_Profile(models.Model):
    full_name = models.CharField(max_length=255)
    father_name = models.CharField(max_length=255)
    mother_name = models.CharField(max_length=255)
    gender = models.ForeignKey('Gender', on_delete=models.SET_NULL, related_name="genderID", null=True)
    religion = models.ForeignKey('Religion', on_delete=models.SET_NULL, related_name="religionID", null=True)
    matrimony = models.ForeignKey('Matrimonie', on_delete=models.CASCADE, related_name="matrimony")
    date_of_birth = models.DateField(auto_now_add=False)
    nid_no = models.CharField(max_length=255)
    blood_group = models.ForeignKey('Blood_Group', on_delete=models.SET_NULL, related_name="blood_groupID", null=True)
    phone_no = models.CharField(max_length=110)

    specialty = models.CharField(max_length=255)
    experience = models.CharField(max_length=255)
    biography = models.CharField(max_length=255)

    languages_spoken = models.CharField(max_length=255)
    passport_no = models.CharField(max_length=255)
    user = models.ForeignKey('UserProfile', on_delete=models.SET_NULL, related_name="userID", null=True)
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
    permanent_address = models.CharField(max_length=255)
    doctor_profile = models.ForeignKey(
        'Doctor_Profile', on_delete=models.CASCADE, related_name="permanent_addresses", null=True)

    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now_add=False, null=True)
    deleted_at = models.DateTimeField(auto_now_add=False, null=True)

    def __str__(self):
        return self.permanent_address


class PresentAddress(models.Model):
    present_division = models.ForeignKey(
        'Division', on_delete=models.CASCADE, related_name="present_division")
    present_district = models.ForeignKey(
        'District', on_delete=models.CASCADE, related_name="present_district")
    present_upazila = models.ForeignKey(
        'Upazila', on_delete=models.CASCADE, related_name="present_upazila")
    present_address = models.CharField(max_length=255)
    doctor_profile = models.ForeignKey(
        'Doctor_Profile', on_delete=models.CASCADE, related_name="present_addresses", null=True)

    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now_add=False, null=True)
    deleted_at = models.DateTimeField(auto_now_add=False, null=True)

    def __str__(self):
        return self.present_address


def doctor_filepath(instance, filename):
    # Get the doctor's name
    doctor_name = instance.doctor_profile.full_name.replace(" ", "_")

    # Get the original filename
    old_filename = filename

    # Get the current timestamp
    time_now = datetime.datetime.now().strftime('%Y%m%d%H%M%S')

    # Generate a new filename using the timestamp and original filename
    filename = "%s_%s" % (time_now, old_filename)

    # Return the relative path to the folder where you want to save the image
    return os.path.join('static', 'uploads', 'doctor_images', doctor_name, filename)


class Images(models.Model):
    doctor_photos = models.ImageField(upload_to=doctor_filepath)
    doctor_profile = models.ForeignKey('Doctor_Profile', on_delete=models.CASCADE, related_name="images", null=True)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now_add=False, null=True)
    deleted_at = models.DateTimeField(auto_now_add=False, null=True)


class Education(models.Model):
    doctor_profile = models.ForeignKey(
        'Doctor_Profile', on_delete=models.CASCADE, related_name="education", null=True)
    education = models.CharField(max_length=255)
    medical_school = models.CharField(max_length=255)
    residency_program = models.CharField(max_length=255)
    fellowship_program = models.CharField(max_length=255)

    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now_add=False, null=True)
    deleted_at = models.DateTimeField(auto_now_add=False, null=True)


class Certification(models.Model):
    doctor_profile = models.ForeignKey(
        'Doctor_Profile', on_delete=models.CASCADE, related_name="certification", null=True)
    board_certifications = models.CharField(max_length=255)
    awards_and_honors = models.CharField(max_length=255)
    publications = models.CharField(max_length=255)
    memberships = models.CharField(max_length=255)
    patient_satisfaction = models.IntegerField()

    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now_add=False, null=True)
    deleted_at = models.DateTimeField(auto_now_add=False, null=True)


class Services(models.Model):
    doctor_profile = models.ForeignKey(
        'Doctor_Profile', on_delete=models.CASCADE, related_name="Services", null=True)
    treatments = models.CharField(max_length=255)
    procedures = models.CharField(max_length=255)
    hours = models.CharField(max_length=255)
    location = models.CharField(max_length=255)

    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now_add=False, null=True)
    deleted_at = models.DateTimeField(auto_now_add=False, null=True)


class Social_Media(models.Model):
    website = models.URLField(null=True)
    facebook = models.URLField(null=True)
    insta = models.URLField(null=True)
    linkdin = models.URLField(null=True)
    twitter = models.URLField(null=True)
    doctor_profile = models.ForeignKey(
        'Doctor_Profile', on_delete=models.CASCADE, related_name="social_sedia", null=True)

    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now_add=False, null=True)
    deleted_at = models.DateTimeField(auto_now_add=False, null=True)


class Credentials(models.Model):
    doctor_profile = models.ForeignKey(
        'Doctor_Profile', on_delete=models.CASCADE, related_name="credentials", null=True)
    medical_license = models.CharField(max_length=255)
    dea_number = models.CharField(max_length=255)
    npi_number = models.CharField(max_length=255)
    state = models.CharField(max_length=255)
    country = models.CharField(max_length=255)
    board_certified = models.BooleanField()
    board_certified_in = models.CharField(max_length=255)


class Availability(models.Model):
    doctor_profile = models.ForeignKey(
        'Doctor_Profile', on_delete=models.CASCADE, related_name="availability", null=True)
    appointment_availability = models.DateTimeField(null=True)

    accepting_new_patients = models.BooleanField()
    cancellation_policy = models.CharField(max_length=255)
    insurance_accepted = models.CharField(max_length=255, null=True)

    # New features
    average_wait_time = models.DurationField()
    consultation_fee = models.DecimalField(max_digits=10, decimal_places=2)
    available_facilities = models.TextField()
    research_interests = models.TextField()


class Gender(models.Model):
    name = models.CharField(max_length=255)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now_add=False, null=True)
    deleted_at = models.DateTimeField(auto_now_add=False, null=True)


class Religion(models.Model):
    name = models.CharField(max_length=255)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now_add=False, null=True)
    deleted_at = models.DateTimeField(auto_now_add=False, null=True)


class Matrimonie(models.Model):
    name = models.CharField(max_length=110)

    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now_add=False, null=True)
    deleted_at = models.DateTimeField(auto_now_add=False, null=True)

    def __str__(self):
        return self.name


class Blood_Group(models.Model):
    name = models.CharField(max_length=255)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now_add=False, null=True)
    deleted_at = models.DateTimeField(auto_now_add=False, null=True)


class Countries(models.Model):
    name = models.CharField(max_length=255)
    nationality = models.CharField(max_length=255)

    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now_add=False, null=True)
    deleted_at = models.DateTimeField(auto_now_add=False, null=True)

    def __str__(self):
        return self.name


class Division(models.Model):
    name = models.CharField(max_length=255)
    country = models.ForeignKey(
        'Countries', on_delete=models.SET_NULL, null=True)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now_add=False, null=True)
    deleted_at = models.DateTimeField(auto_now_add=False, null=True)

    def __str__(self):
        return self.name


class District(models.Model):
    name = models.CharField(max_length=255)
    division = models.ForeignKey(
        'Division', on_delete=models.SET_NULL, null=True)

    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now_add=False, null=True)
    deleted_at = models.DateTimeField(auto_now_add=False, null=True)

    def __str__(self):
        return self.name


class Upazila(models.Model):
    name = models.CharField(max_length=255)
    district = models.ForeignKey(
        'District', on_delete=models.SET_NULL, null=True)

    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now_add=False, null=True)
    deleted_at = models.DateTimeField(auto_now_add=False, null=True)

    def __str__(self):
        return self.name
