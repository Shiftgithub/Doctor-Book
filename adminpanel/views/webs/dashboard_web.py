from django.contrib import messages
from django.contrib.auth.decorators import login_required
from django.shortcuts import render, redirect


# Dashboard
# @login_required
def dashboard(request):
    messages.add_message(request, messages.INFO, "Welcome to the dashboard")
    return render(request, 'admin/dashboard.html')
