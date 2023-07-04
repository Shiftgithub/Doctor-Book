from django.contrib import messages
from django.shortcuts import render, redirect
from django.contrib.auth.decorators import login_required


# Dashboard
# @login_required(login_url='login')
def dashboard(request):
    messages.add_message(request, messages.INFO, "Welcome to the dashboard")
    # return redirect('admin_dashboard')
    return render(request, 'admin/dashboard.html')
