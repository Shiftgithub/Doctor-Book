from django.shortcuts import render
from django.contrib import messages
from . import views

# Patient


def landing_dashboard(request):
    return render(request, 'landing/dashboard.html')


def register_patient(request):
    return render(request, 'patient/form/register_form.html')


def store_patient(request):
    operation_response = views.store_patient_data(request)
    if operation_response.status_code == 200:
        messages.add_message(request, messages.INFO,
                             "Patient data stored successfully")
    else:
        messages.add_message(request, messages.ERROR,
                             "Error in storing Patient data")

    return render(request, 'patient/form/register_form.html')


def login_patient(request):
    return render(request, 'patient/form/login_form.html')
