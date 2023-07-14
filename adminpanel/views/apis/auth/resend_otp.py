from rest_framework.response import Response
from adminpanel.models.varify_otp_models import VarifyOtp
from adminpanel.models.user_models import User
from adminpanel.views.apis.auth.send_email import generate_token


def resend_otp(request, email):
    user_instance = User.objects.filter(email=email).first()
    if user_instance:
        varify_otp_instance = VarifyOtp.objects.filter(user_id=user_instance.id).first()
        if varify_otp_instance:
            # Update the OTP
            varify_otp_instance.otp = generate_token(6)
            varify_otp_instance.save()
            message = f'Message From Doctor-Book [Personalized Doctor Predictor]:\n\nYour OTP number is: {varify_otp_instance.otp}'
            print(message)
            # send_email(email, message)  # Uncomment this line to send the email
            return Response({'status': 200})
        else:
            return Response({'status': 400, 'message': 'User not verified'})
    else:
        return Response({'status': 403, 'message': 'User not found'})
