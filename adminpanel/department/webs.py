from django.contrib import messages
from adminpanel.department.views import *
from django.shortcuts import render, redirect


# department
def department_form(request):
    return render(request, "department/templates/form.html")


def store_department(request):
    operation_response = store_department_data(request)
    if operation_response.data.get("status") == 200:
        messages.add_message(
            request, messages.INFO, "Department data stored successfully"
        )
    else:
        messages.add_message(
            request, messages.ERROR, "Error in storing Department data"
        )
    return redirect("add_department_form")


def department_data_view(request):
    response = get_all_departments_list(request)
    all_data = response.data
    return render(request, "department/templates/list_all.html", {"all_data": all_data})


def edit_department_form(request, department_id):
    response_department = department_dataview(request, department_id)
    department_data = response_department.data
    return render(
        request, "department/templates/edit.html", {"department_data": department_data}
    )


def edit_department(request, department_id):
    operation_response = edit_department_data(request, department_id)

    if operation_response.data.get("status") == 200:
        messages.add_message(
            request, messages.INFO, "department data edited successfully"
        )
    else:
        messages.add_message(request, messages.ERROR, "Error editing department data")

    return redirect("edit_department_form", department_id=department_id)


def delete_department(request, department_id):
    operation_response = softdelete_department_data(request, department_id)

    if operation_response.data.get("status") == 200:
        messages.add_message(
            request, messages.INFO, "Department data deleted successfully"
        )
    elif operation_response.data.get("status") == 404:
        messages.add_message(
            request,
            messages.ERROR,
            "Department cannot delete."
            "because it is associated with Doctor Table Or Department Specification Table.",
        )
    else:
        messages.add_message(request, messages.ERROR, "Error deleting Department data")

    return redirect("department_list")
