import hashlib
from datetime import datetime
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
                        user_profile_instance = User.objects.get(pk=user_instance)
                        patient_data['user'] = user_profile_instance
                    except User.DoesNotExist:
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
    except User.DoesNotExist:
        return Response({'status': 400})


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
