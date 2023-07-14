from rest_framework import serializers
from adminpanel.models.user_models import User


class ForgetPasswordSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ['email']  # Use a list or tuple instead of a string

