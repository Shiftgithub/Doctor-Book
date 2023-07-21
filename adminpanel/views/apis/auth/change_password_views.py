import hashlib
from rest_framework.decorators import api_view
from rest_framework.response import Response
from adminpanel.serializers.auth.change_password_serializers import UserPasswordSerializer
from adminpanel.views.apis.auth.send_email import send_email
from adminpanel.models.user_models import User


@api_view(['POST'])
def change_password(request):
    change_password_serializer = UserPasswordSerializer(data=request.data)
    email = request.session.get('temp_verify_email')
    if change_password_serializer.is_valid():
        password = change_password_serializer.validated_data['password']
        hashed_password = hashlib.sha256(password.encode()).hexdigest()
        user_instance = User.objects.filter(email=email).first()
        if user_instance is not None:
            user_serializer = UserPasswordSerializer(user_instance,
                                                     data={'password': password, 'hash': hashed_password}, partial=True)
            if user_serializer.is_valid():
                user_serializer.save()
                message = f'Message From Doctor-Book [Personalized Doctor Predictor]:\n\nYour password changed successfully'
                # send_email(email, message)
                return Response({'status': 200, 'email': email})
            else:
                return Response({'status': 400})
        else:
            return Response({'status': 400, 'message': 'User does not exist'})
    else:
        return Response({'status': 403})
