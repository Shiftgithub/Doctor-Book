import myadmin
from . import views
from django.contrib import messages
from django.shortcuts import render, redirect


# Doctor

def doctor_form(request):
    response_department = myadmin.views.get_all_departments_list(request)
    department_data = response_department.data
    return render(request, 'admin/doctor/form.html', {'department_data': department_data})


def store_doctor(request):
    operation_response = views.store_doctor_data(request)
    if operation_response.status_code == 200:
        messages.add_message(request, messages.INFO, "Doctor data stored successfully")
    else:
        messages.add_message(request, messages.ERROR, "Error in storing Doctor data")

    return redirect('add_doctor_form')


def doctor_dataview(request):
    response = views.get_all_doctors_list(request)
    all_data = response.data
    return render(request, 'admin/doctor/list_all.html', {'all_data': all_data})
