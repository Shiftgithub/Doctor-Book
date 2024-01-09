from datetime import datetime
from django.contrib import messages
from django.http import HttpResponse
from django.shortcuts import render, redirect

from admin.article.views import count_article
from admin.constants.constants import *
from admin.doctor.views import doctor_data
from admin.doctor.models import DoctorProfile
from admin.labtest.views import count_labtest
from admin.medicine.views import count_medicine
from admin.patient.models import PatientProfile
from landing.landing.views import *
from landing.appointment.views import *
from admin.prescription.views import *
from landing.prediction.views import count_predictions, count_prediction_for_admin


def get_time_of_day():
    current_time = datetime.now().time()
    if current_time.hour < 6:
        return 'night'
    elif current_time.hour < 12:
        return 'morning'
    elif current_time.hour < 18:
        return 'afternoon'
    elif current_time.hour < 20:
        return 'evening'
    else:
        return 'night'


time_of_day = get_time_of_day()


# Dashboard
def admin_dashboard(request):
    notification(request)
    department_response = count_department(request)
    department_data = department_response.data

    doctor_response = count_doctor(request)
    doctor_all_data = doctor_response.data

    patient_response = count_patient(request)
    patient_data = patient_response.data

    prediction_response = count_prediction_for_admin(request)
    prediction_data = prediction_response.data

    medicine_response = count_medicine(request)
    medicine_data = medicine_response.data

    labtest_response = count_labtest(request)
    labtest_data = labtest_response.data

    article_response = count_article(request)
    article_data = article_response.data

    data = {
        'department_data': department_data,
        'medicine_data': medicine_data,
        'labtest_data': labtest_data,
        'article_data': article_data,
        'doctor_data': doctor_all_data,
        'patient_data': patient_data,
        'prediction_data': prediction_data,
    }
    return render(request, 'dashboard/templates/admin/dashboard.html', data)


def doctor_dashboard(request):
    doctor_id = request.session['doctor_id']

    notification(request)

    medicine_prescription_response = count_medicine_prescription(request, doctor_id)
    medicine_prescription_data = medicine_prescription_response.data

    lab_prescription_response = count_lab_prescription(request, doctor_id)
    lab_prescription_data = lab_prescription_response.data

    count_appointment_response = count_appointments(request, doctor_id)
    count_appointment_data = count_appointment_response.data

    medicine_response = count_medicine(request)
    medicine_data = medicine_response.data

    labtest_response = count_labtest(request)
    labtest_data = labtest_response.data

    article_response = count_article(request)
    article_data = article_response.data
    data = {
        'medicine_data': medicine_data,
        'labtest_data': labtest_data,
        'article_data': article_data,
        'lab_prescription_data': lab_prescription_data,
        'count_appointment_data': count_appointment_data,
        'medicine_prescription_data': medicine_prescription_data,
    }
    return render(request, 'dashboard/templates/doctor/dashboard.html', data)


def patient_dashboard(request):
    patient_id = request.session['patient_id']
    notification(request)
    medicine_prescription_response = count_medicine_prescription_for_patient(request, patient_id)
    medicine_prescription_data = medicine_prescription_response.data

    prediction_response = count_predictions(request, patient_id)
    prediction_data = prediction_response.data

    lab_prescription_response = count_lab_prescription_for_patient(request, patient_id)
    lab_prescription_data = lab_prescription_response.data

    patient_id = request.session.get('patient_id')
    response = get_all_appointment_by_patient(request, patient_id)
    all_data = response.data

    data = {
        'all_data': all_data,
        'prediction_data': prediction_data,
        'lab_prescription_data': lab_prescription_data,
        'medicine_prescription_data': medicine_prescription_data,
    }
    return render(request, 'dashboard/templates/patient/dashboard.html', data)


def notification(request):
    if time_of_day == 'morning':
        messages.add_message(request, messages.INFO, 'Good morning!  Welcome to the dashboard')
    elif time_of_day == 'afternoon':
        messages.add_message(request, messages.INFO, 'Good afternoon!  Welcome to the dashboard')
    elif time_of_day == 'evening':
        messages.add_message(request, messages.INFO, 'Good evening!  Welcome to the dashboard')
    else:
        messages.add_message(request, messages.INFO, 'Good night!  Welcome to the dashboard')


def change_theme(request):
    return render(request, 'dashboard/templates/admin/change_theme.html')


def get_user_details(request):
    if request.session.get('user_role') == ROLE_ADMIN:
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
