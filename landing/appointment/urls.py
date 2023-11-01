from .webs import *
from django.urls import path, include

urlpatterns = [
    path('date-time/<int:doctor_id>/', date_time_form, name='date_time_form'),
    path('get-date-time/', get_date_time, name='get_date_time'),
    path('appointment-schedule/form/', appointment_schedule_form, name='appointment_schedule_form'),
    path('appointment-schedule/', store_appointment_schedule, name='appointment_schedule'),
    path('appointment-schedule-method/', store_appointment_and_create_account, name='appointment_schedule_method'),
    path('go-home/', go_home, name='go_home'),
]
