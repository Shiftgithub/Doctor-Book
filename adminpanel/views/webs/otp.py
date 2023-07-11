from django.shortcuts import render, redirect
from django.contrib import messages
from adminpanel.views.apis.otp_views import varify_otp


def otp_form(request):
    return render(request, 'landing/pages/otp_form.html')


def verify_otp(request):
    operation_response = varify_otp(request)
    if operation_response.status_code == 200:
        messages.add_message(request, messages.INFO, "Verify otp your account successfully")
        return redirect('login')
    else:
        messages.add_message(request, messages.ERROR, "OTP are incorrect!")
        return redirect('otp')
