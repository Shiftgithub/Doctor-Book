from .views import *
from django.contrib import messages
from admin.doctor.views import doctor_data
from django.shortcuts import render, redirect


def date_time_form(request, doctor_id):
    response_doctor = doctor_data(request, doctor_id)
    doctor_all_data = response_doctor.data
    days = generate_date(request, doctor_id)
    request.session['temp_doctor_id'] = doctor_id
    # schedule_time = generate_schedule_time(request, doctor_id, date)

    data = {
        'date_list': days,
        'doctor_all_data': doctor_all_data,
        # 'schedule_time': schedule_time,
    }

    return render(request, 'appointment/templates/date_time.html', data)


def get_date_time(request):
    operation_response = date_time(request)
    doctor_id = request.session.get('temp_doctor_id')
    if operation_response.data.get('status') == 308:
        appointment_date = operation_response.data.get('appointment_date')
        request.session['temp_appointment_date'] = appointment_date

        appointment_time = operation_response.data.get('appointment_time')
        request.session['temp_appointment_time'] = appointment_time

        messages.add_message(request, messages.INFO,
                             'Please Enter your registration ID or Create a new account for registration ID')
        return redirect('appointment_schedule_form')
    else:
        messages.add_message(request, messages.ERROR, 'Error in Date time data')
        return redirect('date_time_form', doctor_id=doctor_id)


def appointment_schedule_form(request):
    appointment_date = request.session.get('temp_appointment_date')
    appointment_time = request.session.get('temp_appointment_time')
    doctor_id = request.session.get('temp_doctor_id')
    response_doctor = doctor_data(request, doctor_id)
    doctor_all_data = response_doctor.data
    data = {
        'appointment_date': appointment_date,
        'appointment_time': appointment_time,
        'doctor_id': doctor_id,
        'doctor_all_data': doctor_all_data,
    }
    return render(request, 'appointment/templates/appointment_schedule.html', data)


def store_appointment_schedule(request):
    operation_response = store_appointment_data(request)
    if operation_response.data.get('status') == 200:
        messages.add_message(request, messages.INFO,
                             'Appointment Request Send successfully')
        return redirect('go_home')
    else:
        messages.add_message(request, messages.ERROR,
                             'Error in Request Send')
        return redirect('appointment_schedule_form')


def store_appointment_and_create_account(request):
    operation_response = create_patient_account_store_appointment(request)
    if operation_response.data.get('status') == 200:
        messages.add_message(request, messages.INFO,
                             'Appointment Request Send successfully. We send otp on your email please active your account using otp')
        return redirect('otp_form')
    else:
        messages.add_message(request, messages.ERROR,
                             'Error in Request Send')
        return redirect('appointment_schedule_form')


def go_home(request):
    return render(request, 'appointment/templates/go_home.html')
