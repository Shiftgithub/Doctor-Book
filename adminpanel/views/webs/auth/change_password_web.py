from django.shortcuts import render, redirect
from django.contrib import messages
from adminpanel.views.apis.auth.change_password_views import change_password


def change_password_form(request):
    return render(request, 'landing/pages/auth/change_password.html')


def change_password_method(request):
    operation_response = change_password(request)
    if operation_response.data.get('status') == 200:
        messages.add_message(request, messages.INFO, "you account password changed successfully")
        return redirect('login')
    else:
        email = operation_response.data.get('email')
        request.session['temp_verify_email'] = email
        messages.add_message(request, messages.ERROR, "Error")
        return redirect('forget_password_form')
