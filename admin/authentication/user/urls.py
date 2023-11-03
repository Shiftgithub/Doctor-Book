from django.urls import path
from .webs import get_user_details
from backend.login_decorators import protected_view

# To protect admin panel paths from unauthenticated users

urlpatterns = [
    # adminpanel user path
    path('', protected_view(get_user_details), name='user_details'),
]
