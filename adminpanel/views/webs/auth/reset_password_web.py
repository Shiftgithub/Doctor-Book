from django.shortcuts import render, redirect
from django.contrib import messages
from adminpanel.views.apis.auth.verify_otp_views import varify_otp


def reset_password_form(request):
    return render(request, 'landing/pages/reset_password.html')


def reset_password_method(request, email):
    operation_response = varify_otp(request)
    if operation_response.data.get('status') == 200:
        messages.add_message(request, messages.INFO, "you account password changed successfully")
        return redirect('login')
    else:
        messages.add_message(request, messages.ERROR, "Error")
        return redirect('otp')
