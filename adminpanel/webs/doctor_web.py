from adminpanel.views.doctor_views import *
from adminpanel.views.department_views import *
from django.contrib import messages
from django.shortcuts import render, redirect


# Doctor

def doctor_form(request):
    response_gender = gender_list(request)
    gender_data = response_gender.data

    response_religion = religion_list(request)
    religion_data = response_religion.data

    response_blood_group = blood_group_list(request)
    blood_group_data = response_blood_group.data

    response_matrimonie = matrimonie_list(request)
    matrimonie_data = response_matrimonie.data

    response_department = get_all_departments_list(request)
    department_data = response_department.data

    return render(request, 'admin/doctor/form.html',
                  {'department_data': department_data, 'gender_data': gender_data, 'religion_data': religion_data,
                   'blood_group_data': blood_group_data, 'matrimonie_data': matrimonie_data})


def store_doctor(request):
    operation_response = store_doctor_data(request)
    if operation_response.data.get('status') == 200:
        messages.add_message(request, messages.INFO, "Doctor data stored successfully")
    else:
        messages.add_message(request, messages.ERROR, "Error in storing Doctor data")

    return redirect('add_doctor_form')


def doctor_data_view(request):
    response = get_all_doctors_list(request)
    all_data = response.data
    return render(request, 'admin/doctor/list_all.html', {'all_data': all_data})
