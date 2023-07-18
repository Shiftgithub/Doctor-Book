from django.shortcuts import render, redirect
from django.contrib import messages
from landing.views.apis.patient_views import *
from adminpanel.views.apis.personal_data_views import *
from adminpanel.views.apis.user_views import get_patient_details
from landing.views.apis.prediction_views import prediction


def patient_form(request):
    return render(request, 'patient/form.html')


def prediction_result(request):
    operation_response = prediction(request)
    if operation_response.data.get('status') == 200:
        messages.add_message(request, messages.INFO, "Message")
        return redirect('otp_form')
    else:
        messages.add_message(request, messages.ERROR, "Error in storing Patient data")
        return redirect('predict')
