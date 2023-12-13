from .views import *
from admin.organ.views import *
from admin.bodypart.views import *
from django.contrib import messages
from django.shortcuts import render, redirect


# Organ Problem
def organ_problem_specification_form(request):
    response_bodypart = get_all_body_part_list(request)
    bodypart_data = response_bodypart.data

    response_organ = get_all_organs_list(request)
    organ_data = response_organ.data
    data = {'bodypart_data': bodypart_data, 'organ_data': organ_data}
    return render(request, 'organ_problem_speci/templates/form.html', data)


def store_organ_problem_specification(request):
    operation_response = store_organ_problem_specification_data(request)
    message = operation_response.data.get('message')
    if operation_response.data.get('status') == 200:
        messages.add_message(request, messages.INFO, message)
    elif operation_response.data.get('status') == 500:
        messages.add_message(request, messages.ERROR, message)
    else:
        messages.add_message(request, messages.ERROR, message)
    return redirect('add_organ_problem_specification_form')


def organ_problem_specification_data_view(request):
    response = get_all_organ_problem_specification_list(request)
    all_data = response.data
    return render(request, 'organ_problem_speci/templates/list_all.html', {'all_data': all_data})


def edit_organ_problem_specification_form(request, organ_problem_specification_id):
    response_organ = get_all_organs_list(request)
    organ_data = response_organ.data

    response_organ_problem_specification = organ_problem_specification_dataview(request, organ_problem_specification_id)
    organ_problem_specification_data = response_organ_problem_specification.data
    data = {'organ_data': organ_data, 'organ_problem_specification_data': organ_problem_specification_data}
    return render(request, 'organ_problem_speci/templates/edit.html', data)


def edit_organ_problem_specification(request, organ_problem_specification_id):
    operation_response = edit_organ_problem_specification_data(request, organ_problem_specification_id)

    message = operation_response.data.get('message')
    if operation_response.data.get('status') == 200:
        messages.add_message(request, messages.INFO, message)
    elif operation_response.data.get('status') == 400:
        messages.add_message(request, messages.ERROR, message)
    elif operation_response.data.get('status') == 403:
        messages.add_message(request, messages.ERROR, message)
    else:
        messages.add_message(request, messages.ERROR, message)

    return redirect('edit_organ_problem_specification_form',
                    organ_problem_specification_id=organ_problem_specification_id)


def view_organ_problem_specification(request, organ_problem_specification_id):
    response_organ = organ_problem_specification_dataview(request, organ_problem_specification_id)
    organ_problem_specification_data = response_organ.data
    data = {'organ_problem_specification_data': organ_problem_specification_data}
    return render(request, 'organ_problem_speci/templates/view.html', data)


def delete_organ_problem_specification(request, organ_problem_specification_id):
    operation_response = softdelete_organ_problem_specification_data(request, organ_problem_specification_id)

    message = operation_response.data.get('message')
    if operation_response.data.get('status') == 200:
        messages.add_message(request, messages.INFO, message)
    elif operation_response.data.get('status') == 400:
        messages.add_message(request, messages.ERROR, message)
    elif operation_response.data.get('status') == 403:
        messages.add_message(request, messages.ERROR, message)
    else:
        messages.add_message(request, messages.ERROR, message)

    return redirect('organ_problem_specification_list')
