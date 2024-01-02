from datetime import datetime
from django.contrib import messages
<<<<<<< HEAD
from django.shortcuts import render
=======
from django.http import HttpResponse
from django.shortcuts import render, redirect

from admin.constants.constants import *
>>>>>>> 0a0d8f532772ef8919a2217788d4c6179800016c
from admin.doctor.views import doctor_data
from admin.doctor.models import DoctorProfile
from admin.patient.models import PatientProfile
from landing.landing.views import *
from landing.appointment.views import *
from admin.prescription.views import *


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
<<<<<<< HEAD
    doctor_data = doctor_response.data

=======
    doctor_all_data = doctor_response.data
>>>>>>> 0a0d8f532772ef8919a2217788d4c6179800016c
    patient_response = count_patient(request)
    patient_data = patient_response.data
    data = {
        'department_data': department_data,
<<<<<<< HEAD
        'doctor_data': doctor_data,
=======
        'doctor_data': doctor_all_data,
>>>>>>> 0a0d8f532772ef8919a2217788d4c6179800016c
        'patient_data': patient_data,
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
<<<<<<< HEAD

    patient_response = count_patient(request)
    patient_data = patient_response.data
    data = {
        'patient_data': patient_data,
=======
    data = {
>>>>>>> 0a0d8f532772ef8919a2217788d4c6179800016c
        'medicine_prescription_data': medicine_prescription_data,
        'lab_prescription_data': lab_prescription_data,
        'count_appointment_data': count_appointment_data
    }
    return render(request, 'dashboard/templates/doctor/dashboard.html', data)


def patient_dashboard(request):
<<<<<<< HEAD
=======
    # patient_id = request.session['patient_id']
>>>>>>> 0a0d8f532772ef8919a2217788d4c6179800016c
    notification(request)
    return render(request, 'dashboard/templates/patient/dashboard.html')


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
<<<<<<< HEAD
=======


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
>>>>>>> 0a0d8f532772ef8919a2217788d4c6179800016c
