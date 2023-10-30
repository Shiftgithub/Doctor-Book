from backend.constants import *
from django.shortcuts import render
from admin.doctor.views import doctor_data
from admin.patient.views import patient_data
from admin.doctor.models import Doctor_Profile
from admin.patient.models import Patient_Profile


def get_user_details(request):
    if request.session.get('user_role') == ROLE_DOCTOR:
        user_id = request.session.get('user_id')
        doctor_profile = Doctor_Profile.objects.filter(user_id=user_id).first()
        doctor_id = doctor_profile.id
        user_details = doctor_data(request, doctor_id)
        doctor_all_data = user_details.data
        return render(request, 'doctor/templates/view.html',
                      {'doctor_all_data': doctor_all_data, 'doctor_id': user_id})

    elif request.session.get('user_role') == ROLE_PATIENT:
        user_id = request.session.get('user_id')
        patient_profile = Patient_Profile.objects.filter(user_id=user_id).first()
        patient_id = patient_profile.id
        user_details = patient_data(request, patient_id)
        patient_all_data = user_details.data
        print('fdfdfdfd', patient_all_data)

        return render(request, 'patient/templates/view.html',
                      {'patient_all_data': patient_all_data, 'patient_id': patient_id})
    else:
        pass
