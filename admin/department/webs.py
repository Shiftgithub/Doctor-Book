from .views import *
from django.contrib import messages
from django.shortcuts import render, redirect


# department
def department_form(request):
    return render(request, 'department/templates/form.html')


def store_department(request):
    operation_response = store_department_data(request)
    message = operation_response.data.get('message')
    if operation_response.data.get('status') == 200:
        messages.add_message(request, messages.INFO, message)
    elif operation_response.data.get('status') == 400:
        messages.add_message(request, messages.ERROR, message)
    elif operation_response.data.get('status') == 403:
        messages.add_message(request, messages.ERROR, message)
    else:
        messages.add_message(request, messages.ERROR, message)
    return redirect('department_form')


def department_data_view(request):
    response = get_all_departments_list(request)
    all_data = response.data
    return render(request, 'department/templates/list_all.html', {'all_data': all_data})


def edit_department_form(request, department_id):
    response_department = department_dataview(request, department_id)
    department_data = response_department.data
    return render(request, 'department/templates/edit.html', {'department_data': department_data})


def edit_department(request, department_id):
    operation_response = edit_department_data(request, department_id)

    message = operation_response.data.get('message')
    if operation_response.data.get('status') == 200:
        messages.add_message(request, messages.INFO, message)
    elif operation_response.data.get('status') == 400:
        messages.add_message(request, messages.ERROR, message)
    elif operation_response.data.get('status') == 403:
        messages.add_message(request, messages.ERROR, message)
    else:
        messages.add_message(request, messages.ERROR, message)
    return redirect('edit_department_form', department_id=department_id)


def delete_department(request, department_id):
    operation_response = softdelete_department_data(request, department_id)
    message = operation_response.data.get('message')
    if operation_response.data.get('status') == 200:
        messages.add_message(request, messages.INFO, message)
    elif operation_response.data.get('status') == 400:
        messages.add_message(request, messages.ERROR, message)
    elif operation_response.data.get('status') == 403:
        messages.add_message(request, messages.ERROR, message)
    else:
        messages.add_message(request, messages.ERROR, message)

    return redirect('department_list')
