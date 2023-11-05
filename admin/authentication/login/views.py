import hashlib
from .serializers import *
from backend.constants import *
from rest_framework.response import Response
from rest_framework.decorators import api_view
from admin.doctor.models import DoctorProfile
from admin.patient.models import PatientProfile


@api_view(['POST'])
def checking_authorization(request):
    login_serializer = LoginSerializer(data=request.data)
    if login_serializer.is_valid():
        user_fields = [login_serializer.validated_data['user_name']]
        user_name = ' - '.join(user_fields)
        password_fields = [login_serializer.validated_data['password']]
        password = ' - '.join(password_fields)
        hashed_password = hashlib.sha256(password.encode()).hexdigest()

        # Check if user exists in database
        try:
            user = User.objects.get(user_name=user_name, hash=hashed_password)
            set_authenticated_user(request, user)
        except User.DoesNotExist:
            return Response({'status': 403, 'message': 'User does not exist'})

        # Check user role and status
        if user.status == STATUS_ACTIVE:
            if user.role == ROLE_ADMIN:
                return Response({'status': 200, 'message': 'Admin'})
            elif user.role == ROLE_DOCTOR:
                user_info = DoctorProfile.objects.get(user_id=user.id)
                set_user_info(request, user_info, user.id)
                return Response({'status': 200, 'message': 'Doctor'})
            elif user.role == ROLE_PATIENT:
                user_info = PatientProfile.objects.get(user_id=user.id)
                set_user_info(request, user_info, user.id)
                # get_user_info(request, user.id)
                return Response({'status': 200, 'message': 'Patient'})
            else:
                return Response({'status': 403, 'message': 'User is not a doctor or is not approved'})
        elif user.status == STATUS_INACTIVE:
            return Response({'status': 308, 'email': user.email})  # 308 Permanent Redirect
        else:
            return Response({'status': 403, 'message': 'User is not a doctor or is not approved'})
    else:
        return Response({'status': 403, 'message': login_serializer.errors})


# Setting authenticated user into session ...
def set_authenticated_user(request, user):
    request.session['user_id'] = user.id
    request.session['user_name'] = user.user_name
    request.session['user_role'] = user.role
    request.session['user_email'] = user.email
    request.session['user_status'] = user.status


def set_user_info(request, user_info, user_id):
    # Fetch user details and related images
    user = User.objects.filter(id=user_id, deleted_at=None).prefetch_related('images').first()
    if user:
        images = user.images.all()
        if images:
            for image in images:
                photo_url = image.photo_name.url  # Assuming photo_name is an ImageField
                request.session['user_full_name'] = user_info.full_name
                request.session['user_email'] = user.email
                request.session['user_image_url'] = photo_url
        else:
            return None
    else:
        return None
