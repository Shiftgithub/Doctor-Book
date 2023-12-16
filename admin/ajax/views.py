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
