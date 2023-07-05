from django.shortcuts import render, redirect
from django.contrib import messages
from landing.views.apis.patient_views import *


def patient_form(request):
    return render(request, 'patient/form.html')


def store_patient(request):
    operation_response = store_patient_data(request)
    if operation_response.status_code == 200:
        messages.add_message(request, messages.INFO,"Patient data stored successfully")
    else:
        messages.add_message(request, messages.ERROR,"Error in storing Patient data")
    return redirect('add_patient_form')
