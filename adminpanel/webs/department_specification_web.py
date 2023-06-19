from . import views
from .models import *
from datetime import datetime
from django.contrib import messages
from django.shortcuts import render, redirect


# Department Specification

def department_specification_form(request):
    response_department = views.get_all_departments_list(request)
    department_data = response_department.data

    specification_response = views.get_all_problem_specification_list(request)
    specification_data = specification_response.data

    return render(request, 'admin/department_specification/form.html',
                  {'department_data': department_data, 'specification_data': specification_data})


def store_department_specification(request):
    operation_response = views.store_department_specification_data(request)
    if operation_response.data.get('status') == 200:
        messages.add_message(request, messages.INFO,
                             "Department Specification data stored successfully")
    else:
        messages.add_message(request, messages.ERROR,
                             "Error in storing Department Specification data")

    return redirect('add_department_specification_form')


def department_specification_dataview(request):
    response = views.get_all_department_specifications_list(request)
    all_data = response.data
    return render(request, 'admin/department_specification/list_all.html', {'all_data': all_data})


def edit_department_specification_form(request, department_specification_id):
    response_department = views.get_all_departments_list(request)
    department_data = response_department.data

    problem_specification_response = views.get_all_problem_specification_list(request)
    problem_specification_data = problem_specification_response.data

    response_department_specification = views.department_specification_dataview(request, department_specification_id)
    department_specification_data = response_department_specification.data

    return render(request, 'admin/department_specification/edit.html',
                  {'department_data': department_data, 'problem_specification_data': problem_specification_data,
                   'department_specification_data': department_specification_data})


def edit_department_specification(request, department_specification_id):
    operation_response = views.edit_department_specification_data(request, department_specification_id)

    if operation_response.data.get('status') == 200:
        messages.add_message(request, messages.INFO, "department specification data edited successfully")
    else:
        messages.add_message(request, messages.ERROR, "Error editing department specification data")

    return redirect('edit_department_specification_form', department_specification_id=department_specification_id)


def view_department_specification(request, department_specification_id):
    response_problem_specification = views.department_specification_dataview(request, department_specification_id)
    department_specification_data = response_problem_specification.data
    return render(request, 'admin/department_specification/view.html',
                  {'department_specification_data': department_specification_data})


def delete_department_specification(request, department_specification_id):
    operation_response = views.softdelete_department_specification_data(request, department_specification_id)

    if operation_response.data.get('status') == 200:
        messages.add_message(request, messages.INFO, "department specification data deleted successfully")
    else:
        messages.add_message(request, messages.ERROR, "Error deleting problem department data")

    return redirect('department_specification_list')