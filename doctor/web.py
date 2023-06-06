from django.shortcuts import render
from . import views
from django.contrib import messages


# Doctor

def doctor_form(request):
    return render(request, 'admin/doctor/form.html')


def store_doctor(request):
    operation_response = views.store_doctor_data(request)
    if operation_response.status_code == 200:
        messages.add_message(request, messages.INFO, "Doctor data stored successfully")
    else:
        messages.add_message(request, messages.ERROR, "Error in storing Doctor data")

    return render(request, 'admin/doctor/form.html')


def doctor_dataview(request):
    response = views.get_all_doctors_list(request)
    all_data = response.data
    return render(request, 'admin/doctor/list_all.html',{'all_data':all_data})


# doctor registration form

def doctor_register(request):
    return render(request, 'form/register_form.html')




