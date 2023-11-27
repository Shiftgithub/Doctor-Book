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
from admin.authentication.login.views import set_user_info


@api_view(['POST'])
def store_admin_data(request):
    admin_serializer = AdminProfileSerializer(data=request.data)
    image_serializer = ImageSerializer(data=request.data)
    user_serializer = UserSerializer(data=request.data)
    if  admin_serializer.is_valid() and image_serializer.is_valid() and user_serializer.is_valid(raise_exception=True):
        password = request.data.get('password')
        hashed_password = hashlib.sha256(password.encode()).hexdigest()
        with transaction.atomic():
            user_serializer.save(hash=hashed_password, role='admin', status='inactive')
            user_profile_instance = user_serializer.instance
            admin_serializer.save(user_id=user_profile_instance)
            image_serializer.save(user_id=user_profile_instance)

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
def admin_data(request, user_id):
    try:
        admin = AdminProfile.objects.filter(id=user_id, deleted_at=None).select_related(
            'gender', 'religion', 'blood_group', 'matrimony', 'user'
        ).first()
        if admin is None:
            return Response({'error': 'Admin profile not found', 'status': '404'})
        else:
            serializer = AdminViewSerializer(admin).data
            return Response(serializer)
    except AdminProfile.DoesNotExist:
        return Response({'error': 'Admin profile not found', 'status': '404'})


@api_view(['PUT', 'POST'])
def edit_admin_data(request, admin_id):
    try:
        admin = AdminProfile.objects.get(id=admin_id, deleted_at=None)
    except AdminProfile.DoesNotExist:
        return Response({'status': '404'})

    admin_serializer = AdminProfileSerializer(admin, data=request.data)
    image_serializer = ImageSerializer(admin.user.images.first(), data=request.data)
    if admin_serializer.is_valid() and image_serializer.is_valid():
        if 'photo_name' in request.data and request.data['photo_name']:
            # New image is selected
            image_serializer.validated_data['photo_name'] = request.data['photo_name']
        else:
            # No new image selected, retain the existing image
            image_serializer.validated_data['photo_name'] = admin.user.images.first().photo_name
        if admin_serializer.save(updated_at=datetime.now()) and image_serializer.save(
                updated_at=datetime.now()):
            # session variable should be updated here
            set_user_info(request, admin, admin_id, admin.user.email)

            return Response({'status': 200})
        else:
            return Response({'status': 403})
    else:
        return Response({'status': 403})
