from django.shortcuts import render
import hashlib
from datetime import datetime
from django.db import transaction
from .serializers import *
from rest_framework.response import Response
from rest_framework.decorators import api_view
from django.shortcuts import get_object_or_404
from admin.authentication.user.models import Images
from admin.authentication.otp.verifyotp.models import *
from admin.authentication.otp.function.send_email import *
from admin.authentication.user.serializers import *
from .serializers import *
from admin.authentication.otp.verifyotp.models import VerifyOtp
from admin.authentication.user.serializers import UserSerializer, ImageSerializer


@api_view(['POST'])
def store_admin_data(request):
    admin_serializer = AdminProfileSerializer(data=request.data)
    user_serializer = UserSerializer(data=request.data)
    if user_serializer.is_valid(raise_exception=True) and admin_serializer.is_valid():
        password = request.data.get('password')
        hashed_password = hashlib.sha256(password.encode()).hexdigest()

        with transaction.atomic():
            user_serializer.save(hash=hashed_password, role='admin', status='inactive')

            user_profile_instance = user_serializer.instance
            registration_no = generate_unique(18)
            admin_serializer.save(user_id=user_profile_instance, registration_no=registration_no)

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
