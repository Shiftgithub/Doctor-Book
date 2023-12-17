from .views import *
from ..personal_data.views import *
from django.contrib import messages
from django.shortcuts import render, redirect
from ..department.views import get_all_departments_list


def doctor_form(request):
    response_gender = gender_list(request)
    gender_data = response_gender.data

    response_religion = religion_list(request)
    religion_data = response_religion.data

    response_blood_group = blood_group_list(request)
    blood_group_data = response_blood_group.data

    response_matrimony = matrimony_list(request)
    matrimony_data = response_matrimony.data

    response_department = get_all_departments_list(request)
    department_data = response_department.data

    response_division = division_list(request)
    division_data = response_division.data
    data = {
        'department_data': department_data,
        'gender_data': gender_data,
        'religion_data': religion_data,
        'blood_group_data': blood_group_data,
        'matrimony_data': matrimony_data,
        'division_data': division_data
    }
    return render(request, 'doctor/templates/forms/form.html', data)


def store_doctor(request):
    operation_response = store_doctor_data(request)

    message = operation_response.data.get('message')
    if operation_response.data.get('status') == 200:
        messages.add_message(request, messages.INFO, message)
    elif operation_response.data.get('status') == 400:
        messages.add_message(request, messages.ERROR, message)
    elif operation_response.data.get('status') == 403:
        messages.add_message(request, messages.ERROR, message)
    elif operation_response.data.get('status') == 404:
        messages.add_message(request, messages.ERROR, message)
    elif operation_response.data.get('status') == 1000:
        messages.add_message(request, messages.ERROR, message)
    else:
        messages.add_message(request, messages.ERROR, message)
    return redirect('doctor_form')


def work_form(request):
    response_day = day_list(request)
    day_data = response_day.data

    response_doctor = get_all_doctors_name(request)
    doctors_data = response_doctor.data

    response_board = board_list(request)
    board_data = response_board.data
    data = {'doctor_data': doctors_data, 'board_data': board_data, 'day_data': day_data}
    return render(request, 'doctor/templates/forms/work_form.html', data)


def store_work_details(request):
    operation_response = work_details_store(request)
    message = operation_response.data.get('message')
    if operation_response.data.get('status') == 200:
        messages.add_message(request, messages.INFO, message)
    elif operation_response.data.get('status') == 400:
        messages.add_message(request, messages.ERROR, message)
    elif operation_response.data.get('status') == 403:
        messages.add_message(request, messages.ERROR, message)
    elif operation_response.data.get('status') == 404:
        messages.add_message(request, messages.ERROR, message)
    else:
        messages.add_message(request, messages.ERROR, message)
    return redirect('work_form')


def edu_form(request):
    response_doctor = get_all_doctors_name_by_edu(request)
    doctors_data = response_doctor.data

    response_board = board_list(request)
    board_data = response_board.data

    data = {'doctor_data': doctors_data, 'board_data': board_data}
    return render(request, 'doctor/templates/forms/edu_form.html', data)


def store_edu(request):
    operation_response = edu_store(request)
    message = operation_response.data.get('message')
    if operation_response.data.get('status') == 200:
        messages.add_message(request, messages.INFO, message)
    elif operation_response.data.get('status') == 400:
        messages.add_message(request, messages.ERROR, message)
    elif operation_response.data.get('status') == 404:
        messages.add_message(request, messages.ERROR, message)
    elif operation_response.data.get('status') == 500:
        messages.add_message(request, messages.ERROR, message)
    else:
        messages.add_message(request, messages.ERROR, message)
    return redirect('edu_form')


def award_form(request):
    response_doctor = get_all_doctors_name_by_award(request)
    doctors_data = response_doctor.data
    data = {'doctor_data': doctors_data}
    return render(request, 'doctor/templates/forms/award_form.html', data)


