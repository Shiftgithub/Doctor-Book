from django.urls import path, include
from .webs import *

urlpatterns = [
    path('doctor-profile/<int:doctor_id>/', doctor_profile, name='doctor_profile'),
    path(
        'predict/',
        include(
            [
                path('form/', predict_form, name='predict_form'),
                path('', predict, name='prediction'),
            ]
        ),
    ),
]
