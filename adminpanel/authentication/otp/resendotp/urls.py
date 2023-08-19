from django.urls import path, include

# views
from adminpanel.authentication.logout.views import logout
from adminpanel.authentication.otp.resendotp.webs import *

urlpatterns = [
    path(
        "",
        include(
            [
                path("", resend_otp_method, name="resend_otp"),
            ]
        ),
    ),
]
