from django.urls import path
from adminpanel.user.webs import get_user_details

# To protect admin panel paths from unauthenticated users
from backend.login_decorators import protected_view
from landingpanel.landing.webs import *

urlpatterns = [
    # adminpanel user path
    path("", get_user_details, name="user_details"),
]
