from django.urls import path
from admin.authentication.user.webs import get_user_details

# To protect admin panel paths from unauthenticated users

urlpatterns = [
    # adminpanel user path
    path("", get_user_details, name="user_details"),
]
