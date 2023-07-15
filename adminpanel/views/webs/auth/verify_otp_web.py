from django.shortcuts import render, redirect
from django.contrib import messages
from adminpanel.views.apis.auth.verify_otp_views import varify_otp


def otp_form(request):
    email = request.GET.get('email')
    print(email)
    return render(request, 'landing/pages/otp_form.html', {'email': email})


def verify_otp_method(request):
    email = operation_response = varify_otp(request)
    operation_response.data.get('email')
    if operation_response.data.get('status') == 200:
        messages.add_message(request, messages.INFO, "Verify otp your account successfully")
        return redirect('reset_password_form')
    else:
        messages.add_message(request, messages.ERROR, "OTP are incorrect!")
        return render(request, 'landing/pages/otp_form.html', {'email': email})
