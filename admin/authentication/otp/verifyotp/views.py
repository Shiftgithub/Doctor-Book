from .serializers import VerifyOtpSerializer
from .models import VerifyOtp
from datetime import datetime
from core.constants import STATUS_ACTIVE
from django.db import transaction
from rest_framework.response import Response
from rest_framework.decorators import api_view
from django.shortcuts import get_object_or_404
from admin.authentication.user.models import User


@api_view(['POST'])
def verify_otp(request):
    email = request.session.get('temp_verify_email')
    user = get_object_or_404(User, email=email)

    otp_serializer = VerifyOtpSerializer(data=request.data)

    if otp_serializer.is_valid():
        otp = otp_serializer.validated_data['otp']

        try:
            otp_check = VerifyOtp.objects.get(otp=otp, user=user)
        except VerifyOtp.DoesNotExist:
            return Response({'status': 404, 'message': 'OTP not found', 'email': email})

        # Set the time zone-aware datetime
        with transaction.atomic():
            if otp_check:
                now = datetime.now()
                otp_check.otp = 0
                otp_check.is_verified = True
                otp_check.updated_at = now

                update_otp = otp_check.save(update_fields=['otp', 'is_verified', 'updated_at'])

                # Update the user's status to active
                user.status = STATUS_ACTIVE
                update_user = user.save(update_fields=['status'])

                # Send an activation email to the user (You should implement this function)
                message = 'Your Doctor Book Account has been activated'
                # send_email(user.email, message)
                data = {'id': user.id, 'email': user.email, 'status': 200, 'message': 'Account activated successfully'}
                return Response(data)
            else:
                transaction.set_rollback(True)
                return Response({'status': 400, 'message': 'Enter Correct Otp', 'email': email})
    else:
        return Response({'status': 400, 'message': 'Invalid OTP data', 'email': email})
