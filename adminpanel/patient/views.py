import hashlib
from datetime import datetime
from django.db import transaction
from rest_framework import status
from landing.landing.serializers import *
from adminpanel.patient.models import *
from adminpanel.patient.serializers import *
from adminpanel.user.serializers import *
from rest_framework.response import Response
from rest_framework.decorators import api_view
from adminpanel.authentication.otp.verifyotp.models import *
from adminpanel.authentication.otp.function.send_email import *


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
