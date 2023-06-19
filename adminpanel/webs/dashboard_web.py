from django.contrib import messages
from django.shortcuts import render, redirect


# Dashboard
def dashboard(request):
    messages.add_message(request, messages.INFO, "Welcome to the dashboard")
    return render(request, 'admin/dashboard.html')
