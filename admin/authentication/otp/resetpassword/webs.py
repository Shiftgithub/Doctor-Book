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
    email = request.session['temp_verify_email']
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


def reset_password_form(request):
    return render(request, 'authentication/otp/resetpassword/templates/reset_password.html')


def reset_password_method(request):
    email = request.session['user_email']
    operation_response = reset_password(request, email)
    if operation_response.data.get('status') == 200:
        messages.add_message(
            request, messages.INFO, 'Your account password changed successfully'
        )
        return redirect('reset_password_form')
    else:
        email = operation_response.data.get('email')
        request.session['temp_verify_email'] = email
        messages.add_message(request, messages.ERROR, 'Incorrect Password')
        return redirect('reset_password_form')


def change_email_form(request):
    user_id = request.session['user_id']
    print(user_id)
    return render(request, 'authentication/otp/resetpassword/templates/change_email.html')


def change_email_method(request):
    user_id = request.session['user_id']
    print(user_id)
    operation_response = change_email(request, user_id)
    print(operation_response)
    if operation_response.data.get('status') == 200:
        messages.add_message(
            request, messages.INFO, 'Your email changed successfully'
        )
        return redirect('change_email_form')
    else:
        # user = operation_response.data.get('user_id')
        request.session['user_id'] = user_id
        messages.add_message(request, messages.ERROR, 'Incorrect Password')
        return redirect('change_email_form')
