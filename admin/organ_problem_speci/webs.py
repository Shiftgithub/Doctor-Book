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
    return render(request, 'organ_problem_speci/templates/form.html', {'bodypart_data': bodypart_data})


def store_organ_problem_specification(request):
    operation_response = store_organ_problem_specification_data(request)
    if operation_response.data.get('status') == 200:
        messages.add_message(request, messages.INFO,
                             'Organ Problem data stored successfully')
    else:
        messages.add_message(request, messages.ERROR,
                             'Error in storing Organ Problem data')
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
    return render(request, 'organ_problem_speci/templates/edit.html',
                  {'organ_data': organ_data, 'organ_problem_specification_data': organ_problem_specification_data})


def edit_organ_problem_specification(request, organ_problem_specification_id):
    operation_response = edit_organ_problem_specification_data(request, organ_problem_specification_id)

    if operation_response.data.get('status') == 200:
        messages.add_message(request, messages.INFO, 'Organ Problem data edited successfully')
    else:
        messages.add_message(request, messages.ERROR, 'Error editing organ problem data')

    return redirect('edit_organ_problem_specification_form',
                    organ_problem_specification_id=organ_problem_specification_id)


def view_organ_problem_specification(request, organ_problem_specification_id):
    response_organ = organ_problem_specification_dataview(request, organ_problem_specification_id)
    organ_problem_specification_data = response_organ.data
    return render(request, 'organ_problem_speci/templates/view.html',
                  {'organ_problem_specification_data': organ_problem_specification_data})


def delete_organ_problem_specification(request, organ_problem_specification_id):
    operation_response = softdelete_organ_problem_specification_data(request, organ_problem_specification_id)

    if operation_response.data.get('status') == 200:
        messages.add_message(request, messages.INFO, 'Organ Problem data deleted successfully')
    elif operation_response.data.get('status') == 404:
        messages.add_message(request, messages.ERROR,
                             'Organ Problem cannot delete. because it is associated with Problem Specification table.')
    else:
        messages.add_message(request, messages.ERROR, 'Error deleting Organ Problem data')

    return redirect('organ_problem_specification_list')
