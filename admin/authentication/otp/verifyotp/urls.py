from .webs import *
from django.urls import path, include

urlpatterns = [
    path(
        '',
        include(
            [
                path('otp/form/', otp_form, name='otp_form'),
                path('varify/otp/', verify_otp_method, name='otp_varify'),
            ]
        ),
    ),
]
