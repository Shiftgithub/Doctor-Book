from .models.problem_specification_models import *
from .serializers.problem_specification_serializers import *
from datetime import datetime
from django.db import connection
from rest_framework.response import Response
from rest_framework.decorators import api_view


# problem specification store 

@api_view(['POST'])
def store_problem_specification_data(request):
    if request.method == 'POST':
        organ_problem_id = request.POST.get('organ_problem')
        specifications = request.POST.getlist('specifications[]')
        descriptions = request.POST.getlist('descriptions[]')
        organ_problem = OrgansProblem.objects.get(id=organ_problem_id)
        for specification, description in zip(specifications, descriptions):
            problem_specification_obj = ProblemSpecification(organ_problem=organ_problem,
                                                             specification=specification, description=description)
            problem_specification_obj.save()
        return Response({'status': 200})
    else:
        return Response({'status': 403})


# get all data

@api_view(['GET'])
def get_all_problem_specification_list(request):
    query = """SELECT mps.id,mps.specification,mps.description,organ_problem.name AS organ_problem_name
        FROM myadmin_problemspecification AS mps INNER JOIN myadmin_organsproblem AS organ_problem
        WHERE mps.organ_problem_id = organ_problem.id AND mps.deleted_at IS NULL ORDER BY mps.id ASC"""
    with connection.cursor() as cursor:
        cursor.execute(query)
        results = cursor.fetchall()
    problem_specifications = []
    for row in results:
        problem_specification = {
            'id': row[0],
            'specification': row[1],
            'description': row[2],
            'organ_problem': row[3],
        }
        problem_specifications.append(problem_specification)
    serializer = ProblemSpecificationSerializer(problem_specifications, many=True)
    serialized_data = serializer.data
    return Response(serialized_data)


# single problem specification data using id

@api_view(['GET'])
def problem_specification_dataview(request, problem_specification_id):
    query = """SELECT mps.id,mps.specification,mps.description,organ_problem.name AS 
            organ_problem_name,mps.created_at, mps.updated_at FROM myadmin_problemspecification 
            AS mps INNER JOIN myadmin_organsproblem AS organ_problem WHERE mps.id = %s AND
            mps.organ_problem_id = organ_problem.id AND mps.deleted_at IS NULL"""
    with connection.cursor() as cursor:
        cursor.execute(query, [problem_specification_id])
        results = cursor.fetchall()

    for row in results:
        problem_specification = {
            'id': row[0],
            'specification': row[1],
            'description': row[2],
            'organ_problem': row[3],
            'created_at': row[4],
            'updated_at': row[5],
        }
    serializer = ProblemSpecificationSerializer(instance=problem_specification)
    serialized_data = serializer.data
    return Response(serialized_data)


# edit problem specification data

@api_view(['PUT', 'POST'])
def edit_problem_specification_data(request, problem_specification_id):
    problem_specification = ProblemSpecification.objects.get(id=problem_specification_id)
    serializer = ProblemSpecificationStoreSerializer(problem_specification, data=request.data)
    if serializer.is_valid():
        if serializer.save(updated_at=datetime.now()):
            return Response({'status': 200})
        else:
            return Response({'status': 403})
    else:
        return Response({'status': 403})


# delete Problem Specification data

@api_view(['PUT', 'GET'])
def softdelete_problem_specification_data(request, problem_specification_id):
    problem_specification = ProblemSpecification.objects.get(id=problem_specification_id)
    serializer = ProblemSpecificationDeleteSerializer(problem_specification, data=request.data)
    department_specification = DepartmentSpecification.objects.filter(problem_specification_id =problem_specification_id)
    if department_specification:
        return Response({'status': 404})
    else:
        if serializer.is_valid():
            if serializer.save(deleted_at=datetime.now()):
                return Response({'status': 200})
            else:
                return Response({'status': 403})
        else:
            return Response({'status': 403})