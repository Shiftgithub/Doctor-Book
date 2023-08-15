import datetime
from django.contrib import messages
from django.shortcuts import render


# Dashboard
def get_time_of_day():
    current_time = datetime.datetime.now().time()
    if current_time.hour < 6:
        return "night"
    elif current_time.hour < 12:
        return "morning"
    elif current_time.hour < 18:
        return "afternoon"
    elif current_time.hour < 20:
        return "evening"
    else:
        return "night"


time_of_day = get_time_of_day()


def dashboard(request):
    if time_of_day == "morning":
        messages.add_message(request, messages.INFO, "Good morning!  Welcome to the dashboard")
    elif time_of_day == "afternoon":
        messages.add_message(request, messages.INFO, "Good afternoon!  Welcome to the dashboard")
    elif time_of_day == "evening":
        messages.add_message(request, messages.INFO, "Good evening!  Welcome to the dashboard")
    else:
        messages.add_message(request, messages.INFO, "Good night!  Welcome to the dashboard")

    return render(request, 'dashboard/templates/admin/admin_layout.html')


def doctor_dashboard(request):
    if time_of_day == "morning":
        messages.add_message(request, messages.INFO, "Good morning!  Welcome to the dashboard")
    elif time_of_day == "afternoon":
        messages.add_message(request, messages.INFO, "Good afternoon!  Welcome to the dashboard")
    elif time_of_day == "evening":
        messages.add_message(request, messages.INFO, "Good evening!  Welcome to the dashboard")
    else:
        messages.add_message(request, messages.INFO, "Good night!  Welcome to the dashboard")
    return render(request, 'dashboard/templates/doctor/dashboard.html')


def patient_dashboard(request):
    if time_of_day == "morning":
        messages.add_message(request, messages.INFO, "Good morning!  Welcome to the dashboard")
    elif time_of_day == "afternoon":
        messages.add_message(request, messages.INFO, "Good afternoon!  Welcome to the dashboard")
    elif time_of_day == "evening":
        messages.add_message(request, messages.INFO, "Good evening!  Welcome to the dashboard")
    else:
        messages.add_message(request, messages.INFO, "Good night!  Welcome to the dashboard")
    return render(request, 'dashboard/templates/patient/dashboard.html')
