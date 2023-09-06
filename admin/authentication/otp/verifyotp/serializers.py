from rest_framework import serializers
from .models import VarifyOtp


class VarifyOtpSerializer(serializers.ModelSerializer):
    class Meta:
        model = VarifyOtp
        fields = ['otp']


class VarifyOtpDataSerializer(serializers.ModelSerializer):
    class Meta:
        model = VarifyOtp
        fields = ['otp', 'user_id']


class VarifyOtpAllSerializer(serializers.ModelSerializer):
    class Meta:
        model = VarifyOtp
        fields = ['otp', 'is_verified']
