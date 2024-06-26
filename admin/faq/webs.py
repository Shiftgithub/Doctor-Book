from .views import *
from django.contrib import messages
from django.shortcuts import render, redirect


# Frequently Asked Questions

def faq_form(request):
    return render(request, 'faq/templates/admin/form.html')


def store_faq(request):
    user_id = request.session.get('user_id')
    operation_response = store_faq_data(request,user_id)
    message = operation_response.data.get('message')
    if operation_response.data.get('status') == 200:
        messages.add_message(request, messages.INFO, message)
    elif operation_response.data.get('status') == 400:
        messages.add_message(request, messages.ERROR, message)
    elif operation_response.data.get('status') == 403:
        messages.add_message(request, messages.ERROR, message)
    else:
        messages.add_message(request, messages.ERROR, message)

    return redirect('faq_form')


def faq_data_view(request):
    response = get_all_faq_list(request)
    all_data = response.data
    return render(request, 'faq/templates/admin/list_all.html', {'all_data': all_data})


def edit_faq_form(request, faq_id):
    response_faq = faq_dataview(request, faq_id)
    faq_data = response_faq.data
    return render(request, 'faq/templates/admin/edit.html', {'faq_data': faq_data})


def edit_faq(request, faq_id):
    user_id = request.session.get('user_id')
    operation_response = edit_faq_data(request, faq_id,user_id)

    message = operation_response.data.get('message')
    if operation_response.data.get('status') == 200:
        messages.add_message(request, messages.INFO, message)
    elif operation_response.data.get('status') == 400:
        messages.add_message(request, messages.ERROR, message)
    elif operation_response.data.get('status') == 403:
        messages.add_message(request, messages.ERROR, message)
    else:
        messages.add_message(request, messages.ERROR, message)

    return redirect('edit_faq_form', faq_id=faq_id)


def delete_faq(request, faq_id):
    operation_response = softdelete_faq_data(request, faq_id)

    message = operation_response.data.get('message')
    if operation_response.data.get('status') == 200:
        messages.add_message(request, messages.INFO, message)
    elif operation_response.data.get('status') == 400:
        messages.add_message(request, messages.ERROR, message)
    elif operation_response.data.get('status') == 403:
        messages.add_message(request, messages.ERROR, message)
    else:
        messages.add_message(request, messages.ERROR, message)

    return redirect('faq_list')


# for doctor side
def faq_view_created_by(request):
    user_id = request.session.get('user_id')
    response = get_all_faq_list_created_by(request, user_id)
    all_data = response.data
    return render(request, 'faq/templates/doctor/list_all.html', {'all_data': all_data})
