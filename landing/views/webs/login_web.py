from django.contrib import messages
from landing.views.apis.login_views import *
from django.shortcuts import render, redirect


def login(request):
    return render(request, 'landing/pages/login.html')


def check_login_is_valid(request):
    operation_response = checking_authorization(request)
    if operation_response.data.get('status') == 200:
        messages.add_message(request, messages.INFO, "Login successfully")

        # Redirect to dashboard based on user role
        return redirect('admin_dashboard')

    else:
        messages.add_message(request, messages.ERROR, "Error in login")
        return redirect('login')
