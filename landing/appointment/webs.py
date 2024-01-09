import datetime
from .views import *
from django.contrib import messages
from admin.patient.views import patient_data, get_patients_list
from django.shortcuts import render, redirect
from admin.doctor.views import doctor_data, get_all_doctors_list_for_landing, get_all_doctors_list


def date_time_form(request, doctor_id):
    response_doctor = doctor_data(request, doctor_id)
    doctor_all_data = response_doctor.data
    days = generate_date(request, doctor_id)
    request.session['temp_doctor_id'] = doctor_id

    data = {
        'date_list': days,
        'doctor_all_data': doctor_all_data,
    }

    return render(request, 'appointment/templates/date_time.html', data)


def get_date_time(request):
    operation_response = date_time(request)
    doctor_id = request.session.get('temp_doctor_id')
    message = operation_response.data.get('message')
    if operation_response.data.get('status') == 308:
        appointment_date = operation_response.data.get('appointment_date')
        request.session['temp_appointment_date'] = appointment_date
        appointment_time = operation_response.data.get('appointment_time')
        request.session['temp_appointment_time'] = appointment_time
        messages.add_message(request, messages.INFO, message)
        return redirect('appointment_schedule_form')
    elif operation_response.data.get('status') == 400:
        messages.add_message(request, messages.ERROR, message)
        return redirect('date_time_form', doctor_id=doctor_id)
    else:
        messages.add_message(request, messages.ERROR, message)
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

    message = operation_response.data.get('message')
    if operation_response.data.get('status') == 200:
        messages.add_message(request, messages.INFO, message)
        return redirect('go_home')
    elif operation_response.data.get('status') == 400:
        messages.add_message(request, messages.ERROR, message)
        return redirect('appointment_schedule_form')
    elif operation_response.data.get('status') == 403:
        messages.add_message(request, messages.ERROR, message)
        return redirect('appointment_schedule_form')
    elif operation_response.data.get('status') == 404:
        messages.add_message(request, messages.ERROR, message)
        return redirect('appointment_schedule_form')
    else:
        messages.add_message(request, messages.ERROR, message)
        return redirect('appointment_schedule_form')


def store_appointment_and_create_account(request):
    operation_response = create_patient_account_store_appointment(request)
    message = operation_response.data.get('message')
    if operation_response.data.get('status') == 200:
        email = operation_response.data.get("email")
        request.session["temp_verify_email"] = email
        messages.add_message(request, messages.INFO, message)
        return redirect('otp_form')
    elif operation_response.data.get('status') == 400:
        messages.add_message(request, messages.ERROR, message)
        return redirect('appointment_schedule_form')
    elif operation_response.data.get('status') == 403:
        messages.add_message(request, messages.ERROR, message)
        return redirect('appointment_schedule_form')
    elif operation_response.data.get('status') == 404:
        messages.add_message(request, messages.ERROR, message)
        return redirect('appointment_schedule_form')
    else:
        messages.add_message(request, messages.ERROR, message)
        return redirect('appointment_schedule_form')


def appointment_list_by_doctor(request):
    doctor_id = request.session.get('doctor_id')
    response = get_all_appointment_by_doctor(request, doctor_id)
    all_data = response.data
    return render(request, 'appointment/templates/list_all.html', {'all_data': all_data})


def appointment_list_by_date(request):
    doctor_id = request.session.get('doctor_id')
    response = get_appointment_list_by_date(request, doctor_id)
    all_data = response.data

    # Assuming all_data is a list of dictionaries
    for item in all_data:
        # Convert 'created_at' string to datetime object
        item['created_at'] = datetime.strptime(item['created_at'], "%Y-%m-%dT%H:%M:%S.%fZ")

        # Format the 'created_at' field with the desired format
        item['created_at'] = item['created_at'].strftime("%Y-%m-%d %I:%M %p")

    return render(request, 'appointment/templates/today_appointment_list.html', {'all_data': all_data})


