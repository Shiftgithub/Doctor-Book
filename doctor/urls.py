from django.urls import path
from . import web

urlpatterns = [
    path('frontend/add/doctor/', web.doctor_form, name="add_doctor_form"),
    path('frontend/store/doctor/', web.store_doctor, name="store_doctor"),
    path('frontend/doctors/list/', web.doctor_dataview, name="doctor_list"),

    path('doctor/register/', web.doctor_register, name="doctor_register"),
    path('doctor/login/', web.doctor_login, name="doctor_login"),
]
