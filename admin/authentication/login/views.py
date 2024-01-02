import hashlib
from .serializers import *
from admin.constants.constants import *
from rest_framework.response import Response
from rest_framework.decorators import api_view
from admin.doctor.models import DoctorProfile
from admin.patient.models import PatientProfile
from admin.authentication.user.models import AdminProfile


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
            return Response({'status': 401, 'message': 'User name and Password are not match!'})

        # Check user role and status
        if user.status == STATUS_ACTIVE:
            if user.role == ROLE_ADMIN:
                admin_info = AdminProfile.objects.get(user_id=user.id)
                set_user_info(request, admin_info, user.id, user.email)
<<<<<<< HEAD
=======
                request.session['admin_id'] = admin_info.id
>>>>>>> 0a0d8f532772ef8919a2217788d4c6179800016c
                return Response({'status': 200, 'role': 'Admin', 'message': 'Login Successfully'})
            elif user.role == ROLE_DOCTOR:
                doctor_info = DoctorProfile.objects.get(user_id=user.id)
                set_user_info(request, doctor_info, user.id, user.email)
                request.session['doctor_id'] = doctor_info.id
                return Response({'status': 200, 'role': 'Doctor', 'message': 'Login Successfully'})
            elif user.role == ROLE_PATIENT:
                patient_info = PatientProfile.objects.get(user_id=user.id)
                set_user_info(request, patient_info, user.id, user.email)
                request.session['patient_id'] = patient_info.id
                return Response({'status': 200, 'role': 'Patient', 'message': 'Login Successfully'})
            else:
                return Response({'status': 404, 'message': 'User is not a approved'})
        elif user.status == STATUS_INACTIVE:
            response = {'status': 308, 'email': user.email, 'message': 'Please Verified your Account!'}
            return Response(response)  # 308 Permanent Redirect
        else:
            response = {'status': 404, 'message': 'User is not a doctor or is not approved'}
            return Response(response)
    else:
        return Response({'status': 403, 'message': 'Authentication failed! Please try again'})


# Setting authenticated user into session ...
def set_authenticated_user(request, user):
    request.session['user_id'] = user.id
    request.session['user_name'] = user.user_name
    request.session['user_role'] = user.role
    request.session['user_email'] = user.email
    request.session['user_status'] = user.status


def set_user_info(request, user_info, user_id, email):
    # Fetch user details and related images
    user = User.objects.filter(id=user_id, deleted_at=None).prefetch_related('images').first()
    request.session['id'] = user_info.id
    request.session['user_full_name'] = user_info.full_name
    request.session['user_email'] = email
    if user:
        images = user.images.all()
        if images:
            for image in images:
                if image.photo_name:  # Check if the image has a file associated with it
                    photo_url = image.photo_name.url
                    request.session['user_image_url'] = photo_url
                    break  # Assuming you want to use the first image
        else:
            return None
    else:
        return None