def store_appointment(request):
    operation_response = get_store_appointment(request)
    message = operation_response.data.get('message')
    if operation_response.data.get('status') == 200:
        messages.add_message(request, messages.INFO, message)
    elif operation_response.data.get('status') == 400:
        messages.add_message(request, messages.ERROR, message)
    elif operation_response.data.get('status') == 403:
        messages.add_message(request, messages.ERROR, message)
    elif operation_response.data.get('status') == 404:
        messages.add_message(request, messages.ERROR, message)
    else:
        messages.add_message(request, messages.ERROR, message)
    return redirect('patient_predict_form')


def view_appointment(request, appointment_id):
    response = appointment_data_view(request, appointment_id)
    appointment_data = response.data
    appointment_data['created_at'] = datetime.strptime(appointment_data['created_at'], "%Y-%m-%dT%H:%M:%S.%fZ")
    appointment_data['created_at'] = appointment_data['created_at'].strftime("%Y-%m-%d %I:%M %p")

    patient_id = appointment_data['patient']
    response_patient_data = patient_data(request, patient_id)
    patient_all_data = response_patient_data.data

    data = {
        'appointment_data': appointment_data,
        "patient_data": patient_all_data,
        'appointment_id': appointment_id
    }
    return render(request, 'appointment/templates/view.html', data)


def edit_appointment_form(request, appointment_id):
    response = appointment_data_view(request, appointment_id)
    appointment_data = response.data
    appointment_data['created_at'] = datetime.strptime(appointment_data['created_at'], "%Y-%m-%dT%H:%M:%S.%fZ")
    appointment_data['created_at'] = appointment_data['created_at'].strftime("%Y-%m-%d %I:%M %p")

    patient_id = appointment_data['patient']
    response_patient_data = patient_data(request, patient_id)
    patient_all_data = response_patient_data.data
    doctor_id = request.session['doctor_id']

    days = generate_date(request, doctor_id)

    response_doctor = get_all_doctors_list_for_landing(request)
    all_doctor_data = response_doctor.data
    data = {
        'appointment_data': appointment_data,
        "patient_data": patient_all_data,
        'appointment_id': appointment_id,
        'date_list': days,
        'all_doctor_data': all_doctor_data,
    }
    return render(request, 'appointment/templates/edit.html', data)


def edit_appointment(request, appointment_id):
    operation_response = edit_appointment_data(request, appointment_id)
    message = operation_response.data.get('message')
    if operation_response.data.get('status') == 200:
        messages.add_message(request, messages.INFO, message)
    else:
        messages.add_message(request, messages.ERROR, message)

    return redirect('edit_appointment_form', appointment_id=appointment_id)


def appointment_form(request):
    doctor_id = request.session['doctor_id']
    days = generate_date(request, doctor_id)

    response_doctor = get_all_doctors_list(request)
    all_doctor_data = response_doctor.data

    response_patient = get_patients_list(request)
    all_patient_data = response_patient.data

    data = {
        'date_list': days,
        'doctor_id': doctor_id,
        'all_doctor_data': all_doctor_data,
        'all_patient_data': all_patient_data,
    }

    return render(request, 'appointment/templates/form.html', data)


def store_appointment_by_doctor(request):
    operation_response = get_store_appointment(request)
    message = operation_response.data.get('message')
    if operation_response.data.get('status') == 200:
        messages.add_message(request, messages.INFO, message)
        return redirect('appointment_form')
    elif operation_response.data.get('status') == 400:
        messages.add_message(request, messages.ERROR, message)
        return redirect('appointment_form')
    elif operation_response.data.get('status') == 403:
        messages.add_message(request, messages.ERROR, message)
        return redirect('appointment_form')
    elif operation_response.data.get('status') == 404:
        messages.add_message(request, messages.ERROR, message)
        return redirect('appointment_form')
    else:
        messages.add_message(request, messages.ERROR, message)
        return redirect('appointment_form')


def appointment_list_by_patient(request):
    patient_id = request.session.get('patient_id')
    response = get_all_appointment_by_patient(request, patient_id)
    all_data = response.data
    return render(request, 'patient/templates/appointment_list_all.html', {'all_data': all_data})


def go_home(request):
    return render(request, 'appointment/templates/go_home.html')
