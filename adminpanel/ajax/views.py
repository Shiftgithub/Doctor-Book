from rest_framework.response import Response
from rest_framework.decorators import api_view
from adminpanel.ajax.serializers import *


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
