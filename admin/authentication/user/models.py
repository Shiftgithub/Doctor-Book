import os
from django.db import models
from datetime import datetime
from admin.personal_data.models import *


class User(models.Model):
    user_name = models.CharField(max_length=255)
    email = models.EmailField(max_length=255)
    password = models.CharField(max_length=255, null=True)
    hash = models.CharField(max_length=64, null=True)  # Assuming SHA-256 hash is 64 characters long
    role = models.CharField(max_length=20, null=True)  # Choices: admin, doctor, patient
    status = models.CharField(max_length=20, null=True)  # Choices: active, inactive, pending

    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now_add=False, null=True)
    deleted_at = models.DateTimeField(auto_now_add=False, null=True)

    def __str__(self):
        return self.user_name

    class Meta:
        db_table = 'user'


class PermanentAddress(models.Model):
    permanent_division = models.ForeignKey(
        Division, on_delete=models.CASCADE, related_name='permanent_division'
    )
    permanent_district = models.ForeignKey(
        District, on_delete=models.CASCADE, related_name='permanent_district'
    )
    permanent_upazila = models.ForeignKey(
        Upazila, on_delete=models.CASCADE, related_name='permanent_upazila'
    )
    permanent_village_state = models.CharField(max_length=255)
    permanent_postal_code = models.IntegerField()
    user = models.ForeignKey(User, on_delete=models.CASCADE, related_name='permanent_address', null=True)

    def __str__(self):
        return self.permanent_village_state

    class Meta:
        db_table = 'permanent_address'


class PresentAddress(models.Model):
    present_division = models.ForeignKey(Division, on_delete=models.CASCADE, related_name='present_division')
    present_district = models.ForeignKey(District, on_delete=models.CASCADE, related_name='present_district')
    present_upazila = models.ForeignKey(Upazila, on_delete=models.CASCADE, related_name='present_upazila')
    present_village_state = models.CharField(max_length=255)
    present_postal_code = models.IntegerField()
    user = models.ForeignKey(User, on_delete=models.CASCADE, related_name='present_address', null=True)

    def __str__(self):
        return self.present_village_state

    class Meta:
        db_table = 'present_address'


def doctor_filepath(instance, filename):
    # Get the current timestamp
    time_now = datetime.now().strftime('%Y%m%d%H%M%S')

    # Get the file extension
    file_extension = os.path.splitext(filename)[1]

    # Generate a new filename using the timestamp and file extension
    new_filename = '%s%s' % (time_now, file_extension)

    # Return the relative path to the folder where you want to save the image
    return os.path.join('static', 'uploads', 'images', new_filename)


class Images(models.Model):
    photo_name = models.ImageField(upload_to=doctor_filepath, null=True)
    user = models.ForeignKey(User, on_delete=models.CASCADE, related_name='images', null=True)

    class Meta:
        db_table = 'images'
