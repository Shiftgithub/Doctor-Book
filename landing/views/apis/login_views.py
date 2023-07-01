import hashlib

from django.db import connection
from rest_framework.response import Response
from rest_framework.decorators import api_view
from landing.serializers.login_serializers import *


@api_view(['POST'])
def checking_authorization(request):
    if request.method == 'POST':
        login_serializer = LoginSerializer(data=request.data)
        if login_serializer.is_valid():
            user_fields = [login_serializer.validated_data['user_name']]
            user_name = ' - '.join(user_fields)
            password_fields = [login_serializer.validated_data['password']]
            password = ' - '.join(password_fields)
            hashed_password = hashlib.sha256(password.encode()).hexdigest()
            try:
                user = UserProfile.objects.get(user_name=user_name, hash=hashed_password)

            except UserProfile.DoesNotExist:
                return Response({'status': 403})
            if user.role == 'Doctor' and user.status == 'Approved':
                return Response({'status': 200})
            else:
                return Response({'status': 403})
        else:
            return Response({'status': 403})
    else:
        return Response({'status': 404})
