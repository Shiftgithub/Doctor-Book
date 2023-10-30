from django.urls import path, include
from .webs import *

urlpatterns = [
    # path('appointment-schedule/form/<int:doctor_id>/', appointment_schedule_form, name='appointment_schedule_form'),
    path('get-date-time/<int:doctor_id>/', date_time_form, name='date_time_form'),
]
