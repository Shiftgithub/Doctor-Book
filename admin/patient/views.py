import hashlib
from datetime import datetime
from django.db import transaction
from rest_framework import status
from admin.patient.serializers import *
from rest_framework.response import Response
from rest_framework.decorators import api_view
from admin.authentication.otp.verifyotp.models import *
from admin.authentication.otp.function.send_email import *
from admin.authentication.user.serializers import UserSerializer


@api_view(["POST"])
def store_patient_data(request):
    user_serializer = UserSerializer(data=request.data)
    patient_serializer = PatientSerializer(data=request.data)
    if user_serializer.is_valid(raise_exception=True) and patient_serializer.is_valid():
        password = request.data.get("password")
        hashed_password = hashlib.sha256(password.encode()).hexdigest()

        with transaction.atomic():
            user_instance = user_serializer.save(
                hash=hashed_password, role="patient", status="inactive"
            )

            user_profile_instance = user_serializer.instance
            patient_serializer.save(user_id=user_profile_instance)

            token_str = generate_token(6)
            email_fields = [user_serializer.validated_data["email"]]
            email = " - ".join(email_fields)
            message = f"Message From Doctor-Book [Personalized Doctor Predictor]:\n\nYour OTP number is: {token_str}"
            otp_serializer = VarifyOtp(otp=token_str, user_id=user_profile_instance)
            otp_serializer.save()
            # send_mail = send_email(email, message)
            if otp_serializer:
                return Response({"email": email, "status": 200})

            else:
                return Response(status=status.HTTP_403_FORBIDDEN)
    else:
        return Response(status=status.HTTP_400_BAD_REQUEST)


from rest_framework.response import Response
from rest_framework.decorators import api_view
from admin.doctor.models import Doctor_Profile
from admin.patient.models import Patient_Profile
from admin.doctor.serializers import DoctorAllDataSerializer
from admin.patient.serializers import PatientAllDataSerializer


@api_view(['GET'])
def patient_data(request, patient_id):
    patient_profile = Patient_Profile.objects.filter(user_id=patient_id).first()

    if patient_profile is None:
        return Response({"error": "Patient profile not found"}, status=404)

    patient_id = patient_profile.id

    patient = Patient_Profile.objects.filter(id=patient_id, deleted_at=None).select_related(
        'gender', 'religion', 'blood_group', 'matrimony', 'user'
    ).first()

    serializer = PatientAllDataSerializer(patient)
    return Response(serializer.data)


@api_view(["PUT", "POST"])
def edit_patient_data(request, bodypart_id):
    patient = Patient_Profile.objects.get(id=bodypart_id)
    serializer = PatientSerializer(patient, data=request.data)
    if serializer.is_valid():
        if serializer.save(updated_at=datetime.now()):
            return Response({"status": 200})
        else:
            return Response({"status": 403})
    else:
        return Response({"status": 403})
