from .views import *
from django.contrib import messages
from admin.doctor.views import doctor_data
from django.shortcuts import render, redirect
from admin.bodypart.views import get_all_body_part_list


def predict_form(request):
    response_body_part = get_all_body_part_list(request)
    body_part_data = response_body_part.data
    data = {'bodypart_data': body_part_data}
    return render(request, 'prediction/templates/predict.html', data)


def predict(request):
    operation_response = prediction(request)
    if operation_response.data.get('status') == 200:
        doctor_response = operation_response.data.get('doctors_data')
        problem_specs = operation_response.data.get('problem_specs')
        body_part_name = operation_response.data.get('bodypart_name')
        organ_name = operation_response.data.get('organ_name')
        messages.add_message(request, messages.INFO, 'Here are all Doctor List ')
        data = {
            'doctor_data': doctor_response,
            'bodypart_name': body_part_name,
            'organ_name': organ_name,
            'problem_specs': problem_specs
        }
        return render(request, 'prediction/templates/predict_result.html', data)
    else:
        messages.add_message(request, messages.ERROR, 'Error')
        return redirect('predict_form')


def doctor_profile(request, doctor_id):
    response_doctor = doctor_data(request, doctor_id)
    doctor_all_data = response_doctor.data
    data = {'doctor_all_data': doctor_all_data}
    return render(request, 'prediction/templates/doctor_profile.html', data)
