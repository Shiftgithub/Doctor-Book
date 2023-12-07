from .views import *
from django.contrib import messages
from django.shortcuts import render, redirect


# Body part

def lab_test_form(request):
    return render(request, 'labtest/templates/form.html')


def store_lab_test(request):
    operation_response = store_lab_test_data(request)
    message = operation_response.data.get('message')
    if operation_response.data.get('status') == 200:
        messages.add_message(request, messages.INFO, message)
    elif operation_response.data.get('status') == 400:
        messages.add_message(request, messages.ERROR, message)
    elif operation_response.data.get('status') == 403:
        messages.add_message(request, messages.ERROR, message)
    else:
        messages.add_message(request, messages.ERROR, message)
    return redirect('lab_test_form')


def lab_test_data_view(request):
    response = get_all_lab_test_list(request)
    return render(request, 'labtest/templates/list_all.html', {'all_data': response.data})


def edit_lab_test_form(request, lab_test_id):
    response_lab_test = get_lab_test_data(request, lab_test_id)
    lab_test_data = response_lab_test.data
    return render(request, 'labtest/templates/edit.html', {'lab_test_data': lab_test_data})


def edit_lab_test(request, lab_test_id):
    operation_response = edit_lab_test_data(request, lab_test_id)
    message = operation_response.data.get('message')
    if operation_response.data.get('status') == 200:
        messages.add_message(request, messages.INFO, message)
    elif operation_response.data.get('status') == 400:
        messages.add_message(request, messages.ERROR, message)
    elif operation_response.data.get('status') == 403:
        messages.add_message(request, messages.ERROR, message)
    else:
        messages.add_message(request, messages.ERROR, message)
    return redirect('edit_lab_test_form', lab_test_id=lab_test_id)


def delete_lab_test(request, lab_test_id):
    operation_response = delete_lab_test_data(request, lab_test_id)
    message = operation_response.data.get('message')
    print(message)
    if operation_response.data.get('status') == 200:
        messages.add_message(request, messages.INFO, message)
    elif operation_response.data.get('status') == 400:
        messages.add_message(request, messages.ERROR, message)
    elif operation_response.data.get('status') == 403:
        messages.add_message(request, messages.ERROR, message)
    elif operation_response.data.get('status') == 404:
        messages.add_message(request, messages.ERROR, message)
    else:
        messages.add_message(request, messages.ERROR, message)
    return redirect('lab_test_list')
