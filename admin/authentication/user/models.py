import os
import uuid
from django.db import models
from datetime import datetime
from admin.personal_data.models import *
from admin.basemodel.models import BaseModel


class User(BaseModel):
    user_name = models.CharField(max_length=255)
    email = models.EmailField(max_length=255)
    password = models.CharField(max_length=255)
    hash = models.CharField(max_length=64, null=True)  # Assuming SHA-256 hash is 64 characters long
    role = models.CharField(max_length=20, null=True)  # Choices: admin, doctor, patient
    status = models.CharField(max_length=20, null=True)  # Choices: active, inactive, pending

    def __str__(self):
        return self.user_name

    class Meta:
        db_table = 'user'


class PermanentAddress(BaseModel):
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


class PresentAddress(BaseModel):
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


def image_filepath(instance, filename):
    # Get the current timestamp
    time_now = datetime.now().strftime('%Y%m%d%H%M%S')

    # Get the file extension
    file_extension = os.path.splitext(filename)[1]

    # Generate a random UUID to make the filename unique
    unique_id = str(uuid.uuid4().hex)

    # Combine the timestamp, UUID, and file extension to create a unique filename
    new_filename = f'{time_now}_{unique_id}{file_extension}'

    # Return the relative path to the folder where you want to save the image
    return os.path.join('uploads', 'images', new_filename)


class Images(BaseModel):
    photo_name = models.ImageField(upload_to=image_filepath, null=True)
    user = models.ForeignKey(User, on_delete=models.CASCADE, related_name='images', null=True)

    class Meta:
        db_table = 'images'


class AdminProfile(BaseModel):
    full_name = models.CharField(max_length=255, null=True)
    father_name = models.CharField(max_length=255, null=True)
    mother_name = models.CharField(max_length=255, null=True)
    phone_no = models.CharField(max_length=110, null=True)

    date_of_birth = models.DateField(auto_now_add=False, null=True)
    nid_no = models.IntegerField(null=True)
    address = models.CharField(max_length=255, null=True)
    gender = models.ForeignKey(Gender, on_delete=models.CASCADE, related_name='admin', null=True)
    religion = models.ForeignKey(Religion, on_delete=models.CASCADE, related_name='admin', null=True)
    matrimony = models.ForeignKey(Matrimony, on_delete=models.CASCADE, related_name='admin', null=True)
    blood_group = models.ForeignKey(Blood_Group, on_delete=models.CASCADE, related_name='admin', null=True)
    user = models.ForeignKey(User, on_delete=models.SET_NULL, related_name='admin', null=True)

    def __str__(self):
        return self.full_name

    class Meta:
        db_table = 'admin_profile'
