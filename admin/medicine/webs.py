from .views import *
from django.contrib import messages
from django.shortcuts import render, redirect


# medicine
def medicine_form(request):
    response_brand = brand_list(request)
    brand_data = response_brand.data

    response_generic = generic_list(request)
    generic_data = response_generic.data

    response_medicine_type = medicine_type_list(request)
    medicine_type_data = response_medicine_type.data

    response_strength = strength_list(request)
    strength_data = response_strength.data

    return render(request, 'medicine/templates/form.html', {
        'brand_data': brand_data, 'generic_data': generic_data,
        'medicine_type_data': medicine_type_data, 'strength_data': strength_data
    })


def store_medicine(request):
    operation_response = store_medicine_data(request)
    if operation_response.data.get('status') == 200:
        messages.add_message(
            request, messages.INFO, 'Medicine data stored successfully'
        )
    else:
        messages.add_message(
            request, messages.ERROR, 'Error in storing medicine data'
        )
    return redirect('add_medicine_form')


def medicine_data_view(request):
    response = get_all_medicines_list(request)
    all_data = response.data
    return render(request, 'medicine/templates/list_all.html', {'all_data': all_data})


def view_medicine(request, medicine_id):
    response_medicine_data = medicine_dataview(request, medicine_id)
    medicine_all_data = response_medicine_data.data
    return render(request, 'medicine/templates/view.html',
                  {'medicine_all_data': medicine_all_data, 'medicine_id': medicine_id})


def edit_medicine_form(request, medicine_id):
    response_brand = brand_list(request)
    brand_data = response_brand.data

    response_generic = generic_list(request)
    generic_data = response_generic.data

    response_medicine_type = medicine_type_list(request)
    medicine_type_data = response_medicine_type.data

    response_strength = strength_list(request)
    strength_data = response_strength.data

    response_medicine = medicine_dataview(request, medicine_id)
    medicine_data = response_medicine.data
    return render(
        request, 'medicine/templates/edit.html',
        {'medicine_data': medicine_data, 'brand_data': brand_data, 'generic_data': generic_data,
         'medicine_type_data': medicine_type_data, 'strength_data': strength_data, 'medicine_id': medicine_id
         })


def edit_medicine(request, medicine_id):
    operation_response = edit_medicine_data(request, medicine_id)

    if operation_response.data.get('status') == 200:
        messages.add_message(
            request, messages.INFO, 'Medicine data edited successfully'
        )
    else:
        messages.add_message(request, messages.ERROR, 'Error editing medicine data')

    return redirect('edit_medicine_form', medicine_id=medicine_id)


def delete_medicine(request, medicine_id):
    operation_response = softdelete_medicine_data(request, medicine_id)

    if operation_response.data.get('status') == 200:
        messages.add_message(
            request, messages.INFO, 'Medicine data deleted successfully'
        )
    elif operation_response.data.get('status') == 404:
        messages.add_message(
            request,
            messages.ERROR,
            'medicine cannot delete.'
            'because it is associated with medicine Table Or medicine Specification Table.',
        )
    else:
        messages.add_message(request, messages.ERROR, 'Error deleting medicine data')

    return redirect('medicine_list')
