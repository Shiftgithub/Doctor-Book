from .views import *
from django.contrib import messages
from admin.doctor.views import doctor_data
from django.shortcuts import render, redirect
from admin.bodypart.views import get_all_body_part_list


def predict_form(request):
    response_body_part = get_all_body_part_list(request)
    body_part_data = response_body_part.data
    data = {'bodypart_data': body_part_data}
    return render(request, 'prediction/templates/form.html', data)


def predict(request):
    operation_response = prediction(request)
    message = operation_response.data.get('message')
    if operation_response.data.get('status') == 200:
        prediction_id = operation_response.data.get('prediction_id')
        request.session["prediction_id"] = prediction_id
        doctor_response = operation_response.data.get('doctors_data')
        problem_specs = operation_response.data.get('problem_specs')
        body_part_name = operation_response.data.get('body_part_name')
        organ_name = operation_response.data.get('organ_name')
        messages.add_message(request, messages.INFO, message)
        data = {
            'doctor_data': doctor_response,
            'bodypart_name': body_part_name,
            'organ_name': organ_name,
            'problem_specs': problem_specs
        }
        return render(request, 'prediction/templates/predict_result.html', data)
    elif operation_response.data.get('status') == 400:
        messages.add_message(request, messages.ERROR, message)
        return redirect('predict_form')
    elif operation_response.data.get('status') == 403:
        messages.add_message(request, messages.ERROR, message)
        return redirect('predict_form')
    elif operation_response.data.get('status') == 404:
        messages.add_message(request, messages.ERROR, message)
        return redirect('predict_form')
    else:
        messages.add_message(request, messages.ERROR, message)
        return redirect('predict_form')


def prediction_list(request):
    response_prediction = get_all_prediction_list_by_patient(request)
    prediction_data = response_prediction.data

    return render(request, 'prediction/templates/list_all.html', {'prediction_data': prediction_data})


def view_prediction_data(request, prediction_id):
    response_prediction = prediction_data_view(request, prediction_id)
    prediction_data = response_prediction.data
    print(prediction_data)

    data = {'prediction_data': prediction_data}
    return render(request, 'prediction/templates/view.html', data)



