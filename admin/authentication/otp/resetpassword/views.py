import hashlib
from .serializers import *
from rest_framework.response import Response
from rest_framework.decorators import api_view
from admin.authentication.otp.verifyotp.views import *
from admin.authentication.otp.function.send_email import *
from admin.authentication.otp.verifyotp.serializers import *


@api_view(['POST'])
def forget_password(request):
    forget_password_serializer = ForgetPasswordSerializer(data=request.data)
    if forget_password_serializer.is_valid():
        email = forget_password_serializer.validated_data['email']
        token_str = generate_token(6)
        try:
            user = User.objects.get(email=email)
        except User.DoesNotExist:
            return Response({'status': 404})

        varify_otp = VerifyOtp.objects.filter(user=user).first()
        varify_otp_serializer = VerifyOtpSerializer(
            varify_otp, data={'otp': token_str}, partial=True
        )

        if user.status == STATUS_ACTIVE or user.status == STATUS_INACTIVE:
            if varify_otp_serializer.is_valid():
                varify_otp_serializer.save()
                message = f'Message From Doctor-Book [Personalized Doctor Predictor]:\n\nYour OTP Number is: {token_str}'
                # send_email(email, message)
                return Response({'status': 200, 'email': email})
            else:
                return Response({'status': 400})
        else:
            return Response({'status': 403})
    else:
        return Response({'status': 400})


@api_view(['POST'])
def change_password(request):
    change_password_serializer = UserPasswordSerializer(data=request.data)
    email = request.session.get('temp_verify_email')
    if change_password_serializer.is_valid():
        password = change_password_serializer.validated_data['password']
        hashed_password = hashlib.sha256(password.encode()).hexdigest()
        user_instance = User.objects.filter(email=email).first()
        if user_instance is not None:
            user_serializer = UserPasswordSerializer(
                user_instance,
                data={'password': password, 'hash': hashed_password},
                partial=True,
            )
            if user_serializer.is_valid():
                user_serializer.save()
                message = f'Message From Doctor-Book [Personalized Doctor Predictor]:\n\nYour password changed successfully'
                # send_email(email, message)
                return Response({'status': 200})
            else:
                return Response({'status': 400, 'email': email})
        else:
            return Response({'status': 400, 'message': 'User does not exist', 'email': email})
    else:
        return Response({'status': 403, 'email': email})


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
            return Response({'status': 404, 'message': 'User does not exist', 'email': email})

        # Check if the user instance was found
        if user_instance:
            user_serializer = UserPasswordSerializer(
                user_instance,
                data={'password': new_password, 'hash': new_hashed_password},
                partial=True,
            )
            if user_serializer.is_valid():
                user_serializer.save()
                message = 'Your password has been changed successfully'
                # send_email(email, message)  # Uncomment and implement this function
                return Response({'status': 200})
            else:
                return Response({'status': 400, 'message': 'Invalid request', 'email': email})
        else:
            return Response({'status': 400, 'message': 'User does not exist', 'email': email})
    else:
        return Response({'status': 400, 'message': 'Invalid password data', 'email': email})


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
        # Check if the user instance was found
        if user_instance:
            if User.objects.filter(email=new_email).exclude(id=user_instance.id).exists():
                return Response({'status': 400, 'message': 'This email is already in use', 'user_id': user_id})
            else:
                # Update the email by setting the attribute and then calling save
                user_instance.email = new_email
                user_instance.save()
                message = 'Your email has been changed successfully'
                # send_email(new_email, message)  # Uncomment and implement this function
                return Response({'status': 200})
        else:
            return Response({'status': 400, 'message': 'Invalid request', 'user_id': user_id})
    else:
        return Response({'status': 400, 'message': 'Invalid email change data', 'user_id': user_id})
