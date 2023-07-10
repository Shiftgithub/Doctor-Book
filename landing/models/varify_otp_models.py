from django.db import models

from landing.models.patient_models import Patient_Profile


class VarifyOtp(models.Model):
    otp = models.CharField(max_length=6)
    is_verified = models.BooleanField(default=False)
    signup = models.ForeignKey(
        Patient_Profile, on_delete=models.CASCADE, related_name='varify_otp')
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=False, null=True)
    deleted_at = models.DateTimeField(auto_now=False, null=True)
