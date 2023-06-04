from django.shortcuts import render
from django.contrib import messages
from . import views


# Dashboard
def dashboard(request):
    messages.add_message(request, messages.INFO, "Welcome to the dashboard")
    return render(request, 'admin/dashboard.html')


# Body part

def bodypart_form(request):
    return render(request, 'admin/body_part/form.html')


def store_bodypart(request):
    operation_response = views.store_bodypart_data(request)
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
    operation_response = views.store_organ_data(request)
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
    operation_response = views.store_organ_problem_data(request)
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
    operation_response = views.store_problem_specification_data(request)
    if operation_response.status_code == 200:
        messages.add_message(request, messages.INFO,
                             "Problem Specification data stored successfully")
    else:
        messages.add_message(request, messages.ERROR,
                             "Error in storing Problem Specification data")

    return render(request, 'admin/problem_specification/form.html')


def problem_specification_dataview(request):
    return render(request, 'admin/problem_specification/list_all.html')


# department


def department_form(request):
    return render(request, 'admin/department/form.html')


def store_department(request):
    operation_response = views.store_department_data(request)
    if operation_response.status_code == 200:
        messages.add_message(request, messages.INFO,
                             "Department data stored successfully")
    else:
        messages.add_message(request, messages.ERROR,
                             "Error in storing Department data")

    return render(request, 'admin/department/form.html')


def department_dataview(request):
    return render(request, 'admin/department/list_all.html')


# Department Specification

def department_specification_form(request):
    return render(request, 'admin/department_specification/form.html')


def store_department_specification(request):
    operation_response = views.store_department_specification_data(request)
    if operation_response.status_code == 200:
        messages.add_message(request, messages.INFO,
                             "Department Specification data stored successfully")
    else:
        messages.add_message(request, messages.ERROR,
                             "Error in storing Department Specification data")

    return render(request, 'admin/department_specification/form.html')


def department_specification_dataview(request):
    return render(request, 'admin/department_specification/list_all.html')
