from backend.constants import *
from django.shortcuts import render
from admin.doctor.views import doctor_data
from admin.patient.views import patient_data


def get_user_details(request):
    if request.session.get('user_role') == ROLE_DOCTOR:
        doctor_id = request.session.get('user_id')
        user_details = doctor_data(request, doctor_id)
        doctor_all_data = user_details.data
        return render(request, 'doctor/templates/view.html',
                      {'doctor_all_data': doctor_all_data, 'doctor_id': doctor_id})

    elif request.session.get('user_role') == ROLE_PATIENT:
        patient_id = request.session.get('user_id')
        user_details = patient_data(request, patient_id)
        patient_all_data = user_details.data
        print(patient_id)
        return render(request, 'patient/templates/view.html',
                      {'patient_all_data': patient_all_data, 'patient_id': patient_id})
    else:
        pass
