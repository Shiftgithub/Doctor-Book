from django.contrib import messages
from landing.views.apis.login_views import *
from django.shortcuts import render


def login(request):
    return render(request, 'landing/pages/login.html')


def check_login_is_valid(request):
    operation_response = checking_authorization(request)
    if operation_response.data.get('status') == 200:
        messages.add_message(request, messages.INFO, "Login successfully")
        return render(request, 'admin/dashboard.html')
    else:
        messages.add_message(request, messages.ERROR, "Error in login")
        return render(request, 'landing/pages/login.html')
