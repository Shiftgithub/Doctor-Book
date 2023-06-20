from datetime import datetime
from django.db import connection
from rest_framework.response import Response
from rest_framework.decorators import api_view
from adminpanel.models.department_specification_models import *
from adminpanel.serializers.organ_problem_specification_serializers import *


# store organ problem data
@api_view(['POST'])
def store_organ_problem_specification_data(request):
    if request.method == 'POST':
        organ_id = request.POST.get('organ')
        problems = request.POST.getlist('problems[]')
        problem_specifications = request.POST.getlist('problem_specifications[]')
        organ_id = Organ.objects.get(id=organ_id)

        for problem, problem_specification in zip(problems, problem_specifications):
            organ_problem_specification_obj = OrgansProblemSpecification(organ=organ_id, problem=problem,
                                                           problem_specification=problem_specification)
            organ_problem_specification_obj.save()
        return Response({'status': 200})
    else:
        return Response({'status': 403})


# all organproblem data
@api_view(['GET'])
def get_all_organ_problem_specification_list(request):
    query = """SELECT organ_problem_speci.id, organ_problem_speci.problem, organ_problem_speci.problem_specification, organ.name AS organ_name FROM adminpanel_organsproblemspecification AS organ_problem_speci INNER JOIN adminpanel_organ AS organ ON organ_problem_speci.organ_id = organ.id WHERE organ_problem_speci.deleted_at IS NULL ORDER BY organ_problem_speci.id ASC """
    with connection.cursor() as cursor:
        cursor.execute(query)
        results = cursor.fetchall()
    organ_problem_specifications = []
    for row in results:
        organ_problem_specification = {
            'id': row[0],
            'problem': row[1],
            'problem_specification': row[2],
            'organ_name': row[3],
        }
        organ_problem_specifications.append(organ_problem_specification)
    serializer = OrganProblemSerializer(organ_problem_specifications, many=True)
    serialized_data = serializer.data
    return Response(serialized_data)


# single organ problem data using id

@api_view(['GET'])
def organ_problem_specification_dataview(request, organ_problem_specification_id):
    query = """SELECT organ_problem_speci.id, organ_problem_speci.problem,
     organ_problem_speci.problem_specification, organ.name AS organ_name 
     FROM adminpanel_organsproblemspecification AS organ_problem_speci 
     INNER JOIN adminpanel_organ AS organ ON organ_problem_speci.organ_id = organ.id 
     WHERE organ_problem_speci.id = %s AND organ_problem_speci.deleted_at IS NULL 
     ORDER BY organ_problem_speci.id ASC"""
    with connection.cursor() as cursor:
        cursor.execute(query, [organ_problem_specification_id])
        results = cursor.fetchall()

    for row in results:
        organ_problem_specification_specification = {
            'id': row[0],
            'problem': row[1],
            'problem_specification': row[2],
            'organ_name': row[3],
        }
    serializer = OrganProblemSerializer(instance=organ_problem_specification_specification)
    serialized_data = serializer.data
    return Response(serialized_data)


# edit organ problem data

@api_view(['PUT', 'POST'])
def edit_organ_problem_specification_data(request, organ_problem_specification_id):
    organ_problem_specification = OrgansProblemSpecification.objects.get(id=organ_problem_specification_id)
    serializer = OrganProblemStoreSerializer(organ_problem_specification, data=request.data)
    if serializer.is_valid():
        if serializer.save(updated_at=datetime.now()):
            return Response({'status': 200})
        else:
            return Response({'status': 403})
    else:
        return Response({'status': 403})


# delete organ problem data

@api_view(['PUT', 'GET'])
def softdelete_organ_problem_specification_data(request, organ_problem_specification_id):
    organ_problem_specification = OrgansProblemSpecification.objects.get(id=organ_problem_specification_id)
    serializer = OrganProblemDeleteSerializer(organ_problem_specification, data=request.data)
    problem_specification = DepartmentSpecification.objects.filter(organ_problem_specification_id=organ_problem_specification_id)
    if problem_specification:
        return Response({'status': 404})
    else:
        if serializer.is_valid():
            if serializer.save(deleted_at=datetime.now()):
                return Response({'status': 200})
            else:
                return Response({'status': 403})
        else:
            return Response({'status': 403})
