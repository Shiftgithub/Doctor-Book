from .models import VerifyOtp
from rest_framework import serializers


class VerifyOtpSerializer(serializers.ModelSerializer):
    class Meta:
        model = VerifyOtp
        fields = ['otp']


class VerifyOtpDataSerializer(serializers.ModelSerializer):
    class Meta:
        model = VerifyOtp
        fields = ['otp', 'user_id']


class VerifyOtpAllSerializer(serializers.ModelSerializer):
    class Meta:
        model = VerifyOtp
        fields = ['otp', 'is_verified']
