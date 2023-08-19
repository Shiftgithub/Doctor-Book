from django.contrib import messages
from adminpanel.department.views import *
from adminpanel.department_speci.views import *
from adminpanel.organ_problem_speci.views import *
from django.shortcuts import render, redirect


# Department Specification
def department_specification_form(request):
    response_department = get_all_departments_list(request)
    department_data = response_department.data

    problem_response = get_all_organ_problem_specification_list(request)
    problem_data = problem_response.data
    return render(request, 'department_speci/templates/form.html',
                  {'department_data': department_data, 'problem_data': problem_data})


def store_department_specification(request):
    operation_response = store_department_specification_data(request)
    if operation_response.data.get('status') == 200:
        messages.add_message(request, messages.INFO,
                             "Department Specification data stored successfully")
    else:
        messages.add_message(request, messages.ERROR,
                             "Error in storing Department Specification data")

    return redirect('add_department_specification_form')


def department_specification_data_view(request):
    response = get_all_department_specifications_list(request)
    all_data = response.data
    return render(request, 'department_speci/templates//list_all.html', {'all_data': all_data})


def edit_department_specification_form(request, department_specification_id):
    response_department = get_all_departments_list(request)
    department_data = response_department.data

    problem_response = get_all_organ_problem_specification_list(request)
    problem_data = problem_response.data

    response_department_specification = department_specification_dataview(request, department_specification_id)
    department_specification_data = response_department_specification.data

    return render(request, 'department_speci/templates//edit.html',
                  {'department_data': department_data, 'problem_data': problem_data,
                   'department_specification_data': department_specification_data})


def edit_department_specification(request, department_specification_id):
    operation_response = edit_department_specification_data(request, department_specification_id)

    if operation_response.data.get('status') == 200:
        messages.add_message(request, messages.INFO, "department specification data edited successfully")
    else:
        messages.add_message(request, messages.ERROR, "Error editing department specification data")

    return redirect('edit_department_specification_form', department_specification_id=department_specification_id)


def view_department_specification(request, department_specification_id):
    response_problem_specification = department_specification_dataview(request, department_specification_id)
    department_specification_data = response_problem_specification.data
    print(department_specification_data)
    return render(request, 'department_speci/templates/view.html',
                  {'department_specification_data': department_specification_data})


def delete_department_specification(request, department_specification_id):
    operation_response = softdelete_department_specification_data(request, department_specification_id)

    if operation_response.data.get('status') == 200:
        messages.add_message(request, messages.INFO, "department specification data deleted successfully")
    else:
        messages.add_message(request, messages.ERROR, "Error deleting problem department data")

    return redirect('department_specification_list')
