from rest_framework import serializers

from landing.models.varify_otp_models import VarifyOtp


class VarifyOtpSerializer(serializers.ModelSerializer):
    class Meta:
        model = VarifyOtp
        fields = ('otp', 'signup_id')
