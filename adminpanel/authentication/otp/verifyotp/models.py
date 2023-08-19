from django.db import models
from adminpanel.user.models import *


class VarifyOtp(models.Model):
    otp = models.CharField(max_length=6)
    is_verified = models.BooleanField(default=False)
    user = models.ForeignKey(
        User, on_delete=models.CASCADE, related_name='varify_otp', null=True)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=False, null=True)
    deleted_at = models.DateTimeField(auto_now=False, null=True)
