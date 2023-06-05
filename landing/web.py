from django.shortcuts import render
from django.contrib import messages
from . import views


# Patient


def landing_dashboard(request):
    return render(request, 'templates/landing/pages/home.html')

def landing_doctors(request):
    return render(request, 'templates/landing/pages/doctors.html')

def landing_article(request):
    return render(request, 'templates/landing/pages/articles.html')

# Renders Landing FAQ page
def landing_faq(request):
    return render(request, 'templates/landing/pages/faq.html')


def login(request):
    return render(request, 'templates/landing/pages/login.html')


def doctor_register(request):
    return render(request, 'templates/landing/pages/register.html')


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

