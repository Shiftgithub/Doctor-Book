import hashlib
from .serializers import *
from django.db import transaction
from django.http import JsonResponse
from rest_framework.response import Response
from rest_framework.decorators import api_view
from django.views.decorators.http import require_GET
from admin.authentication.otp.function.send_email import *
from admin.authentication.otp.verifyotp.models import VerifyOtp
from admin.authentication.user.serializers import UserSerializer, ImageSerializer
from admin.authentication.login.views import set_user_info


@api_view(['POST'])
@transaction.atomic
def store_admin_data(request):
    admin_serializer = AdminProfileSerializer(data=request.data)
    image_serializer = ImageSerializer(data=request.data)
    user_serializer = UserSerializer(data=request.data)
    if admin_serializer.is_valid() and image_serializer.is_valid() and user_serializer.is_valid(raise_exception=True):
        user_name = request.data.get('user_name')
        email = request.data.get('email')

        if User.objects.filter(user_name=user_name).exists():
            return Response({'message': 'This User name already taken. Please try another.', 'status': 404})

        if User.objects.filter(email=email, ).exists():
            return Response({'message': 'This email already used. Please try another.', 'status': 404})

        hashed_password = hashlib.sha256(request.data.get('password').encode()).hexdigest()
        user_serializer.save(hash=hashed_password, role='admin', status='inactive')
        user_profile_instance = user_serializer.instance
        admin_serializer.save(user_id=user_profile_instance)
        image_serializer.save(user_id=user_profile_instance)

        token_str = generate_token(6)
        message = f'Your OTP number is: {token_str}'
        otp_serializer = VerifyOtp(otp=token_str, user_id=user_profile_instance)
        otp_serializer.save()
        sent_email = send_email(email, message)
        if otp_serializer and sent_email:
            data = {'email': email, 'status': 200, 'message': 'We send otp on your email. Please activate your account'}
            return Response(data)
        else:
            transaction.set_rollback(True)
            return Response({'status': 403, 'message': 'Error in storing admin data'})
    else:
        return Response({'status': 400, 'message': 'Invalid request!'})


@api_view(['GET'])
def admin_data(request, user_id):
    try:
        admin = AdminProfile.objects.filter(id=user_id, deleted_at=None).select_related(
            'gender', 'religion', 'blood_group', 'matrimony', 'user'
        ).first()
        if admin is None:
            return Response({'error': 'Admin profile not found', 'status': 400})
        else:
            serializer = AdminViewSerializer(admin).data
            return Response(serializer)
    except AdminProfile.DoesNotExist:
        return Response({'error': 'Admin profile not found', 'status': 400})


@api_view(['PUT', 'POST'])
@transaction.atomic
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
            set_user_info(request, admin, admin.user.id, admin.user.email)

            return Response({'status': 200, 'message': 'Admin data are updated successfully.'})
        else:
            transaction.set_rollback(True)
            return Response({'status': 403, 'message': 'Error in updating admin data'})
    else:
        return Response({'status': 400, 'message': 'Invalid request!'})


@require_GET
def check_username_availability(request, username):
    if User.objects.filter(user_name=username).exists():
        return JsonResponse({'message': 'Username already taken'})
    else:
        return JsonResponse({'message': 'Available'})


@require_GET
def check_email_availability(request, email):
    if User.objects.filter(email=email).exists():
        return JsonResponse({'message': 'Email already taken'})
    else:
        return JsonResponse({'message': 'Available'})
