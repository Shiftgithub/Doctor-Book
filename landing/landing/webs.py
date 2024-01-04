from .views import *
from django.shortcuts import render

from admin.faq.views import *
from admin.article.views import *
from admin.department.views import get_all_departments_list
from admin.doctor.views import get_all_doctors_list_for_landing, doctor_data, get_all_doctors_list_for_landing_by_id


def landing_dashboard(request):
    response = get_all_departments_list(request)
    all_department_data = response.data

    department_response = count_department(request)
    department_count_data = department_response.data
    doctor_response = count_doctor(request)
    doctor_count_data = doctor_response.data

    patient_response = count_patient(request)
    patient_count_data = patient_response.data

    data = {
        'all_department_data': all_department_data,
        'department_data': department_count_data,
        'doctor_data': doctor_count_data,
        'patient_data': patient_count_data
    }

    return render(request, 'landing/templates/pages/home.html', data)


def landing_doctors(request):
    response_doctor = get_all_doctors_list_for_landing(request)
    doctor_all_data = response_doctor.data
    return render(request, 'landing/templates/pages/doctors.html', {'doctor_data': doctor_all_data})


def landing_doctor_profile(request, doctor_id):
    response_doctor = get_all_doctors_list_for_landing_by_id(request, doctor_id)
    doctor_all_data = response_doctor.data
    data = {'doctor_all_data': doctor_all_data}
    return render(request, 'landing/templates/pages/doctor_profile.html', data)


# Renders Landing FAQ page


def landing_faq(request):
    response = get_all_faq_list(request)
    all_data = response.data
    return render(request, 'landing/templates/pages/faq.html', {'all_data': all_data})


def landing_article(request):
    response = get_all_article_list(request)
    all_data = response.data
    return render(request, 'landing/templates/pages/articles.html', {'all_data': all_data})


def landing_single_article(request, article_id):
    response = get_article_by_id(request, article_id)
    all_data = response.data
    return render(request, 'landing/templates/pages/article_view.html', {'all_data': all_data})
