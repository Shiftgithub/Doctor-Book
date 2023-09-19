from .views import *
from django.contrib import messages
from admin.doctor.views import doctor_data
from django.shortcuts import render, redirect
from admin.bodypart.views import get_all_bodypart_list


def predict_form(request):
    response_bodypart = get_all_bodypart_list(request)
    bodypart_data = response_bodypart.data
    return render(request, 'prediction/templates/predict.html', {'bodypart_data': bodypart_data})


def predict(request):
    operation_response = prediction(request)
    if operation_response.data.get('status') == 200:
        doctor_data = operation_response.data.get('doctors_data')
        problem_specs = operation_response.data.get('problem_specs')
        bodypart_name = operation_response.data.get('bodypart_name')
        organ_name = operation_response.data.get('organ_name')
        messages.add_message(request, messages.INFO, 'Here are all Doctor List ')
        return render(request, 'prediction/templates/predict_result.html',
                      {'doctor_data': doctor_data, 'bodypart_name': bodypart_name, 'organ_name': organ_name,
                       'problem_specs': problem_specs})
    else:
        messages.add_message(request, messages.ERROR, 'Error')
        return redirect('predict_form')


def doctor_profile(request, doctor_id):
    response_doctor = doctor_data(request, doctor_id)
    doctor_all_data = response_doctor.data
    return render(request, 'prediction/templates/doctor_profile.html',
                  {'doctor_all_data': doctor_all_data})


def appointment_schedule_form(request, doctor_id):
    response_doctor = doctor_data(request, doctor_id)
    doctor_all_data = response_doctor.data
    days = generate_date(request)

    data = {
        'date_list': days,
        'doctor_all_data': doctor_all_data,
    }
    return render(request, 'prediction/templates/appointment_schedule.html', data)
