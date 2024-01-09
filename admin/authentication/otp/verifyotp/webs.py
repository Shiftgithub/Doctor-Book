from .views import verify_otp
from django.contrib import messages
from django.shortcuts import render, redirect


def otp_form(request):
    return render(request, 'authentication/otp/verifyotp/templates/otp_form.html')


def verify_otp_method(request):
    operation_response = verify_otp(request)
    message = operation_response.data.get('message')
    if operation_response.data.get('status') == 200:
        user_id = operation_response.data.get('id')
        request.session['temp_verify_id'] = user_id
        email = operation_response.data.get('email')
        request.session['temp_verify_email'] = email
        messages.add_message(request, messages.INFO, message)
        return redirect('change_password_form')
    elif operation_response.data.get('status') == 308:
        messages.add_message(request, messages.INFO, message)
        return redirect('login')
    elif operation_response.data.get('status') == 400:
        email = operation_response.data.get('email')
        request.session['temp_verify_email'] = email
        messages.add_message(request, messages.ERROR, message)
        return redirect('otp_form')
    elif operation_response.data.get('status') == 401:
        email = operation_response.data.get('email')
        request.session['temp_verify_email'] = email
        messages.add_message(request, messages.ERROR, message)
        return redirect('otp_form')
    elif operation_response.data.get('status') == 404:
        email = operation_response.data.get('email')
        request.session['temp_verify_email'] = email
        messages.add_message(request, messages.ERROR, message)
        return redirect('otp_form')
    else:
        email = operation_response.data.get('email')
        request.session['temp_verify_email'] = email
        messages.add_message(request, messages.ERROR, message)
        return redirect('otp_form')
