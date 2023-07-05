from django.shortcuts import render, redirect
from django.contrib import messages
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
