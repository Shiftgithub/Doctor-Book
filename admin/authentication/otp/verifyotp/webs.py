from .views import varify_otp
from django.contrib import messages
from django.shortcuts import render, redirect


def otp_form(request):
    return render(request, 'authentication/otp/verifyotp/templates/otp_form.html')


def verify_otp_method(request):
    operation_response = verify_otp(request)
    if operation_response.data.get('status') == 200:
        user_id = operation_response.data.get('id')
        request.session['temp_verify_id'] = user_id
        email = operation_response.data.get('email')
        request.session['temp_verify_email'] = email
        messages.add_message(request, messages.INFO, 'Verify otp your account successfully')
        return redirect('change_password_form')
    else:
        email = operation_response.data.get('email')
        request.session['temp_verify_email'] = email
        messages.add_message(request, messages.ERROR, 'OTP are incorrect!')
        return redirect('otp_form')
