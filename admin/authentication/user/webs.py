from .views import *
from django.shortcuts import render, redirect
from admin.doctor.models import DoctorProfile
from admin.patient.models import PatientProfile
from django.contrib import messages
from backend.constants import *
from admin.personal_data.views import *
from django.http import HttpResponse


def admin_form(request):
    response_gender = gender_list(request)
    gender_data = response_gender.data

    response_religion = religion_list(request)
    religion_data = response_religion.data

    response_blood_group = blood_group_list(request)
    blood_group_data = response_blood_group.data

    response_matrimony = matrimony_list(request)
    matrimony_data = response_matrimony.data

    data = {
        'gender_data': gender_data,
        'religion_data': religion_data,
        'blood_group_data': blood_group_data,
        'matrimony_data': matrimony_data,
    }
    return render(request, 'authentication/user/templates/form.html', data)


def store_admin(request):
    operation_response = store_admin_data(request)
    if operation_response.data.get('status') == 200:
        email = operation_response.data.get('email')
        request.session['temp_verify_email'] = email
        messages.add_message(request, messages.INFO, 'Please activate your account')
        return redirect('otp_form')
    else:
        messages.add_message(request, messages.ERROR, 'Error in storing admin data')
        return redirect('admin_form')


def view_admin(request, admin_id):
    response_admin_data = admin_data(request, admin_id)
    admin_all_data = response_admin_data.data
    data = {'admin_all_data': admin_all_data, 'admin_id': admin_id}
    return render(request, 'authentication/user/templates/view.html', data)


def edit_admin_form(request, admin_id):
    response_gender = gender_list(request)
    gender_data = response_gender.data

    response_religion = religion_list(request)
    religion_data = response_religion.data

    response_blood_group = blood_group_list(request)
    blood_group_data = response_blood_group.data

    response_matrimony = matrimony_list(request)
    matrimony_data = response_matrimony.data

    response_admin = admin_data(request, admin_id)
    admin_all_data = response_admin.data
    data = {
        'gender_data': gender_data,
        'religion_data': religion_data,
        'blood_group_data': blood_group_data,
        'matrimony_data': matrimony_data,
        'admin_all_data': admin_all_data,
        'admin_id': admin_id,
    }
    return render(request, 'authentication/user/templates/edit.html', data)


def edit_admin(request, admin_id):
    operation_response = edit_admin_data(request, admin_id)
    if operation_response.data.get('status') == 200:
        messages.add_message(
            request, messages.INFO, 'Admin data are edited successfully.'
        )
        return redirect('edit_admin_form', admin_id=admin_id)
    else:
        messages.add_message(request, messages.ERROR, 'Error in storing Admin data')
        return redirect('edit_admin_form', admin_id=admin_id)


def get_user_details(request):
    if request.session.get('user_role') == ROLE_ADMIN:
        full_name = request.session.get('user_full_name')
        print(full_name)
        user_id = request.session.get('user_id')
        admin_profile = AdminProfile.objects.filter(user_id=user_id).first()
        admin_id = admin_profile.id
        return redirect('view_admin', admin_id=admin_id)
    elif request.session.get('user_role') == ROLE_DOCTOR:
        user_id = request.session.get('user_id')
        doctor_profile = DoctorProfile.objects.filter(user_id=user_id).first()
        doctor_id = doctor_profile.id
        return redirect('view_doctor_data', doctor_id=doctor_id)
    elif request.session.get('user_role') == ROLE_PATIENT:
        user_id = request.session.get('user_id')
        patient_profile = PatientProfile.objects.filter(user_id=user_id).first()
        patient_id = patient_profile.id
        return redirect('view_patient', patient_id=patient_id)
    else:
        return HttpResponse('Please Enter Valid Information')
