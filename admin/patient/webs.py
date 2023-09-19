from admin.patient.views import *
from django.contrib import messages
from admin.personal_data.views import *
from django.shortcuts import render, redirect


def patient_form(request):
    return render(request, 'patient/templates/form.html')


def store_patient(request):
    operation_response = store_patient_data(request)
    if operation_response.data.get('status') == 200:
        email = operation_response.data.get('email')
        request.session['temp_verify_email'] = email
        messages.add_message(request, messages.INFO, 'Please activate your account')
        return redirect('otp_form')
    else:
        messages.add_message(request, messages.ERROR, 'Error in storing Patient data')
        return redirect('add_patient_form')


def edit_patient_form(request, patient_id):
    response_gender = gender_list(request)
    gender_data = response_gender.data

    response_religion = religion_list(request)
    religion_data = response_religion.data

    response_blood_group = blood_group_list(request)
    blood_group_data = response_blood_group.data

    response_matrimony = matrimony_list(request)
    matrimony_data = response_matrimony.data

    response_patient = patient_data(request, patient_id)
    patient_all_data = response_patient.data

    return render(request, 'patient/templates/edit.html',
                  {'gender_data': gender_data, 'religion_data': religion_data,
                   'blood_group_data': blood_group_data, 'matrimony_data': matrimony_data,
                   'patient_all_data': patient_all_data, 'patient_id': patient_id
                   })


def edit_patient(request, patient_id):
    operation_response = edit_patient_data(request, patient_id)
    if operation_response.data.get('status') == 200:

        messages.add_message(request, messages.INFO, 'Patient data are edited successfully.')
        return redirect('edit_patient_form', patient_id=patient_id)
    else:
        messages.add_message(request, messages.ERROR, 'Error in storing Patient data')
        return redirect('edit_patient_form', patient_id=patient_id)
