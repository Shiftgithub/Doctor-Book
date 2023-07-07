from django.shortcuts import render, redirect
from django.contrib import messages

from adminpanel.views.apis.doctor_views import *
from adminpanel.views.apis.user_views import get_patient_details
from landing.views.apis.patient_views import *


def patient_form(request):
    return render(request, 'patient/form.html')


def store_patient(request):
    operation_response = store_patient_data(request)
    if operation_response.status_code == 200:
        messages.add_message(request, messages.INFO, "Patient data stored successfully")
    else:
        messages.add_message(request, messages.ERROR, "Error in storing Patient data")
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

    user_details = get_patient_details(request, request.session.get('user_id'))
    patient_all_data = user_details.data

    return render(request, 'patient/edit.html',
                  {'gender_data': gender_data, 'religion_data': religion_data,
                   'blood_group_data': blood_group_data, 'matrimony_data': matrimony_data,
                   'patient_all_data': patient_all_data
                   })


def edit_patient(request, patient_id):
    response_patient = edit_patient_data(request, patient_id)
    patient_data = response_patient.data
    print(patient_data)
    return redirect('edit_patient_form', patient_id=patient_id)
