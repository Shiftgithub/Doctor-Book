from .views import *
from django.contrib import messages
from django.shortcuts import render, redirect


# Body part

def body_part_form(request):
    return render(request, 'bodypart/templates/form.html')


def store_body_part(request):
    operation_response = store_body_part_data(request)
    message = operation_response.data.get('message')
    if operation_response.data.get('status') == 200:
        messages.add_message(request, messages.INFO, message)
    elif operation_response.data.get('status') == 400:
        messages.add_message(request, messages.ERROR, message)
    elif operation_response.data.get('status') == 403:
        messages.add_message(request, messages.ERROR, message)
    else:
        messages.add_message(request, messages.ERROR, message)
    return redirect('body_part_form')


def body_part_data_view(request):
    response = get_all_body_part_list(request)
    return render(request, 'bodypart/templates/list_all.html', {'all_data': response.data})


def edit_body_part_form(request, body_part_id):
    response_body_part = get_body_part_data(request, body_part_id)
    body_part_data = response_body_part.data
    return render(request, 'bodypart/templates/edit.html', {'body_part_data': body_part_data})


def edit_body_part(request, body_part_id):
    operation_response = edit_body_part_data(request, body_part_id)
    message = operation_response.data.get('message')
    if operation_response.data.get('status') == 200:
        messages.add_message(request, messages.INFO, message)
    elif operation_response.data.get('status') == 400:
        messages.add_message(request, messages.ERROR, message)
    elif operation_response.data.get('status') == 403:
        messages.add_message(request, messages.ERROR, message)
    else:
        messages.add_message(request, messages.ERROR, message)
    return redirect('edit_body_part_form', body_part_id=body_part_id)


def delete_body_part(request, body_part_id):
    operation_response = delete_body_part_data(request, body_part_id)
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
    return redirect('body_part_list')
