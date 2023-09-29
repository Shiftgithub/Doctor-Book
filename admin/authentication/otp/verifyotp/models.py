from django.db import models
from admin.basemodel.models import BaseModel
from admin.authentication.user.models import User


class VarifyOtp(BaseModel):
    otp = models.CharField(max_length=6)
    is_verified = models.BooleanField(default=False)
    user = models.ForeignKey(User, on_delete=models.CASCADE, related_name='varify_otp', null=True)

    class Meta:
        db_table = 'otp'
