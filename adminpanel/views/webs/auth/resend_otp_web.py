from django.shortcuts import render, redirect
from django.contrib import messages
from adminpanel.views.apis.auth.resend_otp_views import resend_otp


def resend_otp_method(request):
    operation_response = resend_otp(request)
    if operation_response.data.get('status') == 200:
        email = operation_response.data.get('email')
        request.session['temp_verify_email'] = email
        messages.add_message(request, messages.INFO, "we send a mail please check your email.")
        return redirect('otp_form')
    else:
        messages.add_message(request, messages.ERROR, "email are not correct please check again")
        return redirect('login')
