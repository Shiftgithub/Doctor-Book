import hashlib

from rest_framework.response import Response
from rest_framework.decorators import api_view
from landing.serializers.login_serializers import *
# constants
from backend.constants import *


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
            user = User.objects.get(user_name=user_name, hash=hashed_password, status='active')
            setAuthenticatedUser(request, user)
        except User.DoesNotExist:
            return Response({'status': 403, 'message': 'User does not exist'})

        # Check user role and status
        if user.role == ROLE_ADMIN and user.status == STATUS_ACTIVE:
            return Response({'status': 200, 'message': 'Admin'})

        elif user.role == ROLE_DOCTOR and user.status == STATUS_ACTIVE:
            return Response({'status': 200, 'message': 'Doctor'})

        elif user.role == ROLE_PATIENT and user.status == STATUS_ACTIVE:
            return Response({'status': 200, 'message': 'Patient'})

        else:
            return Response({'status': 403, 'message': 'User is not a doctor or is not approved'})

    else:
        return Response({'status': 403, 'message': login_serializer.errors})


# Setting authenticated user into session ...
def setAuthenticatedUser(request, user):
    request.session['user_id'] = user.id
    request.session['user_name'] = user.user_name
    request.session['user_role'] = user.role
    request.session['user_status'] = user.status
