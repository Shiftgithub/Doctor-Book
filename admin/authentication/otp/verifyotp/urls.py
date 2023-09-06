from django.urls import path, include
from admin.authentication.otp.verifyotp.webs import *

urlpatterns = [
    path(
        "",
        include(
            [
                path("otp/form/", otp_form, name="otp_form"),
                path("varify/otp/", verify_otp_method, name="otp_varify"),
            ]
        ),
    ),
]
