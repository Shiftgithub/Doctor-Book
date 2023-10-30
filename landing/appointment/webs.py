from .views import *
from django.contrib import messages
from admin.doctor.views import doctor_data
from django.shortcuts import render, redirect


# def appointment_schedule_form(request, doctor_id):
#     response_doctor = doctor_data(request, doctor_id)
#     doctor_all_data = response_doctor.data
#     days = generate_date(request, doctor_id)
#     schedule_time = generate_schedule_time(request, doctor_id)
#     data = {
#         'date_list': days,
#         'doctor_all_data': doctor_all_data,
#         'schedule_time': schedule_time,
#     }
#     return render(request, 'prediction/templates/appointment_schedule.html', data)

def date_time_form(request, doctor_id):
    response_doctor = doctor_data(request, doctor_id)
    doctor_all_data = response_doctor.data
    days = generate_date(request, doctor_id)
    schedule_time = generate_schedule_time(request, doctor_id)
    data = {
        'date_list': days,
        'doctor_all_data': doctor_all_data,
        'schedule_time': schedule_time,
    }
    return render(request, 'appointment/templates/date_time.html', data)
