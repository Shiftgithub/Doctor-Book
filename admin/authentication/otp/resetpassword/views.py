import hashlib

from admin.doctor.models import DoctorProfile
from admin.patient.models import PatientProfile
from .serializers import *
from rest_framework import status
from rest_framework.response import Response
from rest_framework.decorators import api_view
from admin.authentication.otp.verifyotp.views import *
from admin.authentication.otp.function.send_email import *
from admin.authentication.otp.verifyotp.serializers import *
from ...user.models import AdminProfile


@api_view(['POST'])
def forget_password(request):
    serializer = ForgetPasswordSerializer(data=request.data)
    if serializer.is_valid():
        email = serializer.validated_data['email']
        token_str = generate_token(6)
        try:
            user = User.objects.get(email=email)
        except User.DoesNotExist:
            return Response({'status': 401, 'message': 'Email are  incorrect. Enter you email', 'email': email})
        user_type = user.role
        if user_type == ROLE_ADMIN:
            try:
                user_info = AdminProfile.objects.get(user_id=user.id, deleted_at=None)
            except AdminProfile.DoesNotExist:
                return Response({'status': 404, 'message': 'Admin not found'})
        elif user_type == ROLE_DOCTOR:
            try:
                user_info = DoctorProfile.objects.get(user_id=user.id, deleted_at=None)
            except DoctorProfile.DoesNotExist:
                return Response({'status': 404, 'message': 'Doctor not found'})
        elif user_type == ROLE_PATIENT:
            try:
                user_info = PatientProfile.objects.get(user_id=user.id, deleted_at=None)
            except PatientProfile.DoesNotExist:
                return Response({'status': 404, 'message': 'Patient not found'})
        else:
            pass
        check_otp = VerifyOtp.objects.filter(user=user).first()
        otp_serializer = VerifyOtpSerializer(check_otp, data={'otp': token_str}, partial=True)
        if user.status == STATUS_ACTIVE or user.status == STATUS_INACTIVE:
            if otp_serializer.is_valid():
                otp_serializer.save()
                message = f'Your OTP Number is: {token_str}'
                sent_email = send_email(email, user_info.full_name, message)
                if sent_email:
                    response = {
                        'status': 200, 'email': email,
                        'message': 'We send  mail on your email. Please check your email.'
                    }
                    return Response(response)
                else:
                    transaction.set_rollback(True)
                    response = {'status': 401, 'message': 'Check your internet connection.', 'email': email}
                    return Response(response)
            else:
                response = {'status': 403, 'message': 'otp send failed. try again!'}
                return Response(response)
        else:
            response = {'status': 400, 'message': 'Invalid request.', 'errors': serializer.errors}
            return Response(response, status=status.HTTP_400_BAD_REQUEST)


@api_view(['POST'])
def change_password(request):
    change_password_serializer = UserPasswordSerializer(data=request.data)
    email = request.session.get('temp_verify_email')
    if change_password_serializer.is_valid():
        password = change_password_serializer.validated_data['password']
        hashed_password = hashlib.sha256(password.encode()).hexdigest()
        user_instance = User.objects.filter(email=email).first()
        user_type = user_instance.role
        if user_type == ROLE_ADMIN:
            try:
                user_info = AdminProfile.objects.get(user_id=user_instance.id, deleted_at=None)
            except AdminProfile.DoesNotExist:
                return Response({'status': 404, 'message': 'Admin not found'})
        elif user_type == ROLE_DOCTOR:
            try:
                user_info = DoctorProfile.objects.get(user_id=user_instance.id, deleted_at=None)
            except DoctorProfile.DoesNotExist:
                return Response({'status': 404, 'message': 'Doctor not found'})
        elif user_type == ROLE_PATIENT:
            try:
                user_info = PatientProfile.objects.get(user_id=user_instance.id, deleted_at=None)
            except PatientProfile.DoesNotExist:
                return Response({'status': 404, 'message': 'Patient not found'})
        else:
            pass
        if user_instance is not None:
            user_serializer = UserPasswordSerializer(
                user_instance, data={'password': password, 'hash': hashed_password}, partial=True,
            )
            if user_serializer.is_valid():
                user_serializer.save()
                message = 'Your Doctor-Book account password changed successfully'
                send_email(email, user_info.full_name, message)
                response = {'status': 200, 'email': email,
                            'message': 'Your Account Password Changed Successfully.'
                            }
                return Response(response)
            else:
                return Response({'status': 403, 'message': 'Password are not changed. try again', 'email': email})
        else:
            return Response({'status': 404, 'message': 'incorrect password.', 'email': email})
    else:
        response = {'status': 400, 'message': 'Invalid request.', 'email': email}
        return Response(response)


