from .views import *
from django.contrib import messages
from django.shortcuts import render, redirect


def login(request):
    return render(request, 'authentication/login/templates/login.html')


def check_login_is_valid(request):
    operation_response = checking_authorization(request)
    message = operation_response.data.get('message')
    if operation_response.data.get('status') == 200:
        messages.add_message(request, messages.INFO, message)
        if request.session['user_role'] == ROLE_ADMIN:
            return redirect('admin_dashboard')
        elif request.session['user_role'] == ROLE_DOCTOR:
            return redirect('doctor_dashboard')
        elif request.session['user_role'] == ROLE_PATIENT:
            return redirect('patient_dashboard')
        else:
            return redirect('patient_dashboard')
    elif operation_response.data.get('status') == 308:  # 308 Permanent Redirect
        messages.add_message(request, messages.ERROR, message)
        email = operation_response.data.get('email')
        request.session['temp_verify_email'] = email
        return redirect('otp_form')
    elif operation_response.data.get('status') == 401:
        messages.add_message(request, messages.ERROR, message)
        return redirect('login')
    elif operation_response.data.get('status') == 403:
        messages.add_message(request, messages.ERROR, message)
        return redirect('login')
    elif operation_response.data.get('status') == 404:
        messages.add_message(request, messages.ERROR, message)
        return redirect('login')
    else:
        messages.add_message(request, messages.ERROR, message)
        return redirect('login')
