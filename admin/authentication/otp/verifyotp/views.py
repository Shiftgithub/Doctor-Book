from datetime import datetime

from admin.doctor.models import DoctorProfile
from admin.patient.models import PatientProfile
from .models import VerifyOtp
from django.db import transaction
from admin.constants.constants import *
from ..function.send_email import send_email
from rest_framework.response import Response
from .serializers import VerifyOtpSerializer
from rest_framework.decorators import api_view
from django.shortcuts import get_object_or_404
from admin.authentication.user.models import User, AdminProfile


@api_view(['POST'])
@transaction.atomic
def verify_otp(request):
    email = request.session.get('temp_verify_email')
    user = get_object_or_404(User, email=email)
    user_type = user.role
    if user_type == ROLE_ADMIN:
        try:
            user_info = AdminProfile.objects.get(user_id=user.id, deleted_at=None)
        except AdminProfile.DoesNotExist:
            return Response({'status': 404, 'message': 'Admin not found'})
    elif user_type == ROLE_DOCTOR:
        try:
            user_info = DoctorProfile.objects.get(user_id=user.id, deleted_at=None)
        except DoctorProfile.DoesNotExist:
            return Response({'status': 404, 'message': 'Doctor not found'})
    elif user_type == ROLE_PATIENT:
        try:
            user_info = PatientProfile.objects.get(user_id=user.id, deleted_at=None)
        except PatientProfile.DoesNotExist:
            return Response({'status': 404, 'message': 'Patient not found'})
    else:
        pass
    otp_serializer = VerifyOtpSerializer(data=request.data)
    if otp_serializer.is_valid():
        otp = otp_serializer.validated_data['otp']
        try:
            otp_check = VerifyOtp.objects.get(otp=otp, user=user)
        except VerifyOtp.DoesNotExist:
            return Response({'status': 401, 'message': 'OTP are not match!', 'email': email})

        if otp_check:
            now = datetime.now()
            otp_check.otp = 0
            otp_check.is_verified = True
            otp_check.updated_at = now

            update_otp = otp_check.save(update_fields=['otp', 'is_verified', 'updated_at'])

            # Update the user's status to active
            user.status = STATUS_ACTIVE
            update_user = user.save(update_fields=['status'])

            message = 'Your Doctor Book Account has been activated'
            sent_email = send_email(email,user_info.full_name,message)
            if sent_email:
                response = {
                    'id': user.id, 'email': user.email, 'status': 200,
                    'message': 'Account Activated Successfully'
                }
                return Response(response)
            else:
                transaction.set_rollback(True)
                response = {'status': 401, 'message': 'Check your internet connection.', 'email': email}
                return Response(response)
        else:
            transaction.set_rollback(True)
            response = {'status': 401, 'message': 'OTP are not match!', 'email': email}
            return Response(response)
    else:
        response = {'status': 400, 'email': email, 'message ': 'HTTP_400_BAD_REQUEST.', 'errors': otp_serializer.errors}
        return Response(response)
