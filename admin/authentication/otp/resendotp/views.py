from rest_framework.response import Response
from admin.authentication.user.models import User, AdminProfile
from admin.authentication.otp.function.send_email import *
from admin.authentication.otp.verifyotp.models import VerifyOtp
from admin.constants.constants import *
from admin.doctor.models import DoctorProfile
from admin.patient.models import PatientProfile


def resend_otp(request):
    email = request.session['temp_verify_email']
    user_instance = User.objects.filter(email=email).first()
    user_type = user_instance.role
    if user_type == ROLE_ADMIN:
        try:
            user_info = AdminProfile.objects.get(user_id=user_instance.id, deleted_at=None)
        except AdminProfile.DoesNotExist:
            return Response({'status': 404, 'message': 'Admin not found'})
    elif user_type == ROLE_DOCTOR:
        try:
            user_info = DoctorProfile.objects.get(user_id=user_instance.id, deleted_at=None)
        except DoctorProfile.DoesNotExist:
            return Response({'status': 404, 'message': 'Doctor not found'})
    elif user_type == ROLE_PATIENT:
        try:
            user_info = PatientProfile.objects.get(user_id=user_instance.id, deleted_at=None)
        except PatientProfile.DoesNotExist:
            return Response({'status': 404, 'message': 'Patient not found'})
    else:
        pass
    if user_instance:
        verify_otp_instance = VerifyOtp.objects.filter(user_id=user_instance.id).first()
        if verify_otp_instance:
            verify_otp_instance.otp = generate_token(6)
            verify_otp_instance.save()
            message = f'Your OTP number is: {verify_otp_instance.otp}'
            sent_email = send_email(email, user_info.full_name, message)
            if sent_email:
                return Response({'status': 200, 'email': email, 'message': 'We send a mail please check your email.'})
            else:
                return Response({'status': 400, 'email': email, 'message': 'Error in sending mail try again.'})
        else:
            return Response({'status': 403, 'message': 'User not verified'})
    else:
        return Response({'status': 401, 'message': 'User not found'})