@api_view(['POST'])
def reset_password(request, email):
    reset_password_serializer = PasswordSerializer(data=request.data)

    if reset_password_serializer.is_valid():
        password = reset_password_serializer.validated_data['password']
        new_password = reset_password_serializer.validated_data['new_password']

        # Hash the passwords
        hashed_password = hashlib.sha256(password.encode()).hexdigest()
        new_hashed_password = hashlib.sha256(new_password.encode()).hexdigest()

        try:
            user_instance = User.objects.get(email=email, password=password, hash=hashed_password)
        except User.DoesNotExist:
            return Response({'status': 404, 'message': 'Old Password are incorrect', 'email': email})
        user_type = user_instance.role
        if user_type == ROLE_ADMIN:
            try:
                user_info = AdminProfile.objects.get(user_id=user_instance.id, deleted_at=None)
            except AdminProfile.DoesNotExist:
                return Response({'status': 404, 'message': 'Admin not found'})
        elif user_type == ROLE_DOCTOR:
            try:
                user_info = DoctorProfile.objects.get(user_id=user_instance.id, deleted_at=None)
            except DoctorProfile.DoesNotExist:
                return Response({'status': 404, 'message': 'Doctor not found'})
        elif user_type == ROLE_PATIENT:
            try:
                user_info = PatientProfile.objects.get(user_id=user_instance.id, deleted_at=None)
            except PatientProfile.DoesNotExist:
                return Response({'status': 404, 'message': 'Patient not found'})
        else:
            pass
        # Check if the user instance was found
        if user_instance:
            user_serializer = UserPasswordSerializer(
                user_instance,
                data={'password': new_password, 'hash': new_hashed_password},
                partial=True,
            )
            if user_serializer.is_valid():
                user_serializer.save()
                message = 'Your Doctor-Book account password has been changed successfully'
                send_email(email, user_info.full_name, message)
                return Response({'status': 200, 'message': 'Your account password has been changed successfully'})
            else:
                return Response({'status': 403, 'message': 'Password are incorrect', 'email': email})
        else:
            return Response({'status': 404, 'message': 'User does not exist', 'email': email})
    else:
        return Response({'status': 400, 'message': 'Enter old password correctly data', 'email': email})


@api_view(['POST'])
def change_email(request, user_id):
    change_email_serializer = EmailSerializer(data=request.data)
    if change_email_serializer.is_valid():
        email = change_email_serializer.validated_data['email']
        password = change_email_serializer.validated_data['password']
        new_email = change_email_serializer.validated_data['new_email']
        try:
            user_instance = User.objects.get(email=email, password=password)
        except User.DoesNotExist:
            return Response({'status': 404, 'message': 'User does not exist', 'user_id': user_id})
        user_type = user_instance.role
        if user_type == ROLE_ADMIN:
            try:
                user_info = AdminProfile.objects.get(user_id=user_instance.id, deleted_at=None)
            except AdminProfile.DoesNotExist:
                return Response({'status': 404, 'message': 'Admin not found'})
        elif user_type == ROLE_DOCTOR:
            try:
                user_info = DoctorProfile.objects.get(user_id=user_instance.id, deleted_at=None)
            except DoctorProfile.DoesNotExist:
                return Response({'status': 404, 'message': 'Doctor not found'})
        elif user_type == ROLE_PATIENT:
            try:
                user_info = PatientProfile.objects.get(user_id=user_instance.id, deleted_at=None)
            except PatientProfile.DoesNotExist:
                return Response({'status': 404, 'message': 'Patient not found'})
        else:
            pass
        # Check if the user instance was found
        if user_instance:
            if User.objects.filter(email=new_email).exclude(id=user_instance.id).exists():
                return Response({'status': 403, 'message': 'This email is already in use', 'user_id': user_id})
            else:
                # Update the email by setting the attribute and then calling save
                user_instance.email = new_email
                user_instance.save()
                message = 'Your Doctor-Book account email has been changed successfully'
                send_email(new_email, user_info.full_name, message)  # Uncomment and implement this function
                return Response({'status': 200})
        else:
            return Response({'status': 404, 'message': 'Invalid request', 'user_id': user_id})
    else:
        return Response({'status': 502, 'message': 'Invalid email change data', 'user_id': user_id})
