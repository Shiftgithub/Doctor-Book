from datetime import datetime
from django.db import transaction
from landing.models.patient_models import *
from rest_framework.response import Response
from rest_framework.decorators import api_view
from django.shortcuts import get_object_or_404
from adminpanel.views.apis.auth.send_email import send_email
from adminpanel.serializers.auth.varify_otp_serializers import *


@api_view(['POST'])
def varify_otp(request):
    otp_serializer = VarifyOtpSerializer(data=request.data)
    if otp_serializer.is_valid():
        otp = otp_serializer.validated_data['otp']
        otp_check = get_object_or_404(VarifyOtp, otp=otp)
        otp_check.otp = 0
        otp_check.is_verified = True
        otp_check.updated_at = datetime.now()
        with transaction.atomic():
            otp_check.save(update_fields=['otp', 'is_verified', 'updated_at'])
            user_id = otp_check.user_id
            user = User.objects.get(id=user_id)
            user.status = STATUS_ACTIVE
            user.save(update_fields=['status'])
            message = 'Message From Doctor-Book [Personalized Doctor Predictor]:\n\n' \
                      'Your Doctor Book Account has activate'
            # send_mail = send_email(user.email, message)
        return Response({'id': user.id, 'email': user.email, 'status': 200})
    else:
        return Response({'status': 403})
