from . import views
from .models import *
from datetime import datetime
from django.contrib import messages
from django.shortcuts import render, redirect


# Frequently Asked Questions

def faq_form(request):
    return render(request, 'admin/faq/form.html')


def store_faq(request):
    operation_response = views.store_faq_data(request)
    if operation_response.data.get('status') == 200:
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

    if operation_response.data.get('status') == 200:
        messages.add_message(request, messages.INFO, "faq data edited successfully")
    else:
        messages.add_message(request, messages.ERROR, "Error editing faq data")

    return redirect('edit_faq_form', faq_id=faq_id)


def delete_faq(request, faq_id):
    operation_response = views.softdelete_faq_data(request, faq_id)

    if operation_response.data.get('status') == 200:
        messages.add_message(request, messages.INFO, "faq data deleted successfully")
    else:
        messages.add_message(request, messages.ERROR, "Error deleting faq data")

    return redirect('faq_list')