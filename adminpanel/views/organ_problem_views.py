from .models.organ_problem_models import *
from .serializers.organ_problem_serializers import *
from datetime import datetime
from doctor.models import Doctor
from django.db import connection
from rest_framework.response import Response
from rest_framework.decorators import api_view



# store organ problem data
@api_view(['POST'])
def store_organ_problem_data(request):
    if request.method == 'POST':
        organ_id = request.POST.get('organ')
        organ_problems = request.POST.getlist('names[]')
        descriptions = request.POST.getlist('descriptions[]')
        organid = Organ.objects.get(id=organ_id)

        for organ_problem, description in zip(organ_problems, descriptions):
            organ_problem_obj = OrgansProblem(organ=organid, name=organ_problem, description=description)
            organ_problem_obj.save()
        return Response({'status': 200})
    else:
        return Response({'status': 403})


# all organproblem data

@api_view(['GET'])
def get_all_organ_problem_list(request):
    query = """SELECT mop.id,mop.name,mop.description,mo.name AS organ_name
            FROM myadmin_organsproblem AS mop INNER JOIN myadmin_organ AS mo 
            ON mop.organ_id = mo.id WHERE mop.deleted_at IS NULL ORDER BY mop.id  ASC"""
    with connection.cursor() as cursor:
        cursor.execute(query)
        results = cursor.fetchall()
    organ_problems = []
    for row in results:
        organ_problem = {
            'id': row[0],
            'name': row[1],
            'description': row[2],
            'organ_name': row[3],
        }
        organ_problems.append(organ_problem)
    serializer = OrganProblemSerializer(organ_problems, many=True)
    serialized_data = serializer.data
    return Response(serialized_data)


# single organ problem data using id

@api_view(['GET'])
def organ_problem_dataview(request, organ_problem_id):
    query = """SELECT mop.id,mop.name,mop.description,mop.created_at,mop.updated_at,
                mo.name AS organ_name FROM myadmin_organsproblem AS mop INNER JOIN
                myadmin_organ AS mo ON mop.organ_id = mo.id WHERE mop.id = %s 
                AND mop.deleted_at IS NULL ORDER BY mop.id ASC"""
    with connection.cursor() as cursor:
        cursor.execute(query, [organ_problem_id])
        results = cursor.fetchall()

    for row in results:
        organ_problem = {
            'id': row[0],
            'name': row[1],
            'description': row[2],
            'created_at': row[3],
            'updated_at': row[4],
            'organ_name': row[5],
        }
    serializer = OrganProblemSerializer(instance=organ_problem)
    serialized_data = serializer.data
    return Response(serialized_data)


# edit organ problem data

@api_view(['PUT', 'POST'])
def edit_organ_problem_data(request, organ_problem_id):
    organ_problem = OrgansProblem.objects.get(id=organ_problem_id)
    serializer = OrganProblemStoreSerializer(organ_problem, data=request.data)
    if serializer.is_valid():
        if serializer.save(updated_at=datetime.now()):
            return Response({'status': 200})
        else:
            return Response({'status': 403})
    else:
        return Response({'status': 403})


# delete organ problem data

@api_view(['PUT', 'GET'])
def softdelete_organ_problem_data(request, organ_problem_id):
    organ_problem = OrgansProblem.objects.get(id=organ_problem_id)
    serializer = OrganProblemDeleteSerializer(organ_problem, data=request.data)
    problem_specification = ProblemSpecification.objects.filter(organ_problem_id =organ_problem_id)
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
