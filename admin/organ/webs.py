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
    if operation_response.data.get('status') == 200:
        messages.add_message(request, messages.INFO,
                             'Organ data stored successfully')
    else:
        messages.add_message(request, messages.ERROR,
                             'Error in storing Organ data')

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
    if operation_response.data.get('status') == 200:
        messages.add_message(request, messages.INFO, 'Organ data edited successfully')
    else:
        messages.add_message(request, messages.ERROR, 'Error editing organ data')
    return redirect('edit_organ_form', organ_id=organ_id)


def delete_organ(request, organ_id):
    operation_response = softdelete_organ_data(request, organ_id)

    if operation_response.data.get('status') == 200:
        messages.add_message(request, messages.INFO, 'Organ data deleted successfully')
    elif operation_response.data.get('status') == 404:
        messages.add_message(request, messages.ERROR,
                             'Organ cannot delete. because it is associated with Organ Problem table.')
    else:
        messages.add_message(request, messages.ERROR, 'Error deleting Organ data')

    return redirect('organ_list')
