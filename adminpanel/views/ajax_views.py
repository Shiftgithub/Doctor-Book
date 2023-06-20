from django.db import connection
from rest_framework.response import Response
from rest_framework.decorators import api_view
from adminpanel.serializers.ajax_serializers import *


@api_view(['GET'])
def get_organs_by_bodypart(request, body_part_id):
    query = """SELECT id, name FROM adminpanel_organ WHERE body_part_id = %s AND deleted_at IS NULL ORDER BY id ASC """
    with connection.cursor() as cursor:
        cursor.execute(query, [body_part_id])
        results = cursor.fetchall()
    organs = []
    for row in results:
        organ = {
            'id': row[0],
            'name': row[1],
        }
        organs.append(organ)
    serializer = OrganBodyPartSerializer(many=True, instance=organs)
    serialized_data = serializer.data
    return Response(serialized_data)


@api_view(['GET'])
def get_organ_problem_by_organ(request, organ_id):
    query = """SELECT * FROM adminpanel_organsproblemspecification
    WHERE organ_id = %s AND deleted_at IS NULL ORDER BY id ASC"""

    with connection.cursor() as cursor:
        cursor.execute(query, [organ_id])
        results = cursor.fetchall()
    organs = []
    for row in results:
        organ = {
            'id': row[0],
            'problem': row[1],
            'problem_specification' : row[2]
        }
        organs.append(organ)

    serializer = OrganProblemOrganSerializer(many=True, instance=organs)
    serialized_data = serializer.data
    return Response(serialized_data)

