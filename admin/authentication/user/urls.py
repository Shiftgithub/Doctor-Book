from django.urls import path
from .webs import *
from backend.login_decorators import protected_view

# To protect admin panel paths from unauthenticated users

urlpatterns = [
    # adminpanel user path
    path("", protected_view(get_user_details), name="user_details"),
    path("add/", admin_form, name="admin_form"),
    path("store/", store_admin, name="store_admin"),
]
