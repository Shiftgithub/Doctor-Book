from rest_framework.response import Response
from admin.authentication.user.models import User
from admin.authentication.otp.function.send_email import *
from admin.authentication.otp.verifyotp.models import VerifyOtp


def resend_otp(request):
    email = request.session['temp_verify_email']
    user_instance = User.objects.filter(email=email).first()
    if user_instance:
        verify_otp_instance = VerifyOtp.objects.filter(user_id=user_instance.id).first()
        if verify_otp_instance:
            verify_otp_instance.otp = generate_token(6)
            verify_otp_instance.save()
            message = f'Message From Doctor-Book [Personalized Doctor Predictor]:\n\nYour OTP number is: {verify_otp_instance.otp}'
            sent_email = send_email(email, message)
            if sent_email:
                return Response({'status': 200, 'email': email, 'message': 'We send a mail please check your email.'})
            else:
                return Response({'status': 400, 'email': email, 'message': 'Error in sending mail try again.'})
        else:
            return Response({'status': 403, 'message': 'User not verified'})
    else:
        return Response({'status': 401, 'message': 'User not found'})
