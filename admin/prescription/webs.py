import datetime
from .views import *
from django.contrib import messages
from django.shortcuts import render, redirect
from admin.patient.views import get_patients_list
from admin.medicine.views import *
from admin.labtest.views import *
from ..doctor.views import doctor_chamber_data


# medicine prescription
def medicine_prescription_form(request):
    response_patient = get_patients_list(request)
    patient_data = response_patient.data

    response_medicine = get_all_medicines_list(request)
    medicine_data = response_medicine.data

    response_medicine_schedule = medicine_schedule_list(request)
    medicine_schedule_data = response_medicine_schedule.data
    data = {
        'patient_data': patient_data,
        'medicine_data': medicine_data,
        'medicine_schedule_data': medicine_schedule_data
    }
    return render(request, 'prescription/templates/medicine/form.html', data)


def store_medicine_prescription(request):
    doctor_id = request.session.get('id')
    user_id = request.session.get('user_id')
    operation_response = store_prescription_data(request, doctor_id, user_id)
    message = operation_response.data.get('message')
    if operation_response.data.get('status') == 200:
        messages.add_message(request, messages.INFO, message)
    elif operation_response.data.get('status') == 400:
        messages.add_message(request, messages.ERROR, message)
    elif operation_response.data.get('status') == 403:
        messages.add_message(request, messages.ERROR, message)
    else:
        messages.add_message(request, messages.ERROR, message)
    return redirect('medicine_prescription_form')


def medicine_prescription_data_view(request):
    doctor_id = request.session.get('doctor_id')
    response = get_all_medicine_prescriptions_list(request, doctor_id)
    all_prescription_data = response.data
    data = {'all_prescription_data': all_prescription_data}
    return render(request, 'prescription/templates/medicine/list_all.html', data)


def medicine_prescription_data_view_by_patient(request):
    patient_id = request.session.get('patient_id')
    response = get_all_medicine_prescriptions_list_by_patient(request, patient_id)
    all_prescription_data = response.data
    data = {'all_prescription_data': all_prescription_data}
    return render(request, 'prescription/templates/medicine/list_all_by_patient.html', data)


def view_medicine_prescription(request, prescription_id):
    response = get_medicine_prescription_by_id(request, prescription_id)
    prescription_data = response.data
    doctor_id = prescription_data['doctor_profile']

    response_chamber_data = doctor_chamber_data(request, doctor_id)
    chamber_data = response_chamber_data.data
    prescription_data['medicine_details'] = zip(
        prescription_data['medicine_name'],
        prescription_data['medicine_schedule_time'],
        prescription_data['frequency'],
        prescription_data['duration']
    )
    # Convert 'created_at' string to datetime object
    prescription_data['created_at'] = datetime.datetime.strptime(
        prescription_data['created_at'],
        "%Y-%m-%dT%H:%M:%S.%f%z"  # Updated format string
    )
    # Format the 'created_at' field with the desired format
    prescription_data['created_at'] = prescription_data['created_at'].strftime("%Y-%m-%d %I:%M %p")
    data = {
        'prescription_data': prescription_data,
        'prescription_id': prescription_id,
        'chamber_data': chamber_data,
    }
    return render(request, 'prescription/templates/medicine/view.html', data)


def print_medicine_prescription(request, prescription_id):
    response = get_medicine_prescription_by_id(request, prescription_id)
    prescription_data = response.data
    doctor_id = prescription_data['doctor_profile']

    response_chamber_data = doctor_chamber_data(request, doctor_id)
    chamber_data = response_chamber_data.data
    prescription_data['medicine_details'] = zip(
        prescription_data['medicine_name'],
        prescription_data['medicine_schedule_time'],
        prescription_data['frequency'],
        prescription_data['duration']
    )
    # Convert 'created_at' string to datetime object
    prescription_data['created_at'] = datetime.datetime.strptime(
        prescription_data['created_at'],
        "%Y-%m-%dT%H:%M:%S.%f%z"  # Updated format string
    )
    # Format the 'created_at' field with the desired format
    prescription_data['created_at'] = prescription_data['created_at'].strftime("%Y-%m-%d %I:%M %p")
    data = {
        'prescription_data': prescription_data,
        'prescription_id': prescription_id,
        'chamber_data': chamber_data,
    }
    return render(request, 'prescription/templates/medicine/print.html', data)


