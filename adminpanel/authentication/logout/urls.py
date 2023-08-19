from django.urls import path
from adminpanel.authentication.logout.views import logout

urlpatterns = [
    path("", logout, name="logout"),
]
