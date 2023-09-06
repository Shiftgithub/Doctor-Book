import hashlib
from rest_framework.response import Response
from rest_framework.decorators import api_view
from admin.authentication.otp.verifyotp.views import *
from admin.authentication.otp.function.send_email import *
from admin.authentication.otp.verifyotp.serializers import *
from admin.authentication.otp.resetpassword.serializers import *


@api_view(["POST"])
def forget_password(request):
    forget_password_serializer = ForgetPasswordSerializer(data=request.data)
    if forget_password_serializer.is_valid():
        email = forget_password_serializer.validated_data["email"]
        token_str = generate_token(6)
        try:
            user = User.objects.get(email=email)
        except User.DoesNotExist:
            return Response({"status": 404})

        varify_otp = VarifyOtp.objects.filter(user=user).first()
        varify_otp_serializer = VarifyOtpSerializer(
            varify_otp, data={"otp": token_str}, partial=True
        )

        if user.status == STATUS_ACTIVE or user.status == STATUS_INACTIVE:
            if varify_otp_serializer.is_valid():
                varify_otp_serializer.save()
                message = f"Message From Doctor-Book [Personalized Doctor Predictor]:\n\nYour OTP Number is: {token_str}"
                # send_email(email, message)
                return Response({"status": 200, "email": email})
            else:
                return Response({"status": 400})
        else:
            return Response({"status": 403})
    else:
        return Response({"status": 400})


@api_view(["POST"])
def change_password(request):
    change_password_serializer = UserPasswordSerializer(data=request.data)
    email = request.session.get("temp_verify_email")
    if change_password_serializer.is_valid():
        password = change_password_serializer.validated_data["password"]
        hashed_password = hashlib.sha256(password.encode()).hexdigest()
        user_instance = User.objects.filter(email=email).first()
        if user_instance is not None:
            user_serializer = UserPasswordSerializer(
                user_instance,
                data={"password": password, "hash": hashed_password},
                partial=True,
            )
            if user_serializer.is_valid():
                user_serializer.save()
                message = f"Message From Doctor-Book [Personalized Doctor Predictor]:\n\nYour password changed successfully"
                # send_email(email, message)
                return Response({"status": 200, "email": email})
            else:
                return Response({"status": 400})
        else:
            return Response({"status": 400, "message": "User does not exist"})
    else:
        return Response({"status": 403})