# lab test precription
def lab_prescription_form(request):
    response_patient = get_patients_list(request)
    patient_data = response_patient.data

    response_lab_test = get_all_lab_test_list(request)
    lab_test_data = response_lab_test.data

    data = {
        'patient_data': patient_data,
        'labtest_data': lab_test_data
    }
    return render(request, 'prescription/templates/labtest/form.html', data)


def store_lab_prescription(request):
    doctor_id = request.session.get('id')
    user_id = request.session.get('user_id')
    operation_response = store_lab_prescription_data(request, doctor_id, user_id)
    message = operation_response.data.get('message')
    if operation_response.data.get('status') == 200:
        messages.add_message(request, messages.INFO, message)
    elif operation_response.data.get('status') == 400:
        messages.add_message(request, messages.ERROR, message)
    elif operation_response.data.get('status') == 403:
        messages.add_message(request, messages.ERROR, message)
    else:
        messages.add_message(request, messages.ERROR, message)
    return redirect('lab_prescription_form')


def lab_prescription_data_view(request):
    doctor_id = request.session.get('doctor_id')
    response = get_all_lab_test_prescriptions_list(request, doctor_id)
    all_prescription_data = response.data
    data = {'all_prescription_data': all_prescription_data}
    return render(request, 'prescription/templates/labtest/list_all_by_patient.html', data)


def lab_prescription_data_view_by_patient(request):
    patient_id = request.session.get('patient_id')
    response = get_all_lab_test_prescriptions_list_by_patient(request, patient_id)
    all_prescription_data = response.data
    data = {'all_prescription_data': all_prescription_data}
    return render(request, 'prescription/templates/labtest/list_all.html', data)


def view_lab_prescription(request, prescription_id):
    response = get_lab_prescription_by_id(request, prescription_id)
    prescription_data = response.data
    doctor_id = prescription_data['doctor_profile']

    response_chamber_data = doctor_chamber_data(request, doctor_id)
    chamber_data = response_chamber_data.data

    # Convert 'created_at' string to datetime object
    prescription_data['created_at'] = datetime.datetime.strptime(
        prescription_data['created_at'],
        "%Y-%m-%dT%H:%M:%S.%f%z"  # Updated format string
    )
    # Format the 'created_at' field with the desired format
    prescription_data['created_at'] = prescription_data['created_at'].strftime("%Y-%m-%d %I:%M %p")

    data = {
        'prescription_data': prescription_data,
        'prescription_id': prescription_id,
        'chamber_data': chamber_data,
    }
    return render(request, 'prescription/templates/labtest/view.html', data)


def print_labtest_prescription(request, prescription_id):
    response = get_lab_prescription_by_id(request, prescription_id)
    prescription_data = response.data
    doctor_id = prescription_data['doctor_profile']

    response_chamber_data = doctor_chamber_data(request, doctor_id)
    chamber_data = response_chamber_data.data

    # Convert 'created_at' string to datetime object
    prescription_data['created_at'] = datetime.datetime.strptime(
        prescription_data['created_at'],
        "%Y-%m-%dT%H:%M:%S.%f%z"  # Updated format string
    )
    # Format the 'created_at' field with the desired format
    prescription_data['created_at'] = prescription_data['created_at'].strftime("%Y-%m-%d %I:%M %p")

    data = {
        'prescription_data': prescription_data,
        'prescription_id': prescription_id,
        'chamber_data': chamber_data,
    }
    return render(request, 'prescription/templates/labtest/print.html', data)
