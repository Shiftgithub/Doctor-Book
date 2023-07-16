from django.shortcuts import render, redirect
from django.contrib import messages
from adminpanel.views.apis.auth.forget_password_views import forget_password


def forget_password_form(request):
    return render(request, 'landing/pages/auth/forget_password.html')


def forget_password_method(request):
    operation_response = forget_password(request)
    if operation_response.data.get('status') == 200:
        email = operation_response.data.get('email')
        request.session['temp_verify_email'] = email
        messages.add_message(request, messages.INFO, "we send a mail please check your email.")
        return redirect('otp_form')
    else:
        messages.add_message(request, messages.ERROR, "email are not correct please check again")
        return redirect('forget_password_form')
