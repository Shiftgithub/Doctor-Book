import hashlib
from datetime import datetime
from django.db import transaction
from admin.patient.serializers import *
from rest_framework.response import Response
from rest_framework.decorators import api_view
from django.shortcuts import get_object_or_404
from admin.authentication.user.models import Images
from admin.authentication.otp.verifyotp.models import *
from admin.authentication.otp.function.send_email import *
from admin.authentication.user.serializers import *
from .serializers import *
from ..authentication.otp.verifyotp.models import VerifyOtp
from ..authentication.user.serializers import UserSerializer, ImageSerializer


@api_view(['POST'])
def store_patient_data(request):
    patient_serializer = PatientSerializer(data=request.data)
    user_serializer = UserSerializer(data=request.data)
    if user_serializer.is_valid(raise_exception=True) and patient_serializer.is_valid():
        password = request.data.get('password')
        hashed_password = hashlib.sha256(password.encode()).hexdigest()

        with transaction.atomic():
            user_serializer.save(hash=hashed_password, role='patient', status='inactive')

            user_profile_instance = user_serializer.instance
            registration_no = generate_unique(18)
            patient_serializer.save(user_id=user_profile_instance, registration_no=registration_no)

            image_serializer = Images(user_id=user_profile_instance)
            image_serializer.save()

            token_str = generate_token(6)
            email_fields = [user_serializer.validated_data['email']]
            email = ' - '.join(email_fields)
            message = f'Message From Doctor-Book [Personalized Doctor Predictor]:\n\nYour OTP number is: {token_str}'
            otp_serializer = VerifyOtp(otp=token_str, user_id=user_profile_instance)
            otp_serializer.save()
            # send_mail = send_email(email, message)
            if otp_serializer:
                data = {'email': email, 'status': 200}
                return Response(data)
            else:
                transaction.set_rollback(True)
                return Response({'status': 403})
    else:
        return Response({'status': 400})


@api_view(['GET'])
def get_patients_list(request):
    try:
        patients = Patient_Profile.objects.filter(deleted_at=None).select_related(
            'gender', 'religion', 'blood_group', 'matrimony', 'user'
        )
        serializer = PatientViewSerializer(patients, many=True)
        return Response(serializer.data)
    except Patient_Profile.DoesNotExist:
        return Response({'error': 'Patient profile not found', 'status': '404'})


@api_view(['GET'])
def patient_data(request, patient_id):
    try:
        patient = Patient_Profile.objects.filter(id=patient_id, deleted_at=None).select_related(
            'gender', 'religion', 'blood_group', 'matrimony', 'user'
        ).first()
        if patient is None:
            return Response({'error': 'Patient profile not found', 'status': '404'})
        serializer = PatientViewSerializer(patient).data
        return Response(serializer)
    except Patient_Profile.DoesNotExist:
        return Response({'error': 'Patient profile not found', 'status': '404'})


@api_view(['PUT', 'POST'])
def edit_patient_data(request, patient_id):
    try:
        patient = Patient_Profile.objects.get(id=patient_id, deleted_at=None)
    except Patient_Profile.DoesNotExist:
        return Response({'status': '404'})

    patient_serializer = PatientSerializer(patient, data=request.data)
    image_serializer = ImageSerializer(patient.user.images.first(), data=request.data)
    if patient_serializer.is_valid() and image_serializer.is_valid():
        if 'photo_name' in request.data and request.data['photo_name']:
            # New image is selected
            image_serializer.validated_data['photo_name'] = request.data['photo_name']
        else:
            # No new image selected, retain the existing image
            image_serializer.validated_data['photo_name'] = patient.user.images.first().photo_name
        if patient_serializer.save(updated_at=datetime.now()) and image_serializer.save(
                updated_at=datetime.now()):
            return Response({'status': 200})
        else:
            return Response({'status': 403})
    else:
        return Response({'status': 403})
