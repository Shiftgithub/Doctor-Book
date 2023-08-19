from django.shortcuts import render, redirect
from django.contrib import messages
from adminpanel.bodypart.views import get_all_bodypart_list
from landingpanel.prediction.views import prediction


def predict_form(request):
    response_bodypart = get_all_bodypart_list(request)
    bodypart_data = response_bodypart.data
    return render(request, 'prediction/templates/predict.html', {'bodypart_data': bodypart_data})


def predict(request):
    operation_response = prediction(request)
    if operation_response.data.get('status') == 200:
        doctor_data = operation_response.data.get('doctors_data')
        messages.add_message(request, messages.INFO, "Here are all Doctor List ")
        return render(request, 'prediction/templates/predict_result.html', {'doctor_data': doctor_data})
    else:
        messages.add_message(request, messages.ERROR, "Error")
        return redirect('predict_form')
