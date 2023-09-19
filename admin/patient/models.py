from django.db import models
from admin.personal_data.models import *
from admin.authentication.user.models import User


class Patient_Profile(models.Model):
    full_name = models.CharField(max_length=255, null=True)

    father_name = models.CharField(max_length=255, null=True)
    mother_name = models.CharField(max_length=255, null=True)
    phone_no = models.CharField(max_length=110, null=True)

    date_of_birth = models.DateField(auto_now_add=False, null=True)
    nid_no = models.CharField(max_length=20, null=True)
    address = models.CharField(max_length=255, null=True)
    gender = models.ForeignKey(Gender, on_delete=models.CASCADE, related_name='patients', null=True)
    religion = models.ForeignKey(Religion, on_delete=models.CASCADE, related_name='patients', null=True)
    matrimony = models.ForeignKey(Matrimony, on_delete=models.CASCADE, related_name='patients', null=True)
    blood_group = models.ForeignKey(Blood_Group, on_delete=models.CASCADE, related_name='patients', null=True)
    user = models.ForeignKey(User, on_delete=models.SET_NULL, related_name='patients', null=True)

    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now_add=False, null=True)
    deleted_at = models.DateTimeField(auto_now_add=False, null=True)

    def __str__(self):
        return self.full_name

    class Meta:
        db_table = 'patient'
