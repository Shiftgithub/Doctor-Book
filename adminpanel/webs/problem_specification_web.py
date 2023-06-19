from adminpanel.views.problem_specification_views import *
from adminpanel.views.bodypart_views import *
from adminpanel.views.organ_views import *
from adminpanel.views.organ_problem_views import *
from adminpanel.models.problem_specification_models import *
from datetime import datetime
from django.contrib import messages
from django.shortcuts import render, redirect


# Problem Specification
def problem_specification_form(request):
    response_bodypart = get_all_bodypart_list(request)
    bodypart_data = response_bodypart.data

    response = get_all_organ_problem_list(request)
    organ_problem_data = response.data
    return render(request, 'admin/problem_specification/form.html', {'bodypart_data': bodypart_data})


def store_problem_specification(request):
    operation_response = store_problem_specification_data(request)
    if operation_response.data.get('status') == 200:
        messages.add_message(request, messages.INFO,
                             "Problem Specification data stored successfully")
    else:
        messages.add_message(request, messages.ERROR,
                             "Error in storing Problem Specification data")
    return redirect('add_problem_specification_form')


def problem_specification_data_view(request):
    response = get_all_problem_specification_list(request)
    all_data = response.data
    return render(request, 'admin/problem_specification/list_all.html', {'all_data': all_data})


def edit_problem_specification_form(request, problem_specification_id):
    response = get_all_organ_problem_list(request)
    organ_problem_data = response.data

    response_problem_specification_ = problem_specification_dataview(request, problem_specification_id)
    problem_specification_data = response_problem_specification_.data
    return render(request, 'admin/problem_specification/edit.html',
                  {'organ_problem_data': organ_problem_data, 'problem_specification_data': problem_specification_data})


def edit_problem_specification(request, problem_specification_id):
    operation_response = edit_problem_specification_data(request, problem_specification_id)

    if operation_response.data.get('status') == 200:
        messages.add_message(request, messages.INFO, "Problem Specification data edited successfully")
    elif operation_response.data.get('status') == 404:
        messages.add_message(request, messages.ERROR,
                             "Problem Specification cannot delete."
                             "because it is associated with Department Specification table.")
    else:
        messages.add_message(request, messages.ERROR, "Error editing Problem Specification data")

    return redirect('edit_problem_specification_form', problem_specification_id=problem_specification_id)


def view_problem_specification(request, problem_specification_id):
    response_problem_specification = problem_specification_dataview(request, problem_specification_id)
    problem_specification_data = response_problem_specification.data
    return render(request, 'admin/problem_specification/view.html',
                  {'problem_specification_data': problem_specification_data})


def delete_problem_specification(request, problem_specification_id):
    operation_response = softdelete_problem_specification_data(request, problem_specification_id)

    if operation_response.data.get('status') == 200:
        messages.add_message(request, messages.INFO, "problem specification data deleted successfully")
    else:
        messages.add_message(request, messages.ERROR, "Error deleting problem specification data")

    return redirect('problem_specification_list')
