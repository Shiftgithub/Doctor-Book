from django.urls import path, include

# views
from admin.authentication.logout.views import logout
from admin.authentication.otp.resendotp.webs import *

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
