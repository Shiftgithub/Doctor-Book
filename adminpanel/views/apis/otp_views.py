import secrets
from datetime import datetime
from django.db import transaction
from django.core.mail import send_mail
from django.shortcuts import get_object_or_404
from rest_framework.response import Response
from rest_framework.decorators import api_view
from landing.models.patient_models import *
from landing.serializers.varify_otp_serializers import *


def generate_token(length):
    return str(secrets.randbelow(10 ** 6)).zfill(length)


@api_view(['POST'])
def varify_otp(request):
    otp_serializer = VarifyOtpSerializer(data=request.data)
    if otp_serializer.is_valid():
        otp = otp_serializer.validated_data['otp']
        otp_check = get_object_or_404(VarifyOtp, otp=otp)
        otp_check.otp = 0
        otp_check.is_verified = True
        otp_check.updated_at = datetime.now()
        with transaction.atomic():
            otp_check.save(update_fields=['otp', 'is_verified', 'updated_at'])
            patient_id = otp_check.signup_id
            patient = Patient_Profile.objects.get(id=patient_id)
            patient.user.status = "active"
            patient.user.save(update_fields=['status'])
            message = 'Message From Doctor-Book [Personalized Doctor Predictor]:\n\n' \
                      'Your UserName: ' + patient.user.user_name + '\n' 'Your Password: ' + patient.user.password
            send_mail(
                'Doctor-Book From', message, 'settings.EMAIL_HOST_USER',
                [patient.user.email], fail_silently=False)
        return Response({'status': 200})
    else:
        return Response({'status': 403})
