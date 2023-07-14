from django.shortcuts import render, redirect
from django.contrib import messages
from adminpanel.views.apis.auth.resend_otp import resend_otp


def forget_password_form(request):
    return render(request, 'landing/pages/forget_password.html')


def resend_otp_method(request, email):
    operation_response = resend_otp(request, email)
    if operation_response.data.get('status') == 200:
        messages.add_message(request, messages.INFO, "we send a mail please check your email.")
        return render(request, 'landing/pages/otp_form.html', {'email': email})
    else:
        messages.add_message(request, messages.ERROR, "email are not correct please check again")
        return redirect('login')
