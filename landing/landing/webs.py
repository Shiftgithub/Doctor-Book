from .views import *
from admin.faq.views import *
from admin.article.views import *
from admin.department.views import get_all_departments_list
from admin.doctor.views import get_all_doctors_list_for_landing
from django.shortcuts import render


def landing_dashboard(request):
    response = get_all_departments_list(request)
    all_data = response.data

    department_response = count_department(request)
    department_data = department_response.data

    doctor_response = count_doctor(request)
    doctor_data = doctor_response.data

    patient_response = count_patient(request)
    patient_data = patient_response.data

    data = {
        'all_data': all_data,
        'department_data': department_data,
        'doctor_data': doctor_data,
        'patient_data': patient_data
    }

    return render(request, 'landing/templates/pages/home.html', data)


def landing_doctors(request):
    response_doctor = get_all_doctors_list_for_landing(request)
    doctor_data = response_doctor.data
    return render(request, 'landing/templates/pages/doctors.html', {'doctor_data': doctor_data})

    # Renders Landing FAQ page


def landing_faq(request):
    response = get_all_faq_list(request)
    all_data = response.data
    return render(request, 'landing/templates/pages/faq.html', {'all_data': all_data})


def landing_article(request):
    response = get_all_article_list(request)
    all_data = response.data
    print(all_data)
    return render(request, 'landing/templates/pages/articles.html', {'all_data': all_data})


def landing_single_article(request, article_id):
    response = get_article_by_id(request, article_id)
    all_data = response.data
    return render(request, 'landing/templates/pages/article_view.html', {'all_data': all_data})


def doctor_register(request):
    return render(request, 'landing/templates/pages/register.html')
