from .webs import *
from django.urls import path, include
from core.login_decorators import protected_view

urlpatterns = [
    path('date-time/<int:doctor_id>/', date_time_form, name='date_time_form'),
    path('get-date-time/', get_date_time, name='get_date_time'),

    path('appointment-form/', protected_view(appointment_form), name='appointment_form'),
    path('appointment-store/', protected_view(store_appointment_by_doctor), name='store_appointment_by_doctor'),
    path('appointment-schedule-form/', appointment_schedule_form, name='appointment_schedule_form'),
    path('appointment-schedule/', store_appointment_schedule, name='appointment_schedule'),
    path('appointment-schedule-method/', store_appointment_and_create_account, name='appointment_schedule_method'),
    path('appointment-list/', appointment_list_by_doctor, name='appointment_list_by_doctor'),
    path('today-appointment-schedule-list/', appointment_list_by_date, name='appointment_list_by_date'),

    path('view-appointment/<int:appointment_id>/', view_appointment, name='view_appointment'),
    path('edit-appointment-form/<int:appointment_id>/', edit_appointment_form, name='edit_appointment_form'),
    path('edit-appointment/<int:appointment_id>/', edit_appointment, name='edit_appointment'),

    path('go-home/', go_home, name='go_home'),
    path('ajax-time/<int:doctor_id>/<str:date>/', generate_schedule_time, name='time'),
    path('get-appointment/', store_appointment, name='get_appointment'),
]
