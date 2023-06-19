from adminpanel.serializers.organ_serializers import *
from datetime import datetime
from django.db import connection
from rest_framework.response import Response
from rest_framework.decorators import api_view


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
    query = """SELECT mo.id,mo.name,mo.description, mb.name AS bodypart_name 
               FROM adminpanel_organ AS mo INNER JOIN adminpanel_bodypart AS mb
               ON mo.body_part_id = mb.id WHERE mo.deleted_at IS NULL ORDER BY mo.id ASC"""
    with connection.cursor() as cursor:
        cursor.execute(query)
        results = cursor.fetchall()
    organs = []
    for row in results:
        organ = {
            'id': row[0],
            'name': row[1],
            'description': row[2],
            'bodypart_name': row[3],
        }
        organs.append(organ)
    serializer = OrganSerializer(organs, many=True)
    serialized_data = serializer.data
    return Response(serialized_data)


# single organ data using id

@api_view(['GET'])
def organ_dataview(request, organ_id):
    query = """SELECT mo.id,mo.name,mo.description,mo.created_at,mo.updated_at,
                mb.name AS bodypart_name FROM adminpanel_organ AS mo
                INNER JOIN adminpanel_bodypart AS mb ON mo.body_part_id = mb.id
                WHERE mo.id = %s AND mo.deleted_at IS NULL ORDER BY mo.id ASC"""
    with connection.cursor() as cursor:
        cursor.execute(query, [organ_id])
        results = cursor.fetchall()
    for row in results:
        organ = {
            'id': row[0],
            'name': row[1],
            'description': row[2],
            'created_at': row[3],
            'updated_at': row[4],
            'bodypart_name': row[5],
        }
    serializer = OrganSerializer(instance=organ)
    serialized_data = serializer.data
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
