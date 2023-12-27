from .views import *
from admin.bodypart.views import *
from django.contrib import messages
from django.shortcuts import render, redirect


# Organ
def organ_form(request):
    response_body_part = get_all_body_part_list(request)
    body_part_data = response_body_part.data
    return render(request, 'organ/templates/form.html', {'bodypart_data': body_part_data})


def store_organ(request):
    operation_response = store_organ_data(request)
    message = operation_response.data.get('message')
    if operation_response.data.get('status') == 200:
        messages.add_message(request, messages.INFO, message)
    elif operation_response.data.get('status') == 500:
        messages.add_message(request, messages.ERROR, message)
    else:
        messages.add_message(request, messages.ERROR, message)

    return redirect('add_organ_form')


def organ_data_view(request):
    response = get_all_organs_list(request)
    all_data = response.data
    return render(request, 'organ/templates/list_all.html', {'all_data': all_data})


def edit_organ_form(request, organ_id):
    response_body_part = get_all_body_part_list(request)
    body_part_data = response_body_part.data

    response_organ = organ_dataview(request, organ_id)
    organ_data = response_organ.data
    return render(request, 'organ/templates/edit.html', {'bodypart_data': body_part_data, 'organ_data': organ_data})


def edit_organ(request, organ_id):
    operation_response = edit_organ_data(request, organ_id)
    message = operation_response.data.get('message')
    if operation_response.data.get('status') == 200:
        messages.add_message(request, messages.INFO, message)
    elif operation_response.data.get('status') == 400:
        messages.add_message(request, messages.ERROR, message)
    elif operation_response.data.get('status') == 403:
        messages.add_message(request, messages.ERROR, message)
    else:
        messages.add_message(request, messages.ERROR, message)
    return redirect('edit_organ_form', organ_id=organ_id)


def delete_organ(request, organ_id):
    operation_response = softdelete_organ_data(request, organ_id)

    message = operation_response.data.get('message')
    if operation_response.data.get('status') == 200:
        messages.add_message(request, messages.INFO, message)
    elif operation_response.data.get('status') == 400:
        messages.add_message(request, messages.ERROR, message)
    elif operation_response.data.get('status') == 403:
        messages.add_message(request, messages.ERROR, message)
    else:
        messages.add_message(request, messages.ERROR, message)

    return redirect('organ_list')
