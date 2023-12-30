from .views import *
from django.shortcuts import render, redirect
from django.contrib import messages


def forget_password_form(request):
    return render(request, 'authentication/otp/resetpassword/templates/forget_password.html')


def forget_password_method(request):
    operation_response = forget_password(request)
    message = operation_response.data.get('message')
    if operation_response.data.get('status') == 200:
        email = operation_response.data.get('email')
        request.session['temp_verify_email'] = email
        messages.add_message(request, messages.INFO, message)
        return redirect('otp_form')
    elif operation_response.data.get('status') == 400:
        email = operation_response.data.get('email')
        request.session['temp_verify_email'] = email
        messages.add_message(request, messages.ERROR, message)
    elif operation_response.data.get('status') == 401:
        email = operation_response.data.get('email')
        request.session['temp_verify_email'] = email
        messages.add_message(request, messages.ERROR, message)
        return redirect('otp_form')
    elif operation_response.data.get('status') == 403:
        email = operation_response.data.get('email')
        request.session['temp_verify_email'] = email
        messages.add_message(request, messages.ERROR, message)
    else:
        messages.add_message(request, messages.ERROR, message)
        return redirect('forget_password_form')


def change_password_form(request):
    return render(request, 'authentication/otp/resetpassword/templates/change_password.html')


def change_password_method(request):
    operation_response = change_password(request)
    email = operation_response.data.get('email')
    request.session['temp_verify_email'] = email
    message = operation_response.data.get('message')
    if operation_response.data.get('status') == 200:
        messages.add_message(request, messages.INFO, message)
        return redirect('login')
    elif operation_response.data.get('status') == 400:
        messages.add_message(request, messages.ERROR, message)
        return redirect('forget_password_form')
    elif operation_response.data.get('status') == 401:
        messages.add_message(request, messages.INFO, message)
        return redirect('forget_password_form')
    elif operation_response.data.get('status') == 403:
        messages.add_message(request, messages.ERROR, message)
        return redirect('forget_password_form')
    else:
        messages.add_message(request, messages.ERROR, message)
        return redirect('forget_password_form')


def reset_password_form(request):
    return render(request, 'authentication/otp/resetpassword/templates/reset_password.html')


def reset_password_method(request):
    email = request.session['user_email']
    operation_response = reset_password(request, email)
    message = operation_response.data.get('message')
    if operation_response.data.get('status') == 200:
        messages.add_message(request, messages.INFO, message)
        return redirect('reset_password_form')
    elif operation_response.data.get('status') == 400:
        messages.add_message(request, messages.ERROR, message)
        return redirect('reset_password_form')
    elif operation_response.data.get('status') == 403:
        messages.add_message(request, messages.ERROR, message)
        return redirect('reset_password_form')
    elif operation_response.data.get('status') == 404:
        messages.add_message(request, messages.ERROR, message)
        return redirect('reset_password_form')
    else:
        email = operation_response.data.get('email')
        request.session['temp_verify_email'] = email
        messages.add_message(request, messages.ERROR, message)
        return redirect('reset_password_form')


def change_email_form(request):
    return render(request, 'authentication/otp/resetpassword/templates/change_email.html')


def change_email_method(request):
    user_id = request.session['user_id']
    operation_response = change_email(request, user_id)
    message = operation_response.data.get('message')
    if operation_response.data.get('status') == 200:
        messages.add_message(request, messages.INFO, message)
        return redirect('change_email_form')
    elif operation_response.data.get('status') == 400:
        messages.add_message(request, messages.ERROR, message)
        return redirect('change_email_form')
    elif operation_response.data.get('status') == 403:
        messages.add_message(request, messages.ERROR, message)
        return redirect('change_email_form')
    elif operation_response.data.get('status') == 404:
        messages.add_message(request, messages.ERROR, message)
        return redirect('change_email_form')
    else:
        request.session['user_id'] = user_id
        messages.add_message(request, messages.ERROR, message)
        return redirect('change_email_form')
