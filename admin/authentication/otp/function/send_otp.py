from rest_framework.decorators import api_view
from admin.authentication.otp.verifyotp.serializers import VarifyOtpAllSerializer



def send_otp(user_instance, otp, is_verified):
    varify_otp_data = {'otp': otp, 'is_verified': is_verified}
    varify_otp_serializer = VarifyOtpAllSerializer(data=varify_otp_data)
    if varify_otp_serializer.is_valid():
        varify_otp_serializer.save(user_id=user_instance.id)
        return True
    else:
        return False
