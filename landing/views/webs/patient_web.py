from django.shortcuts import render, redirect
from django.contrib import messages

from adminpanel.views.apis.doctor_views import *
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


def view_patient(request, patient_id):
    response_patient = patient_data(request, patient_id)
    patient_all_data = response_patient.data
    return render(request, 'patient/view.html', {'patient_all_data': patient_all_data})


def edit_patient_form(request, patient_id):
    response_gender = gender_list(request)
    gender_data = response_gender.data

    response_religion = religion_list(request)
    religion_data = response_religion.data

    response_blood_group = blood_group_list(request)
    blood_group_data = response_blood_group.data

    response_matrimony = matrimony_list(request)
    matrimony_data = response_matrimony.data

    response_division = division_list(request)
    division_data = response_division.data

    response_district = district_list(request)
    district_data = response_district.data

    response_upazila = upazila_list(request)
    upazila_data = response_upazila.data

    response_patient = patient_data(request, patient_id)
    patient_all_data = response_patient.data

    return render(request, 'admin/doctor/edit.html',
                  {'gender_data': gender_data, 'religion_data': religion_data,
                   'blood_group_data': blood_group_data, 'matrimony_data': matrimony_data,
                   'division_data': division_data, 'district_data': district_data,
                   'upazila_data': upazila_data, 'patient_all_data': patient_all_data
                   })
