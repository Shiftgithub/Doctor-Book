from .views import resend_otp
from django.contrib import messages
from django.shortcuts import redirect


def resend_otp_method(request):
    operation_response = resend_otp(request)
    message = operation_response.data.get('message')
    if operation_response.data.get('status') == 200:
        messages.add_message(request, messages.INFO, message)
        return redirect('otp_form')
<<<<<<< HEAD
=======
    elif operation_response.data.get('status') == 400:
        messages.add_message(request, messages.INFO, message)
        return redirect('login')
>>>>>>> 0a0d8f532772ef8919a2217788d4c6179800016c
    elif operation_response.data.get('status') == 401:
        messages.add_message(request, messages.INFO, message)
        return redirect('login')
    elif operation_response.data.get('status') == 403:
        messages.add_message(request, messages.INFO, message)
        return redirect('login')
    else:
        messages.add_message(request, messages.ERROR, message)
        return redirect('login')
