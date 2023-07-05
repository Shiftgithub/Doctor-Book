from django.contrib import messages
from django.shortcuts import render, redirect


# Dashboard
def dashboard(request):
    messages.add_message(request, messages.INFO, "Welcome to the dashboard")
    # return redirect('admin_dashboard')
    return render(request, 'admin/dashboard.html')


def doctor_dashboard(request):
    messages.add_message(request, messages.INFO, "Welcome to the dashboard")
    return render(request, 'doctor/dashboard/dashboard.html')


def patient_dashboard(request):
    messages.add_message(request, messages.INFO, "Welcome to the dashboard")
    return render(request, 'patient/dashboard/dashboard.html')
