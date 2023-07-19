from adminpanel.views.apis.auth.send_email import *
from adminpanel.views.apis.auth.verify_otp_views import *
from adminpanel.models.varify_otp_models import VarifyOtp
from adminpanel.serializers.auth.varify_otp_serializers import VarifyOtpSerializer
from adminpanel.serializers.auth.forget_password_seriailzers import ForgetPasswordSerializer
from backend.constants import *


@api_view(['POST'])
def forget_password(request):
    forget_password_serializer = ForgetPasswordSerializer(data=request.data)
    if forget_password_serializer.is_valid():
        email = forget_password_serializer.validated_data['email']
        token_str = generate_token(6)
        try:
            user = User.objects.get(email=email)
        except User.DoesNotExist:
            return Response({'status': 404})

        varify_otp = VarifyOtp.objects.filter(user=user).first()
        varify_otp_serializer = VarifyOtpSerializer(varify_otp, data={'otp': token_str}, partial=True)

        if user.status == STATUS_ACTIVE or user.status == STATUS_INACTIVE:
            if varify_otp_serializer.is_valid():
                varify_otp_serializer.save()
                message = f'Message From Doctor-Book [Personalized Doctor Predictor]:\n\nYour OTP Number is: {token_str}'
                # send_email(email, message)
                return Response({'status': 200, 'email': email})
            else:
                return Response({'status': 400})
        else:
            return Response({'status': 403})
    else:
        return Response({'status': 400})
