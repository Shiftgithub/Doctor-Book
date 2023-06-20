from django.urls import path
from landing.webs.landing_web import *

urlpatterns = [
    # Landing Frontend paths
    path('', landing_dashboard, name="landing_dashboard"),
    path('landing/doctors/', landing_doctors, name="landing_doctors"),
    path('landing/faq', landing_faq, name="landing_faq"),
    path('landing/article', landing_article, name="landing_article"),
    path('landing/login/', login, name="login"),
    # path('landing/doctor/register/', doctor_register, name="doctor_register"),
    path('landing/predict/', predict, name="predict"),
    path('landing/store/patient', store_patient, name="store_patient"),


]
