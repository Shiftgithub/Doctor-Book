from . import views
from .models import *
from datetime import datetime
from django.contrib import messages
from django.shortcuts import render, redirect


# Dashboard
def dashboard(request):
    messages.add_message(request, messages.INFO, "Welcome to the dashboard")
    return render(request, 'admin/dashboard.html')


# Body part

def bodypart_form(request):
    return render(request, 'admin/body_part/form.html')


def store_bodypart(request):
    operation_response = views.store_bodypart_data(request)
    if operation_response.status_code == 200:
        messages.add_message(request, messages.INFO,
                             "Body Part data stored successfully")
    else:
        messages.add_message(request, messages.ERROR,
                             "Error in storing Body Part data")

    return redirect('add_bodypart_form')


def bodypart_data_view(request):
    # Call the get_all_bodypart_list API view to retrieve all body parts
    response = views.get_all_bodypart_list(request)
    # Retrieve the serialized data from the response
    all_data = response.data
    # Render the data in the 'admin/body_part/list_all.html' template
    return render(request, 'admin/body_part/list_all.html', {'all_data': all_data})


def edit_bodypart_form(request, bodypart_id):
    response_bodypart = views.bodypart_dataview(request, bodypart_id)
    bodypart_data = response_bodypart.data
    if bodypart_data.get('id'):  # Check if id exists in bodypart_data
        return render(request, 'admin/body_part/edit.html', {'bodypart_data': bodypart_data})
    else:
        return redirect('error_page')  # Redirect to the error page


def edit_bodypart(request, bodypart_id):
    operation_response = views.edit_bodypart_data(request, bodypart_id)

    if operation_response.status_code == 200:
        messages.add_message(request, messages.INFO, "Body Part data edited successfully")
    else:
        messages.add_message(request, messages.ERROR, "Error editing Body Part data")

    return redirect('edit_bodypart_form', bodypart_id=bodypart_id)


def view_bodypart(request, bodypart_id):
    response_bodypart = views.bodypart_dataview(request, bodypart_id)
    bodypart_data = response_bodypart.data
    return render(request, 'admin/body_part/view.html', {'bodypart_data': bodypart_data})


def delete_bodypart(request, bodypart_id):
    operation_response = views.softdelete_bodypart_data(request, bodypart_id)

    if operation_response.status_code == 200:
        messages.add_message(request, messages.INFO, "Body Part data deleted successfully")
    else:
        messages.add_message(request, messages.ERROR, "Error deleting Body Part data")

    return redirect('bodypart_list')


# Organ


def organ_form(request):
    response_bodypart = views.get_all_bodypart_list(request)
    bodypart_data = response_bodypart.data
    return render(request, 'admin/organ/form.html', {'bodypart_data': bodypart_data})


def store_organ(request):
    operation_response = views.store_organ_data(request)
    if operation_response.status_code == 200:
        messages.add_message(request, messages.INFO,
                             "Organ data stored successfully")
    else:
        messages.add_message(request, messages.ERROR,
                             "Error in storing Organ data")

    return redirect('add_organ_form')


def organ_dataview(request):
    response = views.get_all_organs_list(request)
    all_data = response.data
    return render(request, 'admin/organ/list_all.html', {'all_data': all_data})


def edit_organ_form(request, organ_id):
    response_bodypart = views.get_all_bodypart_list(request)
    bodypart_data = response_bodypart.data

    response_organ = views.organ_dataview(request, organ_id)
    organ_data = response_organ.data
    return render(request, 'admin/organ/edit.html', {'bodypart_data': bodypart_data, 'organ_data': organ_data})


def edit_organ(request, organ_id):
    operation_response = views.edit_organ_data(request, organ_id)

    if operation_response.status_code == 200:
        messages.add_message(request, messages.INFO, "Organ data edited successfully")
    else:
        messages.add_message(request, messages.ERROR, "Error editing organ data")

    return redirect('edit_organ_form', organ_id=organ_id)


def view_organ(request, organ_id):
    response_organ = views.organ_dataview(request, organ_id)
    organ_data = response_organ.data
    return render(request, 'admin/organ/view.html', {'organ_data': organ_data})


def delete_organ(request, organ_id):
    operation_response = views.softdelete_organ_data(request, organ_id)

    if operation_response.status_code == 200:
        messages.add_message(request, messages.INFO, "Organ data deleted successfully")
    else:
        messages.add_message(request, messages.ERROR, "Error deleting Organ data")

    return redirect('organ_list')


