from datetime import datetime
from django.db import connection
from django.shortcuts import get_object_or_404
from rest_framework.response import Response
from rest_framework.decorators import api_view
from adminpanel.serializers.organ_serializers import *
from adminpanel.models.organ_models import *


# store organ data
@api_view(['POST'])
def store_organ_data(request):
    if request.method == 'POST':
        body_part_id = request.POST.get('body_part')
        organs = request.POST.getlist('names[]')
        descriptions = request.POST.getlist('descriptions[]')
        body_part = BodyPart.objects.get(id=body_part_id)
        for organ, description in zip(organs, descriptions):
            organ_obj = Organ(body_part=body_part, name=organ, description=description)
            organ_obj.save()
        return Response({'status': 200})
    else:
        return Response({'status': 403})


# all organ list function
@api_view(['GET'])
def get_all_organs_list(request):
    organs = (Organ.objects.filter(deleted_at__isnull=True).select_related('body_part').order_by('id'))

    serialized_data = OrganSerializer(organs, many=True).data
    return Response(serialized_data)


# single organ data using id
@api_view(['GET'])
def organ_dataview(request, organ_id):
    organ = get_object_or_404(Organ, id=organ_id, deleted_at__isnull=True)
    serialized_data = OrganSerializer(instance=organ).data

    return Response(serialized_data)


# edit organ data

@api_view(['PUT', 'POST'])
def edit_organ_data(request, organ_id):
    organ = Organ.objects.get(id=organ_id)
    serializer = OrganStoreSerializer(organ, data=request.data)
    if serializer.is_valid():
        if (serializer.save(updated_at=datetime.now())):
            return Response({'status': 200})
        else:
            return Response({'status': 403})
    else:
        return Response({'status': 403})


# delete organ data

@api_view(['PUT', 'GET'])
def softdelete_organ_data(request, organ_id):
    organ = Organ.objects.get(id=organ_id)
    serializer = OrganDeleteSerializer(organ, data=request.data)
    organ_problems = OrgansProblem.objects.filter(organ_id=organ_id)
    if organ_problems:
        return Response({'status': 404})
    else:
        if serializer.is_valid():
            if serializer.save(deleted_at=datetime.now()):
                return Response({'status': 200})
            else:
                return Response({'status': 403})
        else:
            return Response({'status': 403})
