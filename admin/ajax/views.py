from django.http import JsonResponse
from django.shortcuts import get_object_or_404

from landing.prediction.models import Prediction
from landing.prediction.serializers import PredictionViewSerializer
from .serializers import *
from datetime import timedelta, datetime
from rest_framework.response import Response
from rest_framework.decorators import api_view


@api_view(['GET'])
def get_organs_by_bodypart(request, body_part_id):
    organs = Organ.objects.filter(body_part_id=body_part_id, deleted_at__isnull=True).order_by('id')
    serializer = OrganBodyPartSerializer(organs, many=True)
    serialized_data = serializer.data
    return Response(serialized_data)


@api_view(['GET'])
def get_organ_problem_by_organ(request, organ_id):
    organs = OrgansProblemSpecification.objects.filter(organ_id=organ_id, deleted_at__isnull=True).order_by('id')
    serialized_data = OrganProblemOrganSerializer(organs, many=True).data
    return Response(serialized_data)


@api_view(['GET'])
def get_district_by_division(request, division_id):
    districts = District.objects.filter(division_id=division_id).order_by('id')
    serialized_data = DistrictByDivisionSerializer(districts, many=True).data
    return Response(serialized_data)


@api_view(['GET'])
def get_upazila_by_district(request, district_id):
    upazilas = Upazila.objects.filter(district_id=district_id).order_by('id')
    serialized_data = UpazilaByDistrictBySerializer(upazilas, many=True).data
    return Response(serialized_data)


def generate_time(request):
    # Define the start and end times
    start_time = datetime.strptime('9:00 AM', '%I:%M %p')
    end_time = datetime.strptime('3:00 PM', '%I:%M %p')

    # Initialize a list to store the time slots
    time_slots = []

    # Generate time slots with 15-minute intervals
    current_time = start_time
    while current_time <= end_time:
        end_slot_time = current_time + timedelta(minutes=15)
        time_slot = f"{current_time.strftime('%I:%M %p')} - {end_slot_time.strftime('%I:%M %p')}"
        time_slots.append(time_slot)
        current_time = end_slot_time

    # Return the time slots as a JSON response
    return time_slots


@api_view(['GET'])
def get_appointment_date_time_by_patient_name_for_medicine(request, patient_id, doctor_id):
    today_date = datetime.now().date()
    formatted_today_date = today_date.strftime('%d-%m-%Y (%A)')
    appointments = GetAppointment.objects.filter(patient=patient_id, doctor=doctor_id,
                                                 appointment_date=formatted_today_date,
                                                 for_medicine=False).order_by('id')
    serializer = AppointmentDateTimeByPatientNameSerializer(appointments, many=True)
    serialized_data = serializer.data
    return Response(serialized_data)


@api_view(['GET'])
def get_appointment_date_time_by_patient_name_for_labtest(request, patient_id, doctor_id):
    today_date = datetime.now().date()
    formatted_today_date = today_date.strftime('%d-%m-%Y (%A)')
    appointments = GetAppointment.objects.filter(patient=patient_id, doctor=doctor_id,
                                                 appointment_date=formatted_today_date,
                                                 for_labtest=False).order_by('id')
    serializer = AppointmentDateTimeByPatientNameSerializer(appointments, many=True)
    serialized_data = serializer.data
    return Response(serialized_data)


def get_prediction_view(request, prediction_id, patient_id):
    # Fetch data using Django ORM
    prediction_check = get_object_or_404(Prediction, id=prediction_id, created_by_id=patient_id, deleted_at=None)
    # Get the related specifications using the manager
    prediction_data = prediction_check.specification.all()

    # Create a dictionary with the necessary fields
    data = {
        'predictions': [{
            'problem_id': prediction.problem_specification.id,
            'problem': prediction.problem_specification.problem,
            'problem_specification': prediction.problem_specification.problem_specification,
        } for prediction in prediction_data]
    }

    # Assuming you have a serializer for this specific query
    serializer = AJAXPredictionViewSerializer(data=data)
    if serializer.is_valid():
        # Access the serialized data after validation
        serialized_data = serializer.data

        # Return JsonResponse with serialized data
        return JsonResponse(serialized_data, safe=False)
    else:
        return JsonResponse({'error': 'Serializer validation failed'}, status=400)
