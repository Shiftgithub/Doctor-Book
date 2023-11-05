from backend.constants import *
from django.shortcuts import render, redirect
from admin.doctor.views import doctor_data
from admin.patient.views import patient_data
from admin.doctor.models import DoctorProfile
from admin.patient.models import PatientProfile


def get_user_details(request):
    if request.session.get('user_role') == ROLE_DOCTOR:
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
        pass
