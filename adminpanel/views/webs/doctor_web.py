from adminpanel.views.apis.doctor_views import *
from adminpanel.views.apis.department_views import *
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

    response_matrimony = matrimony_list(request)
    matrimony_data = response_matrimony.data

    response_department = get_all_departments_list(request)
    department_data = response_department.data

    response_division = division_list(request)
    division_data = response_division.data

    return render(request, 'admin/doctor/form.html',
                  {'department_data': department_data, 'gender_data': gender_data, 'religion_data': religion_data,
                   'blood_group_data': blood_group_data, 'matrimony_data': matrimony_data,
                   'division_data': division_data})


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
    print('pr', all_data)
    return render(request, 'admin/doctor/list_all.html', {'all_data': all_data})


def doctor_work_details_form(request):
    response_doctor = get_all_doctors_name(request)
    doctor_data = response_doctor.data
    return render(request, 'admin/doctor/work_form.html', {'doctor_data': doctor_data})


def store_doctor_work_details(request):
    operation_response = store_doctor_work_details_data(request)
    if operation_response.data.get('status') == 200:
        messages.add_message(request, messages.INFO, "Doctor Work Details data stored successfully")
    else:
        messages.add_message(request, messages.ERROR, "Error in storing Doctor Work Details  data")

    return redirect('add_doctor_work_details_form')
