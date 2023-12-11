import datetime
from .views import *
from django.contrib import messages
from django.shortcuts import render, redirect
from admin.patient.views import get_patients_list
from admin.medicine.views import *
from admin.labtest.views import *


# prescription
def prescription_form(request):
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
    return render(request, 'prescription/templates/form.html', data)


def store_prescription(request):
    doctor_id = request.session.get('id')
    user_id = request.session.get('user_id')
    operation_response = store_prescription_data(request, doctor_id, user_id)
    if operation_response.data.get('status') == 200:
        messages.add_message(
            request, messages.INFO, 'Prescription data stored successfully'
        )
    else:
        messages.add_message(
            request, messages.ERROR, 'Error in storing prescription data'
        )
    return redirect('add_prescription_form')


def store_lab_prescription(request):
    doctor_id = request.session.get('id')
    user_id = request.session.get('user_id')
    operation_response = store_lab_prescription_data(request, doctor_id, user_id)
    if operation_response.data.get('status') == 200:
        messages.add_message(
            request, messages.INFO, 'Prescription data stored successfully'
        )
    else:
        messages.add_message(
            request, messages.ERROR, 'Error in storing prescription data'
        )
    return redirect('lab_prescription_form')


def medicine_prescription_data_view(request):
    response = get_all_medicine_prescriptions_list(request)
    all_prescription_data = response.data
    data = {'all_prescription_data': all_prescription_data}
    return render(request, 'prescription/templates/list_all.html', data)


def lab_prescription_data_view(request):
    response = get_all_lab_test_prescriptions_list(request)
    all_prescription_data = response.data
    data = {'all_prescription_data': all_prescription_data}
    return render(request, 'prescription/templates/labtest/list_all.html', data)


def view_medicine_prescription(request, prescription_id):
    response = get_medicine_prescription_by_id(request, prescription_id)
    prescription_data = response.data
    prescription_data['medicine_details'] = zip(
        prescription_data['medicine_name'],
        prescription_data['medicine_schedule_time'],
        prescription_data['frequency'],
        prescription_data['duration']
    )
    # Convert 'created_at' string to datetime object
    prescription_data['created_at'] = datetime.datetime.strptime(prescription_data['created_at'],
                                                                 "%Y-%m-%dT%H:%M:%S.%fZ")
    # Format the 'created_at' field with the desired format
    prescription_data['created_at'] = prescription_data['created_at'].strftime("%Y-%m-%d %I:%M %p")
    data = {
        # 'age': age,
        'prescription_data': prescription_data,
        # 'medicines_with_schedule': medicines_with_schedule,
        'prescription_id': prescription_id
    }
    return render(request, 'prescription/templates/view.html', data)


def view_lab_prescription(request, prescription_id):
    response = get_lab_prescription_by_id(request, prescription_id)
    prescription_data = response.data
    date_of_birth = prescription_data.get('date_of_birth', '')
    issue_date = prescription_data.get('issue_date', '')

    data = {
        # 'age': age,
        'prescription_data': prescription_data,
        'prescription_id': prescription_id
    }
    return render(request, 'prescription/templates/labtest/view.html', data)


def edit_prescription_form(request, prescription_id):
    response_prescription = prescription_dataview(request, prescription_id)
    prescription_data = response_prescription.data
    data = {'prescription_data': prescription_data, 'prescription_id': prescription_id}
    return render(request, 'prescription/templates/edit.html', data)


def edit_prescription(request, prescription_id):
    operation_response = edit_prescription_data(request, prescription_id)

    if operation_response.data.get('status') == 200:
        messages.add_message(
            request, messages.INFO, 'Prescription data edited successfully'
        )
    else:
        messages.add_message(request, messages.ERROR, 'Error editing prescription data')

    return redirect('edit_prescription_form', prescription_id=prescription_id)


def delete_prescription(request, prescription_id):
    operation_response = softdelete_prescription_data(request, prescription_id)

    if operation_response.data.get('status') == 200:
        messages.add_message(
            request, messages.INFO, 'Prescription data deleted successfully'
        )
    elif operation_response.data.get('status') == 404:
        messages.add_message(request, messages.ERROR,
                             'Prescription cannot delete .'
                             ' because it is associated with Doctor Table Or prescription Specification Table.',
                             )
    else:
        messages.add_message(request, messages.ERROR, 'Error deleting prescription data')

    return redirect('prescription_list')


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
