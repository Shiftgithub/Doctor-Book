from rest_framework.decorators import api_view
from admin.authentication.otp.verifyotp.serializers import VerifyOtpAllSerializer


def send_otp(user_instance, otp, is_verified):
    verify_otp_data = {'otp': otp, 'is_verified': is_verified}
    verify_otp_serializer = VerifyOtpAllSerializer(data=verify_otp_data)
    if verify_otp_serializer.is_valid():
        verify_otp_serializer.save(user_id=user_instance.id)
        return True
    else:
        return False
