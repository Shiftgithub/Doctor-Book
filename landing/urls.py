from django.urls import path

import doctor
from . import web

urlpatterns = [

    # Landing Frontend paths

    path('', web.landing_dashboard, name="landing_dashboard"),
    path('landing/doctors/', web.landing_doctors, name="landing_doctors"),
    path('landing/faq', web.landing_faq, name="landing_faq"),
    path('landing/article', web.landing_article, name="landing_article"),
    path('landing/login/', web.login, name="login"),
    path('landing/doctor/register/', web.doctor_register, name="doctor_register"),

    # called api 
    path('frontend/store/patient', web.store_patient, name="store_patient"),


]
