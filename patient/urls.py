from django.urls import path

import doctor
from . import web

urlpatterns = [

    # Frontend paths

    path('', web.landing_dashboard, name="landing_dashboard"),
    path('landing/doctors/', web.landing_doctors, name="landing_doctors"),
    path('landing/faq', web.landing_faq, name="landing_faq"),
    path('frontend/register/patient/', web.register_patient, name="patient_register"),
    path('frontend/store/patient', web.store_patient, name="store_patient"),
    path('landing/login/', web.login_patient, name="patient_login"),
]
