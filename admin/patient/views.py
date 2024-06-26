import hashlib
from django.db import transaction
from rest_framework.response import Response
from rest_framework.decorators import api_view
from admin.authentication.otp.function.send_email import *
from admin.authentication.user.serializers import *
from .serializers import *
from ..authentication.otp.verifyotp.models import VerifyOtp
from ..authentication.user.serializers import UserSerializer, ImageSerializer
from ..authentication.login.views import set_user_info


@api_view(['POST'])
@transaction.atomic
def store_patient_data(request):
    patient_serializer = PatientSerializer(data=request.data)
    user_serializer = UserSerializer(data=request.data)
    if user_serializer.is_valid(raise_exception=True) and patient_serializer.is_valid():
        full_name = request.data.get('full_name')
        user_name = request.data.get('user_name')
        email = request.data.get('email')

        if User.objects.filter(user_name=user_name).exists():
            return Response({'message': 'This User name already taken. Please try another.', 'status': 404})

        if User.objects.filter(email=email, ).exists():
            return Response({'message': 'This email already used. Please try another.', 'status': 404})

        hashed_password = hashlib.sha256(request.data.get('password').encode()).hexdigest()

        user_serializer.save(hash=hashed_password, role='patient', status='inactive')

        user_profile_instance = user_serializer.instance
        registration_no = generate_unique(18)
        patient_serializer.save(user_id=user_profile_instance, registration_no=registration_no)

        image_serializer = Images(user_id=user_profile_instance)
        image_serializer.save()

        token_str = generate_token(6)

        message = f'Your OTP number is: {token_str}'
        otp_serializer = VerifyOtp(otp=token_str, user_id=user_profile_instance)
        otp_serializer.save()
        sent_email = send_email(email,full_name, message)
        if otp_serializer and sent_email:
            data = {'email': email, 'status': 200, 'message': 'Patient data stored successfully'}
            return Response(data)
        else:
            transaction.set_rollback(True)
            return Response({'status': 403, 'message': 'Error in  storing patient data'})
    else:
        return Response({'status': 400, 'message': 'Invalid request!'})


@api_view(['GET'])
def get_patients_list(request):
    try:
        patients = PatientProfile.objects.filter(deleted_at=None).select_related(
            'gender', 'religion', 'blood_group', 'matrimony', 'user'
        ).order_by('-id')
        serializer = PatientViewSerializer(patients, many=True)
        return Response(serializer.data)
    except PatientProfile.DoesNotExist:
        return Response({'error': 'Patient profile not found', 'status': '404'})


@api_view(['GET'])
def patient_data(request, patient_id):
    try:
        patient = PatientProfile.objects.filter(id=patient_id, deleted_at=None).select_related(
            'gender', 'religion', 'blood_group', 'matrimony', 'user'
        ).first()
        if patient is None:
            return Response({'error': 'Patient profile not found', 'status': '404'})
        else:
            serializer = PatientViewSerializer(patient).data
            return Response(serializer)
    except PatientProfile.DoesNotExist:
        return Response({'error': 'Patient profile not found', 'status': '404'})


@api_view(['PUT', 'POST'])
def edit_patient_data(request, patient_id):
    patient_session_id = request.session.get('patient_id')
    try:
        patient = PatientProfile.objects.get(id=patient_id, deleted_at=None)
    except PatientProfile.DoesNotExist:
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
            if patient_session_id == patient_id:
                set_user_info(request, patient, patient.user.id, patient.user.email)
            return Response({'status': 200, 'message': 'Patient data updated successfully'})
        else:
            return Response({'status': 403, 'message': 'Error in updating patient data'})
    else:
        return Response({'status': 400, 'message': 'Invalid request!'})
