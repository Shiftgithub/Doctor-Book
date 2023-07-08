from django.shortcuts import render
from django.contrib import messages
from adminpanel.views.apis.article_views import *
from adminpanel.views.apis.bodypart_views import *
from adminpanel.views.apis.doctor_views import get_all_doctors_info_for_landing
from adminpanel.views.apis.faq_views import *
from landing.views.apis.patient_views import *


def landing_dashboard(request):
    return render(request, 'landing/pages/home.html')


def landing_doctors(request):
    response_doctor = get_all_doctors_info_for_landing(request)
    doctor_data = response_doctor.data
    print(doctor_data)
    return render(request, 'landing/pages/doctors.html', {'doctor_data': doctor_data})

    # Renders Landing FAQ page


def landing_faq(request):
    response = get_all_faq_list(request)
    all_data = response.data
    return render(request, 'landing/pages/faq.html', {'all_data': all_data})


def landing_article(request):
    response = get_all_article_list(request)
    all_data = response.data
    return render(request, 'landing/pages/articles.html', {'all_data': all_data})


def doctor_register(request):
    return render(request, 'landing/pages/register.html')


def predict(request):
    response_bodypart = get_all_bodypart_list(request)
    bodypart_data = response_bodypart.data
    return render(request, 'landing/pages/predict.html', {'bodypart_data': bodypart_data})
