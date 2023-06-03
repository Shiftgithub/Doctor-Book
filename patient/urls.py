from django.urls import path

import doctor
from . import web

urlpatterns = [

    # Frontend paths

    path('', web.landing_dashboard, name="landing_dashboard"),

    path('patient/register/', web.patient_register, name="patient_register"),
    path('patient/login/', web.patient_login, name="patient_login"),
]
