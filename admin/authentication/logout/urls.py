from django.urls import path
from admin.authentication.logout.views import logout

urlpatterns = [
    path("", logout, name="logout"),
]