def store_award(request):
    operation_response = award_store(request)
    message = operation_response.data.get('message')
    if operation_response.data.get('status') == 200:
        messages.add_message(request, messages.INFO, message)
    elif operation_response.data.get('status') == 400:
        messages.add_message(request, messages.ERROR, message)
    elif operation_response.data.get('status') == 404:
        messages.add_message(request, messages.ERROR, message)
    elif operation_response.data.get('status') == 500:
        messages.add_message(request, messages.ERROR, message)
    else:
        messages.add_message(request, messages.ERROR, message)
    return redirect('award_form')


def social_form(request):
    response_doctor = get_all_doctors_name_by_social(request)
    doctors_data = response_doctor.data
    data = {'doctor_data': doctors_data}
    return render(request, 'doctor/templates/forms/social_form.html', data)


def store_social(request):
    operation_response = social_store(request)
    message = operation_response.data.get('message')
    if operation_response.data.get('status') == 200:
        messages.add_message(request, messages.INFO, message)
    elif operation_response.data.get('status') == 400:
        messages.add_message(request, messages.ERROR, message)
    elif operation_response.data.get('status') == 403:
        messages.add_message(request, messages.ERROR, message)
    else:
        messages.add_message(request, messages.ERROR, message)
    return redirect('social_form')


def get_doctor_data(request):
    response = get_all_doctors_list(request)
    all_data = response.data
    return render(request, 'doctor/templates/lists/list_all.html', {'all_data': all_data})


def get_doctor_working_data(request):
    response = get_doctors_name_department_data(request)
    all_data = response.data
    return render(request, 'doctor/templates/lists/working_list.html', {'all_data': all_data})


def get_doctor_edu_data(request):
    response = get_doctors_name_department_data(request)
    all_data = response.data
    return render(request, 'doctor/templates/lists/edu_list.html', {'all_data': all_data})


def get_doctor_social_data(request):
    response = get_doctors_name_department_data(request)
    all_data = response.data
    return render(request, 'doctor/templates/lists/social_list.html', {'all_data': all_data})


def get_doctor_award_data(request):
    response = get_doctors_name_department_data(request)
    all_data = response.data
    return render(request, 'doctor/templates/lists/award_list.html', {'all_data': all_data})


def get_doctor_data_by_id(request, doctor_id):
    response_doctor_data = doctor_data(request, doctor_id)
    doctor_all_data = response_doctor_data.data
    data = {'doctor_all_data': doctor_all_data, 'doctor_id': doctor_id}
    return render(request, 'doctor/templates/views/view.html', data)


def get_doctor_working_data_by_id(request, doctor_id):
    response_doctor_data = doctor_working_data(request, doctor_id)
    doctor_all_data = response_doctor_data.data
    print(doctor_all_data)
    data = {'doctor_all_data': doctor_all_data, 'doctor_id': doctor_id}
    return render(request, 'doctor/templates/views/working_view.html', data)


def get_doctor_social_data_by_id(request, doctor_id):
    response_doctor_data = doctor_social_data(request, doctor_id)
    doctor_all_data = response_doctor_data.data
    data = {'doctor_all_data': doctor_all_data, 'doctor_id': doctor_id}
    return render(request, 'doctor/templates/views/social_view.html', data)


def get_doctor_award_data_by_id(request, doctor_id):
    response_doctor_data = doctor_award_data(request, doctor_id)
    doctor_all_data = response_doctor_data.data
    print(doctor_all_data)
    data = {'doctor_all_data': doctor_all_data, 'doctor_id': doctor_id}
    return render(request, 'doctor/templates/views/award_view.html', data)


def get_doctor_edu_data_by_id(request, doctor_id):
    response_doctor_data = doctor_edu_data(request, doctor_id)
    doctor_all_data = response_doctor_data.data
    print(doctor_all_data)
    data = {'doctor_all_data': doctor_all_data, 'doctor_id': doctor_id}
    return render(request, 'doctor/templates/views/edu_view.html', data)


