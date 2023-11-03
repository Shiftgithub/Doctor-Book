from .views import *
from django.shortcuts import render, redirect
from django.contrib import messages


def forget_password_form(request):
    return render(request, 'authentication/otp/resetpassword/templates/forget_password.html')


def forget_password_method(request):
    operation_response = forget_password(request)
    if operation_response.data.get('status') == 200:
        email = operation_response.data.get('email')
        request.session['temp_verify_email'] = email
        messages.add_message(
            request, messages.INFO, 'we send a mail please check your email.'
        )
        return redirect('otp_form')
    else:
        messages.add_message(
            request, messages.ERROR, 'email are not correct please check again'
        )
        return redirect('forget_password_form')


def change_password_form(request):
    return render(request, 'authentication/otp/resetpassword/templates/change_password.html')


def change_password_method(request):
    operation_response = change_password(request)
    if operation_response.data.get('status') == 200:
        messages.add_message(
            request, messages.INFO, 'you account password changed successfully'
        )
        return redirect('login')
    else:
        email = operation_response.data.get('email')
        request.session['temp_verify_email'] = email
        messages.add_message(request, messages.ERROR, 'Error')
        return redirect('forget_password_form')
