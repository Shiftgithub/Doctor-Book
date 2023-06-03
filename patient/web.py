from django.shortcuts import render


# Doctor

def landing_dashboard(request):
    return render(request, 'landing/dashboard.html')


def patient_register(request):
    return render(request, 'form/register_form.html')


def patient_login(request):
    return render(request, 'form/login_form.html')