def edit_doctor_form(request, doctor_id):
    response_gender = gender_list(request)
    gender_data = response_gender.data

    response_religion = religion_list(request)
    religion_data = response_religion.data

    response_blood_group = blood_group_list(request)
    blood_group_data = response_blood_group.data

    response_matrimony = matrimony_list(request)
    matrimony_data = response_matrimony.data

    response_department = get_all_departments_list(request)
    department_data = response_department.data

    response_division = division_list(request)
    division_data = response_division.data

    response_district = district_list(request)
    district_data = response_district.data

    response_upazila = upazila_list(request)
    upazila_data = response_upazila.data

    response_board = board_list(request)
    board_data = response_board.data

    response_day = day_list(request)
    day_data = response_day.data

    response_doctor = doctor_data(request, doctor_id)
    doctor_all_data = response_doctor.data
    data = {'department_data': department_data, 'gender_data': gender_data,
            'religion_data': religion_data, 'blood_group_data': blood_group_data,
            'matrimony_data': matrimony_data, 'division_data': division_data,
            'district_data': district_data, 'upazila_data': upazila_data, 'board_data': board_data,
            'doctor_all_data': doctor_all_data, 'doctor_id': doctor_id, 'day_data': day_data
            }
    return render(request, 'doctor/templates/edits/edit.html', data)


def edit_doctor(request, doctor_id):
    operation_response = edit_doctor_data(request, doctor_id)

    message = operation_response.data.get('message')
    if operation_response.data.get('status') == 200:
        messages.add_message(request, messages.INFO, message)
    elif operation_response.data.get('status') == 400:
        messages.add_message(request, messages.ERROR, message)
    elif operation_response.data.get('status') == 404:
        messages.add_message(request, messages.ERROR, message)
    elif operation_response.data.get('status') == 500:
        messages.add_message(request, messages.ERROR, message)
    else:
        messages.add_message(request, messages.ERROR, message)

    return redirect('edit_doctor_form', doctor_id=doctor_id)


def edit_social_form(request, doctor_id):
    response_doctor = doctor_social_data(request, doctor_id)
    doctor_all_data = response_doctor.data
    data = {
        'doctor_all_data': doctor_all_data, 'doctor_id': doctor_id
    }
    return render(request, 'doctor/templates/edits/social_edit.html', data)


def edit_doctor_social(request, doctor_id):
    operation_response = edit_social_data(request, doctor_id)
    message = operation_response.data.get('message')
    if operation_response.data.get('status') == 200:
        messages.add_message(request, messages.INFO, message)
    elif operation_response.data.get('status') == 403:
        messages.add_message(request, messages.ERROR, message)
    elif operation_response.data.get('status') == 404:
        messages.add_message(request, messages.ERROR, message)
    else:
        messages.add_message(request, messages.ERROR, message)

    return redirect('edit_social_form', doctor_id=doctor_id)


def edit_award_form(request, doctor_id):
    response_doctor = doctor_award_data(request, doctor_id)
    doctor_all_data = response_doctor.data
    data = {
        'doctor_all_data': doctor_all_data, 'doctor_id': doctor_id
    }
    return render(request, 'doctor/templates/edits/award_edit.html', data)


def edit_doctor_award(request, doctor_id):
    operation_response = edit_award_data(request, doctor_id)
    message = operation_response.data.get('message')
    if operation_response.data.get('status') == 200:
        messages.add_message(request, messages.INFO, message)
    elif operation_response.data.get('status') == 400:
        messages.add_message(request, messages.ERROR, message)
    elif operation_response.data.get('status') == 403:
        messages.add_message(request, messages.ERROR, message)
    elif operation_response.data.get('status') == 404:
        messages.add_message(request, messages.ERROR, message)
    else:
        messages.add_message(request, messages.ERROR, message)

    return redirect('edit_award_form', doctor_id=doctor_id)


def delete_doctor(request, doctor_id):
    operation_response = softdelete_doctor_data(request, doctor_id)
    if operation_response.data.get('status') == 200:
        messages.add_message(request, messages.INFO, 'Doctor data deleted Successfully')
    else:
        messages.add_message(request, messages.ERROR, 'Error deleting Doctor data')
    return redirect('doctor_list')