# Organ Problem


def organ_problem_form(request):
    response_organ = views.get_all_organs_list(request)
    organ_data = response_organ.data
    return render(request, 'admin/organ_problem/form.html', {'organ_data': organ_data})


def store_organ_problem(request):
    operation_response = views.store_organ_problem_data(request)
    if operation_response.status_code == 200:
        messages.add_message(request, messages.INFO,
                             "Organ Problem data stored successfully")
    else:
        messages.add_message(request, messages.ERROR,
                             "Error in storing Organ Problem data")
    return redirect('add_organ_problem_form')


def organ_problem_dataview(request):
    response = views.get_all_organ_problem_list(request)
    all_data = response.data
    return render(request, 'admin/organ_problem/list_all.html', {'all_data': all_data})


def edit_organ_problem_form(request, organ_problem_id):
    response_organ = views.get_all_organs_list(request)
    organ_data = response_organ.data

    response_organ_problem = views.organ_problem_dataview(request, organ_problem_id)
    organ_problem_data = response_organ_problem.data
    return render(request, 'admin/organ_problem/edit.html',
                  {'organ_data': organ_data, 'organ_problem_data': organ_problem_data})


def edit_organ_problem(request, organ_problem_id):
    operation_response = views.edit_organ_problem_data(request, organ_problem_id)

    if operation_response.status_code == 200:
        messages.add_message(request, messages.INFO, "Organ Problem data edited successfully")
    else:
        messages.add_message(request, messages.ERROR, "Error editing organ problem data")

    return redirect('edit_organ_problem_form', organ_problem_id=organ_problem_id)


def view_organ_problem(request, organ_problem_id):
    response_organ = views.organ_problem_dataview(request, organ_problem_id)
    organ_problem_data = response_organ.data
    return render(request, 'admin/organ_problem/view.html', {'organ_problem_data': organ_problem_data})


def delete_organ_problem(request, organ_problem_id):
    operation_response = views.softdelete_organ_problem_data(request, organ_problem_id)

    if operation_response.status_code == 200:
        messages.add_message(request, messages.INFO, "Organ Problem data deleted successfully")
    else:
        messages.add_message(request, messages.ERROR, "Error deleting Organ Problem data")

    return redirect('organ_problem_list')


# Problem Specification


def problem_specification_form(request):
    response = views.get_all_organ_problem_list(request)
    organ_problem_data = response.data
    return render(request, 'admin/problem_specification/form.html', {'organ_problem_data': organ_problem_data})


def store_problem_specification(request):
    operation_response = views.store_problem_specification_data(request)
    if operation_response.status_code == 200:
        messages.add_message(request, messages.INFO,
                             "Problem Specification data stored successfully")
    else:
        messages.add_message(request, messages.ERROR,
                             "Error in storing Problem Specification data")
    return redirect('add_problem_specification_form')


def problem_specification_dataview(request):
    response = views.get_all_problem_specification_list(request)
    all_data = response.data
    return render(request, 'admin/problem_specification/list_all.html', {'all_data': all_data})


def edit_problem_specification_form(request, problem_specification_id):
    response = views.get_all_organ_problem_list(request)
    organ_problem_data = response.data

    response_problem_specification_ = views.problem_specification_dataview(request, problem_specification_id)
    problem_specification_data = response_problem_specification_.data
    return render(request, 'admin/problem_specification/edit.html',
                  {'organ_problem_data': organ_problem_data, 'problem_specification_data': problem_specification_data})


def edit_problem_specification(request, problem_specification_id):
    operation_response = views.edit_problem_specification_data(request, problem_specification_id)

    if operation_response.status_code == 200:
        messages.add_message(request, messages.INFO, "problem specification data edited successfully")
    else:
        messages.add_message(request, messages.ERROR, "Error editing problem specification data")

    return redirect('edit_problem_specification_form', problem_specification_id=problem_specification_id)


def view_problem_specification(request, problem_specification_id):
    response_problem_specification = views.problem_specification_dataview(request, problem_specification_id)
    problem_specification_data = response_problem_specification.data
    return render(request, 'admin/problem_specification/view.html',
                  {'problem_specification_data': problem_specification_data})


