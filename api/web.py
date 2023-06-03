from django.shortcuts import render

import myadmin
from . import views

# Message for testing
from django.contrib import messages


def dashboard(request):
    messages.add_message(request, messages.INFO, "Welcome to the dashboard")
    return render(request, 'admin/dashboard.html')


# department


def department_form(request):
    return render(request, 'admin/department/form.html')


def store_department(request):
    operation_response = views.StoreDepartmentData(request)
    if operation_response.status_code == 200:
        messages.add_message(request, messages.INFO,
                             "Department data stored successfully")
    else:
        messages.add_message(request, messages.ERROR,
                             "Error in storing Department data")

    return render(request, 'admin/department/form.html')


def department_dataview(request):
    return render(request, 'admin/department/list_all.html')


# Doctor

def doctor_form(request):
    return render(request, 'admin/doctor/form.html')


def store_doctor(request):
    operation_response = views.StoreDoctorData(request)
    if operation_response.status_code == 200:
        messages.add_message(request, messages.INFO,
                             "Doctor data stored successfully")
    else:
        messages.add_message(request, messages.ERROR,
                             "Error in storing Doctor data")

    return render(request, 'admin/doctor/form.html')


def doctor_dataview(request):
    return render(request, 'admin/doctor/list_all.html')


# Body part

def bodypart_form(request):
    return render(request, 'admin/body_part/form.html')


def store_bodypart(request):
    operation_response = myadmin.views.store_bodypart_data(request)
    if operation_response.status_code == 200:
        messages.add_message(request, messages.INFO,
                             "Body Part data stored successfully")
    else:
        messages.add_message(request, messages.ERROR,
                             "Error in storing Body Part data")

    return render(request, 'admin/body_part/form.html')


def bodypart_data_view(request):
    return render(request, 'admin/body_part/list_all.html')


# Organ


def organ_form(request):
    return render(request, 'admin/organ/form.html')


def store_organ(request):
    operation_response = views.StoreOrganData(request)
    if operation_response.status_code == 200:
        messages.add_message(request, messages.INFO,
                             "Organ data stored successfully")
    else:
        messages.add_message(request, messages.ERROR,
                             "Error in storing Organ data")

    return render(request, 'admin/organ/form.html')


def organ_dataview(request):
    return render(request, 'admin/organ/list_all.html')


# Organ Problem


def organ_problem_form(request):
    return render(request, 'admin/organ_problem/form.html')


def store_organ_problem(request):
    operation_response = views.StoreOrganProblemData(request)
    if operation_response.status_code == 200:
        messages.add_message(request, messages.INFO,
                             "Organ Problem data stored successfully")
    else:
        messages.add_message(request, messages.ERROR,
                             "Error in storing Organ Problem data")

    return render(request, 'admin/organ_problem/form.html')


def organ_problem_dataview(request):
    return render(request, 'admin/organ_problem/list_all.html')


# Problem Specification


def problem_specification_form(request):
    return render(request, 'admin/problem_specification/form.html')


def store_problem_specification(request):
    operation_response = views.StoreProblemSpecificationData(request)
    if operation_response.status_code == 200:
        messages.add_message(request, messages.INFO,
                             "Problem Specification data stored successfully")
    else:
        messages.add_message(request, messages.ERROR,
                             "Error in storing Problem Specification data")

    return render(request, 'admin/problem_specification/form.html')


def problem_specification_dataview(request):
    return render(request, 'admin/problem_specification/list_all.html')


# Department Specification


def department_specification_form(request):
    return render(request, 'admin/department_specification/form.html')


def store_department_specification(request):
    operation_response = views.StoreDepartmentSpecificationData(request)
    if operation_response.status_code == 200:
        messages.add_message(request, messages.INFO,
                             "Department Specification data stored successfully")
    else:
        messages.add_message(request, messages.ERROR,
                             "Error in storing Department Specification data")

    return render(request, 'admin/department_specification/form.html')


def department_specification_dataview(request):
    return render(request, 'admin/department_specification/list_all.html')


#####################################

def get_admin_dashboard(request):
    messages.add_message(request, messages.INFO, "Welcome to the dashboard")
    return render(request, 'admin/dashboard.html')


def get_admin_form(request):
    return render(request, 'admin/form.html')


def index(request):
    return render(request, 'landing/index.html')


# def register(request):
#     return render(request, 'landing/register.html')


#####################################

# doctor registration form

def doctor_register(request):
    return render(request, 'form/register_form.html')


def doctor_login(request):
    return render(request, 'form/login_form.html')


def patient_register(request):
    return render(request, 'form/register_form.html')


def patient_login(request):
    return render(request, 'form/login_form.html')
