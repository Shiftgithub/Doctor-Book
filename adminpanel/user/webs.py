from django.shortcuts import render
from adminpanel.user.views import *
from backend.constants import *


def get_user_details(request):
    if request.session.get('user_role') == ROLE_DOCTOR:
        user_details = get_doctor_details(request, request.session.get('user_id'))
        doctor_all_data = user_details.data
        return render(request, 'doctor/templates/view.html', {'doctor_all_data': doctor_all_data})

    elif request.session.get('user_role') == ROLE_PATIENT:
        user_details = get_patient_details(request, request.session.get('user_id'))
        patient_all_data = user_details.data
        return render(request, 'patient/templates/view.html', {'patient_all_data': patient_all_data})
        # render patient details templates ...
    else:
        pass
