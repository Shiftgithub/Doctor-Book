import hashlib
from datetime import datetime
from django.db import transaction
from django.core.mail import send_mail
from rest_framework import status
from rest_framework.response import Response
from rest_framework.decorators import api_view
from adminpanel.serializers.user_serializers import *
from landing.models.varify_otp_models import VarifyOtp
from landing.serializers.patient_serializers import *
from landing.views.apis.otp_views import generate_token


@api_view(['POST'])
def store_patient_data(request):
    if request.method == 'POST':
        user_serializer = UserSerializer(data=request.data)
        patient_serializer = PatientSerializer(data=request.data)
        if user_serializer.is_valid(raise_exception=True) and patient_serializer.is_valid():
            password = request.data.get('password')
            hashed_password = hashlib.sha256(password.encode()).hexdigest()

            with transaction.atomic():
                user_instance = user_serializer.save(hash=hashed_password, role="patient", status="inactive")
                patient_data = patient_serializer.validated_data
                token_str = generate_token(6)
                email_fields = [user_serializer.validated_data['email']]
                email = ' - '.join(email_fields)
                message = 'Message From Doctor-Book [Personalized Doctor Predictor]:\n\n' \
                          'Your OTP number is : ' + token_str
                send_mail(
                    'Doctor-Book From', message, 'settings.EMAIL_HOST_USER',
                    [email], fail_silently=False)
                try:
                    user_profile_instance = User.objects.get(pk=user_instance)
                    patient_data['user'] = user_profile_instance
                except User.DoesNotExist:
                    return Response(status=status.HTTP_400_BAD_REQUEST)
                patient_instance = patient_serializer.save(**patient_data)
                otp_serializer = VarifyOtp(otp=token_str, signup_id=patient_instance.id)
                otp_serializer.save()
                if patient_instance:
                    return Response(status=status.HTTP_200_OK)
                else:
                    return Response(status=status.HTTP_403_FORBIDDEN)
        else:
            return Response(status=status.HTTP_400_BAD_REQUEST)
    else:
        return Response(status=status.HTTP_405_METHOD_NOT_ALLOWED)


@api_view(['PUT', 'POST'])
def edit_patient_data(request, bodypart_id):
    patient = Patient_Profile.objects.get(id=bodypart_id)
    serializer = PatientSerializer(patient, data=request.data)
    if serializer.is_valid():
        if serializer.save(updated_at=datetime.now()):
            return Response({'status': 200})
        else:
            return Response({'status': 403})
    else:
        return Response({'status': 403})
