import hashlib
from django.db import transaction
from django.core.mail import send_mail
from rest_framework.response import Response
from rest_framework.decorators import api_view
from adminpanel.serializers.user_serializers import *
from landing.serializers.patient_serializers import *


@api_view(['POST'])
def store_patient_data(request):
    try:
        if request.method == 'POST':
            user_serializer = UserSerializer(data=request.data)
            patient_serializer = PatientSerializer(data=request.data)

            if user_serializer.is_valid(
                    raise_exception=True) and patient_serializer.is_valid():
                password = request.data.get('password')
                hashed_password = hashlib.sha256(password.encode()).hexdigest()

                with transaction.atomic():
                    user_instance = user_serializer.save(hash=hashed_password, role="patient", status="active")
                    patient_data = patient_serializer.validated_data
                    user_fields = [user_serializer.validated_data['user_name']]
                    user_name = ' - '.join(user_fields)
                    email_fields = [user_serializer.validated_data['email']]
                    email = ' - '.join(email_fields)
                    message = 'Message From Doctor-Book [Personalized Doctor Predictor]:\n\n' \
                              'Your username: ' + user_name + '\n' + 'Your password: ' + password
                    send_mail(
                        'Doctor-Book From', message, 'settings.EMAIL_HOST_USER',
                        [email], fail_silently=False)
                    try:
                        user_profile_instance = User_Profile.objects.get(pk=user_instance)
                        patient_data['user'] = user_profile_instance
                    except User_Profile.DoesNotExist:
                        return Response({'status': 400})
                    patient_instance = patient_serializer.save(**patient_data)
                    if patient_instance:
                        return Response({'status': 200})
                    else:
                        return Response({'status': 403})
            else:
                return Response({'status': 400})

        else:
            return Response({'status': 405})
    except User_Profile.DoesNotExist:
        return Response({'status': 400})


@api_view(['GET'])
def patient_data(request, patient_id):
    try:
        patient = Patient_Profile.objects.select_related('user').get(user__id=patient_id, deleted_at=None)
        serializer = PatientSerializer(patient)
        serialized_data = serializer.data

        # Retrieve the associated user data
        user_data = serialized_data['user']

        if isinstance(user_data, int):
            user_id = user_data
            user = User_Profile.objects.get(id=user_id)
            user_serializer = UserSerializer(user)
            user_serialized_data = user_serializer.data
        else:
            user_id = user_data['id']
            user = User_Profile.objects.get(id=user_id)
            user_serialized_data = user_data

        # Merge the patient data and user data
        merged_data = {**serialized_data, 'user': user_serialized_data}

        return Response(merged_data)
    except (Patient_Profile.DoesNotExist, User_Profile.DoesNotExist):
        return Response({'status': 404})