def delete_problem_specification(request, problem_specification_id):
    operation_response = views.softdelete_problem_specification_data(request, problem_specification_id)

    if operation_response.status_code == 200:
        messages.add_message(request, messages.INFO, "problem specification data deleted successfully")
    else:
        messages.add_message(request, messages.ERROR, "Error deleting problem specification data")

    return redirect('problem_specification_list')


# department


def department_form(request):
    return render(request, 'admin/department/form.html')


def store_department(request):
    operation_response = views.store_department_data(request)
    if operation_response.status_code == 200:
        messages.add_message(request, messages.INFO,
                             "Department data stored successfully")
    else:
        messages.add_message(request, messages.ERROR,
                             "Error in storing Department data")
    return redirect('add_department_form')


def department_dataview(request):
    response = views.get_all_departments_list(request)
    all_data = response.data
    return render(request, 'admin/department/list_all.html', {'all_data': all_data})


def edit_department_form(request, department_id):
    response_department = views.department_dataview(request, department_id)
    department_data = response_department.data
    return render(request, 'admin/department/edit.html', {'department_data': department_data})


def edit_department(request, department_id):
    operation_response = views.edit_department_data(request, department_id)

    if operation_response.status_code == 200:
        messages.add_message(request, messages.INFO, "department data edited successfully")
    else:
        messages.add_message(request, messages.ERROR, "Error editing department data")

    return redirect('edit_department_form', department_id=department_id)


def view_department(request, department_id):
    response_department = views.department_dataview(request, department_id)
    department_data = response_department.data
    return render(request, 'admin/department/view.html', {'department_data': department_data})


def delete_department(request, department_id):
    operation_response = views.softdelete_department_data(request, department_id)

    if operation_response.status_code == 200:
        messages.add_message(request, messages.INFO, "department data deleted successfully")
    else:
        messages.add_message(request, messages.ERROR, "Error deleting department data")

    return redirect('department_list')


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
    if operation_response.status_code == 200:
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

    if operation_response.status_code == 200:
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

    if operation_response.status_code == 200:
        messages.add_message(request, messages.INFO, "department specification data deleted successfully")
    else:
        messages.add_message(request, messages.ERROR, "Error deleting problem department data")

    return redirect('department_specification_list')


# Frequently Asked Questions

def faq_form(request):
    return render(request, 'admin/faq/form.html')


def store_faq(request):
    operation_response = views.store_faq_data(request)
    if operation_response.status_code == 200:
        messages.add_message(request, messages.INFO,
                             "FAQ data stored successfully")
    else:
        messages.add_message(request, messages.ERROR,
                             "Error in storing FAQ data")

    return redirect('add_faq_form')


def faq_dataview(request):
    response = views.get_all_faq_list(request)
    all_data = response.data
    return render(request, 'admin/faq/list_all.html', {'all_data': all_data})


def edit_faq_form(request, faq_id):
    response_faq = views.faq_dataview(request, faq_id)
    faq_data = response_faq.data
    return render(request, 'admin/faq/edit.html', {'faq_data': faq_data})


def edit_faq(request, faq_id):
    operation_response = views.edit_faq_data(request, faq_id)

    if operation_response.status_code == 200:
        messages.add_message(request, messages.INFO, "faq data edited successfully")
    else:
        messages.add_message(request, messages.ERROR, "Error editing faq data")

    return redirect('edit_faq_form', faq_id=faq_id)


def view_faq(request, faq_id):
    response_faq = views.faq_dataview(request, faq_id)
    faq_data = response_faq.data
    return render(request, 'admin/faq/view.html', {'faq_data': faq_data})


def delete_faq(request, faq_id):
    operation_response = views.softdelete_faq_data(request, faq_id)

    if operation_response.status_code == 200:
        messages.add_message(request, messages.INFO, "faq data deleted successfully")
    else:
        messages.add_message(request, messages.ERROR, "Error deleting faq data")

    return redirect('faq_list')


# Article

def article_form(request):
    return render(request, 'admin/article/form.html')


def store_article(request):
    operation_response = views.store_article_data(request)
    if operation_response.status_code == 200:
        messages.add_message(request, messages.INFO,
                             "Article data stored successfully")
    else:
        messages.add_message(request, messages.ERROR,
                             "Error in storing Article data")

    return redirect('add_article_form')


def article_dataview(request):
    response = views.get_all_article_list(request)
    all_data = response.data
    return render(request, 'admin/article/list_all.html', {'all_data': all_data})
