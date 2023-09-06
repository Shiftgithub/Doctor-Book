from rest_framework.response import Response
from admin.authentication.user.models import User
from admin.authentication.otp.verifyotp.models import VarifyOtp
from admin.authentication.otp.function.send_email import *



def resend_otp(request):
    email = request.session['temp_verify_email']
    user_instance = User.objects.filter(email=email).first()
    if user_instance:
        varify_otp_instance = VarifyOtp.objects.filter(user_id=user_instance.id).first()
        if varify_otp_instance:
            varify_otp_instance.otp = generate_token(6)
            varify_otp_instance.save()
            message = f'Message From Doctor-Book [Personalized Doctor Predictor]:\n\nYour OTP number is: {varify_otp_instance.otp}'
            # send_email(email, message)  # Uncomment this line to send the email
            return Response({'status': 200, 'email': email})
        else:
            return Response({'status': 400, 'message': 'User not verified'})
    else:
        return Response({'status': 404, 'message': 'User not found'})