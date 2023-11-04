import hashlib
from .serializers import *
from backend.constants import *
from rest_framework.response import Response
from rest_framework.decorators import api_view


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
                return Response({'status': 200, 'message': 'Doctor'})
            elif user.role == ROLE_PATIENT:
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
