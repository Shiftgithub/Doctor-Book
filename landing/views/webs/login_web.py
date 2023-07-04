from django.contrib import messages
from landing.views.apis.login_views import *
from django.shortcuts import render, redirect


def login(request):
    return render(request, 'landing/pages/login.html')


def check_login_is_valid(request):
    operation_response = checking_authorization(request)
    if operation_response.data.get('status') == 200:
        messages.add_message(request, messages.INFO, "Login successfully")

        # if request.session['user_role'] == ROLE_DOCTOR:
        #     return redirect('doctor_dashboard')
        # elif request.session['user_role'] == ROLE_PATIENT:
        #     return redirect('patient_dashboard')
        # else:
        #     return redirect('admin_dashboard')
        return redirect('admin_dashboard')
    else:
        messages.add_message(request, messages.ERROR, "Authentication failed! Please try again")
        return redirect('login')