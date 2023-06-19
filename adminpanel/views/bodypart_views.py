from .models.bodypart_models import *
from .serializers.bodypart_serializers import *
from datetime import datetime
from django.db import connection
from rest_framework.response import Response
from rest_framework.decorators import api_view

# store bodypart funtion

@api_view(['POST'])
def store_bodypart_data(request):
    if request.method == 'POST':
        bodypart_serializer = BodyPartSerializer(data=request.data)
        if bodypart_serializer.is_valid():
            if bodypart_serializer.save():
                return Response({'status': 200})
            else:
                return Response({'status': 403})
        else:
            return Response({'status': 403})
    else:
        return Response({'status': 403})


# all bodypart list funtion

@api_view(['GET'])
def get_all_bodypart_list(request):
    query = """SELECT * FROM myadmin_bodypart WHERE deleted_at IS NULL ORDER BY id ASC"""
    with connection.cursor() as cursor:
        cursor.execute(query)
        results = cursor.fetchall()
    # Convert the query results into a list of dictionaries
    bodyparts = []
    for row in results:
        bodypart = {
            'id': row[0],
            'name': row[1],
            'description': row[2],
        }
        bodyparts.append(bodypart)
    serializer = BodyPartSerializer(bodyparts, many=True)
    serialized_data = serializer.data
    return Response(serialized_data)


#  bodypart data show using id funtion

@api_view(['GET'])
def bodypart_dataview(request, bodypart_id):
    query = """SELECT * FROM myadmin_bodypart WHERE id = %s AND deleted_at IS NULL"""
    with connection.cursor() as cursor:
        cursor.execute(query, [bodypart_id])
        results = cursor.fetchall()
    for row in results:
        bodypart = {
            'id': row[0],
            'name': row[1],
            'description': row[2],
            'created_at': row[3],
            'updated_at': row[4],
        }
    serializer = BodyPartSerializer(instance=bodypart)
    serialized_data = serializer.data
    return Response(serialized_data)


# bodypart edit funtion

@api_view(['PUT', 'POST'])
def edit_bodypart_data(request, bodypart_id):
    bodypart = BodyPart.objects.get(id=bodypart_id)
    serializer = BodyPartSerializer(bodypart, data=request.data)
    if serializer.is_valid():
        if serializer.save(updated_at=datetime.now()):
            return Response({'status': 200})
        else:
            return Response({'status': 403})
    else:
        return Response({'status': 403})


# bodypart delete funtion
@api_view(['PUT', 'GET'])
def softdelete_bodypart_data(request, bodypart_id):
    bodypart = BodyPart.objects.get(id=bodypart_id)
    serializer = BodyPartDeleteSerializer(bodypart, data=request.data)
    organs = Organ.objects.filter(body_part_id=bodypart_id)
    if organs:
        return Response({'status': 404})
    else:
        if serializer.is_valid():
            if serializer.save(deleted_at=datetime.now()):
                return Response({'status': 200})
            else:
                return Response({'status': 403})
        else:
            return Response({'status': 403})
