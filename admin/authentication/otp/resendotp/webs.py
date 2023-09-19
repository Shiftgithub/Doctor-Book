from .views import resend_otp
from django.contrib import messages
from django.shortcuts import redirect


def resend_otp_method(request):
    email = request.session['temp_verify_email']
    operation_response = resend_otp(request)
    if operation_response.data.get('status') == 200:
        messages.add_message(request, messages.INFO, 'we send a mail please check your email.')
        return redirect('otp_form')
    elif operation_response.data.get('status') == 403:
        return redirect('login')
    else:
        messages.add_message(request, messages.ERROR, '403')
        return redirect('login')
