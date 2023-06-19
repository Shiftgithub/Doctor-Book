from . import views
from .models import *
from datetime import datetime
from django.contrib import messages
from django.shortcuts import render, redirect


# Body part

def bodypart_form(request):
    return render(request, 'admin/body_part/form.html')


def store_bodypart(request):
    operation_response = views.store_bodypart_data(request)
    if operation_response.data.get('status') == 200:
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

    if operation_response.data.get('status') == 200:
        messages.add_message(request, messages.INFO, "Body Part data edited successfully")
    else:
        messages.add_message(request, messages.ERROR, "Error editing Body Part data")

    return redirect('edit_bodypart_form', bodypart_id=bodypart_id)


def delete_bodypart(request, bodypart_id):
    operation_response = views.softdelete_bodypart_data(request, bodypart_id)

    if operation_response.data.get('status') == 200:
        messages.add_message(request, messages.INFO, "Body Part data deleted successfully")
    elif operation_response.data.get('status') == 404:
        messages.add_message(request, messages.ERROR, "Body Part cannot delete. because it is associated with Organ table.")
    else:
        messages.add_message(request, messages.ERROR, "Error deleting Body Part data")
    return redirect('bodypart_list')
