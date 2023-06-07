from django.shortcuts import render,redirect
from django.contrib import messages
from datetime import datetime
from . import views
from .models import *


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

    return render(request, 'admin/body_part/form.html')

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
    operation_response = views.edit_bodypart_data(request,bodypart_id)

    if operation_response.status_code == 200:
        messages.add_message(request, messages.INFO, "Body Part data edited successfully")
    else:
        messages.add_message(request, messages.ERROR, "Error editing Body Part data")

    return redirect('edit_bodypart_form', bodypart_id=bodypart_id)

def view_bodypart(request,bodypart_id):
    response_bodypart = views.bodypart_dataview(request, bodypart_id)
    bodypart_data = response_bodypart.data
    return render(request, 'admin/body_part/view.html', {'bodypart_data': bodypart_data})

def delete_bodypart(request,bodypart_id):

    operation_response = views.softdelete_bodypart_data(request,bodypart_id)

    if operation_response.status_code == 200:
        messages.add_message(request, messages.INFO, "Body Part data deleted successfully")
    else:
        messages.add_message(request, messages.ERROR, "Error deleting Body Part data")

    return redirect('bodypart_list')

# Organ


def organ_form(request):
    response_bodypart = views.get_all_bodypart_list(request)
    bodypart_data = response_bodypart.data
    return render(request, 'admin/organ/form.html',{'bodypart_data':bodypart_data})


def store_organ(request):
    operation_response = views.store_organ_data(request)
    if operation_response.status_code == 200:
        messages.add_message(request, messages.INFO,
                             "Organ data stored successfully")
    else:
        messages.add_message(request, messages.ERROR,
                             "Error in storing Organ data")

    return render(request, 'admin/organ/form.html')


def organ_dataview(request):
    response = views.get_all_organs_list(request)
    all_data = response.data
    return render(request, 'admin/organ/list_all.html',{'all_data': all_data})

def edit_organ_form(request, organ_id):
    response_bodypart = views.get_all_bodypart_list(request)
    bodypart_data = response_bodypart.data

    response_organ = views.organ_dataview(request, organ_id)
    organ_data = response_organ.data
    return render(request, 'admin/organ/edit.html', {'bodypart_data':bodypart_data,'organ_data': organ_data})

def edit_organ(request, organ_id):
    operation_response = views.edit_organ_data(request,organ_id)

    if operation_response.status_code == 200:
        messages.add_message(request, messages.INFO, "Organ data edited successfully")
    else:
        messages.add_message(request, messages.ERROR, "Error editing organ data")

    return redirect('edit_organ_form', organ_id=organ_id)

def view_organ(request, organ_id):
    response_organ = views.organ_dataview(request, organ_id)
    organ_data = response_organ.data
    return render(request, 'admin/organ/view.html', {'organ_data': organ_data})

def delete_organ(request,organ_id):

    operation_response = views.softdelete_organ_data(request,organ_id)

    if operation_response.status_code == 200:
        messages.add_message(request, messages.INFO, "Organ data deleted successfully")
    else:
        messages.add_message(request, messages.ERROR, "Error deleting Organ data")

    return redirect('organ_list')

# Organ Problem


def organ_problem_form(request):
    response_organ = views.get_all_organs_list(request)
    organ_data = response_organ.data
    return render(request, 'admin/organ_problem/form.html',{'organ_data':organ_data})


def store_organ_problem(request):
    operation_response = views.store_organ_problem_data(request)
    if operation_response.status_code == 200:
        messages.add_message(request, messages.INFO,
                             "Organ Problem data stored successfully")
    else:
        messages.add_message(request, messages.ERROR,
                             "Error in storing Organ Problem data")

    return render(request, 'admin/organ_problem/form.html')


def organ_problem_dataview(request):
    response = views.get_all_organ_problem_list(request)
    all_data = response.data
    return render(request, 'admin/organ_problem/list_all.html',{'all_data':all_data})


# Problem Specification


def problem_specification_form(request):
    response_organ = views.get_all_organs_list(request)
    organ_data = response_organ.data
    return render(request, 'admin/problem_specification/form.html',{'organ_data':organ_data})


def store_problem_specification(request):
    operation_response = views.store_problem_specification_data(request)
    if operation_response.status_code == 200:
        messages.add_message(request, messages.INFO,
                             "Problem Specification data stored successfully")
    else:
        messages.add_message(request, messages.ERROR,
                             "Error in storing Problem Specification data")

    return render(request, 'admin/problem_specification/form.html')


def problem_specification_dataview(request):
    response = views.get_all_problem_specification_list(request)
    all_data = response.data
    return render(request, 'admin/problem_specification/list_all.html',{'all_data':all_data})

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

    return render(request, 'admin/department/form.html')


def department_dataview(request):
    response = views.get_all_departments_list(request)
    all_data = response.data
    return render(request, 'admin/department/list_all.html',{'all_data':all_data})

# Department Specification

def department_specification_form(request):
    response_department = views.get_all_departments_list(request)
    department_data = response_department.data

    specification_response = views.get_all_problem_specification_list(request)
    specification_data = specification_response.data

    return render(request, 'admin/department_specification/form.html',{'department_data':department_data,'specification_data':specification_data})


def store_department_specification(request):
    operation_response = views.store_department_specification_data(request)
    if operation_response.status_code == 200:
        messages.add_message(request, messages.INFO,
                             "Department Specification data stored successfully")
    else:
        messages.add_message(request, messages.ERROR,
                             "Error in storing Department Specification data")

    return render(request, 'admin/department_specification/form.html')


def department_specification_dataview(request):
    response = views.get_all_department_specifications_list(request)
    all_data = response.data
    return render(request, 'admin/department_specification/list_all.html',{'all_data':all_data})

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

    return render(request, 'admin/faq/form.html')

def faq_dataview(request):
    response = views.get_all_faq_list(request)
    all_data = response.data
    return render(request, 'admin/faq/list_all.html',{'all_data':all_data})

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

    return render(request, 'admin/article/form.html')

def article_dataview(request):
    response = views.get_all_article_list(request)
    all_data = response.data
    return render(request, 'admin/article/list_all.html',{'all_data':all_data})