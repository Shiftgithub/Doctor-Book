from .views import *
from admin.doctor.views import *
from django.contrib import messages
from admin.personal_data.views import *
from landing.appointment.views import *
from django.shortcuts import render, redirect
from admin.bodypart.views import get_all_body_part_list
from landing.prediction.views import prediction


def patient_form(request):
    return render(request, "patient/templates/form.html")


def store_patient(request):
    operation_response = store_patient_data(request)

    message = operation_response.data.get('message')
    if operation_response.data.get('status') == 200:
        email = operation_response.data.get("email")
        request.session["temp_verify_email"] = email
        messages.add_message(request, messages.INFO, message)
        return redirect("otp_form")
    elif operation_response.data.get('status') == 400:
        messages.add_message(request, messages.ERROR, message)
        return redirect("add_patient_form")
    elif operation_response.data.get('status') == 403:
        messages.add_message(request, messages.ERROR, message)
        return redirect("add_patient_form")
    else:
        messages.add_message(request, messages.ERROR, message)
        return redirect("add_patient_form")


def patient_form_for_doctor(request):
    response_gender = gender_list(request)
    gender_data = response_gender.data

    response_religion = religion_list(request)
    religion_data = response_religion.data

    response_blood_group = blood_group_list(request)
    blood_group_data = response_blood_group.data

    response_matrimony = matrimony_list(request)
    matrimony_data = response_matrimony.data

    data = {
        "gender_data": gender_data,
        "religion_data": religion_data,
        "blood_group_data": blood_group_data,
        "matrimony_data": matrimony_data,
    }
    return render(request, "patient/templates/patient_form.html", data)


def store_patient_by_doctor(request):
    operation_response = store_patient_data(request)
    message = operation_response.data.get('message')
    if operation_response.data.get('status') == 200:
        messages.add_message(request, messages.INFO, message)
    elif operation_response.data.get('status') == 400:
        messages.add_message(request, messages.ERROR, message)
    elif operation_response.data.get('status') == 403:
        messages.add_message(request, messages.ERROR, message)
    else:
        messages.add_message(request, messages.ERROR, message)
    return redirect("patient_form")


def get_patient_data(request):
    response = get_patients_list(request)
    all_data = response.data
    return render(request, 'patient/templates/list_all.html', {'all_data': all_data})


def view_patient(request, patient_id):
    admin_id = request.session.get('admin_id')
    doctor_id = request.session.get('doctor_id')
    patient_session_id = request.session.get('patient_id')
    if admin_id is not None or doctor_id is not None or patient_session_id == patient_id:
        response_patient_data = patient_data(request, patient_id)
        patient_all_data = response_patient_data.data
        data = {"patient_all_data": patient_all_data, "patient_id": patient_id}
        return render(request, "patient/templates/view.html", data)
    else:
        return redirect('patient_dashboard')


def edit_patient_form(request, patient_id):
    admin_id = request.session.get('admin_id')
    doctor_id = request.session.get('doctor_id')
    patient_session_id = request.session.get('doctor_id')
    if admin_id is not None or doctor_id is not None or patient_session_id == patient_id:
        response_gender = gender_list(request)
        gender_data = response_gender.data

        response_religion = religion_list(request)
        religion_data = response_religion.data

        response_blood_group = blood_group_list(request)
        blood_group_data = response_blood_group.data

        response_matrimony = matrimony_list(request)
        matrimony_data = response_matrimony.data

        response_patient = patient_data(request, patient_id)
        patient_all_data = response_patient.data

        data = {
            "gender_data": gender_data,
            "religion_data": religion_data,
            "blood_group_data": blood_group_data,
            "matrimony_data": matrimony_data,
            "patient_all_data": patient_all_data,
            "patient_id": patient_id,
        }
        return render(request, "patient/templates/edit.html", data)
    else:
        return redirect('patient_dashboard')


def edit_patient(request, patient_id):
    operation_response = edit_patient_data(request, patient_id)
    message = operation_response.data.get('message')
    if operation_response.data.get('status') == 200:
        messages.add_message(request, messages.INFO, message)
    elif operation_response.data.get('status') == 400:
        messages.add_message(request, messages.ERROR, message)
    elif operation_response.data.get('status') == 403:
        messages.add_message(request, messages.ERROR, message)
    else:
        messages.add_message(request, messages.ERROR, message)
    return redirect("edit_patient_form", patient_id=patient_id)


def find_doctors(request):
    response_doctor = get_all_doctors_list(request)
    doctor_data = response_doctor.data
    return render(
        request, "patient/templates/find_doctors.html", {"doctor_data": doctor_data}
    )


def patient_predict_form(request):
    response_body_part = get_all_body_part_list(request)
    body_part_data = response_body_part.data
    return render(
        request, "patient/templates/prediction.html", {"bodypart_data": body_part_data}
    )


def predict_result(request):
    operation_response = prediction(request)
    if operation_response.data.get("status") == 200:
        doctor_data = operation_response.data.get("doctors_data")
        problem_specs = operation_response.data.get("problem_specs")
        bodypart_name = operation_response.data.get("body_part_name")
        organ_name = operation_response.data.get("organ_name")
        messages.add_message(request, messages.INFO, "Here are all Doctor List ")
        data = {
            "doctor_data": doctor_data,
            "bodypart_name": bodypart_name,
            "organ_name": organ_name,
            "problem_specs": problem_specs,
        }
        return render(request, "patient/templates/predict_result.html", data)
    else:
        messages.add_message(request, messages.ERROR, "Error")
        return redirect("patient_predict_form")


def doctor_profile(request, doctor_id):
    response_doctor = doctor_data(request, doctor_id)
    doctor_all_data = response_doctor.data
    return render(request, "patient/templates/doctor_profile.html", {"doctor_all_data": doctor_all_data})


def appointment(request, doctor_id):
    response_doctor = doctor_data(request, doctor_id)
    doctor_all_data = response_doctor.data
    days = generate_date(request, doctor_id)
    request.session['temp_doctor_id'] = doctor_id

    data = {
        'date_list': days,
        'doctor_all_data': doctor_all_data,
    }
    return render(request, "patient/templates/appointment.html", data)
