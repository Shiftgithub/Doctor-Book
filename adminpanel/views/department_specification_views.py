from adminpanel.serializers.department_specification_serializers import *
from datetime import datetime
from django.db import connection
from rest_framework.response import Response
from rest_framework.decorators import api_view


@api_view(['POST'])
def store_department_specification_data(request):
    if request.method == 'POST':
        department_specification_serializer = DepartmentSpecificationStoreSerializer(
            data=request.data)
        if department_specification_serializer.is_valid():
            if department_specification_serializer.save():
                return Response({'status': 200})
            else:
                return Response({'status': 403})
        else:
            return Response({'status': 403})
    else:
        return Response({'status': 403})


@api_view(['GET'])
def get_all_department_specifications_list(request):
    query = """SELECT department_speci.id,department.name AS department_name, organ_problem_speci.problem, department_speci.description FROM adminpanel_departmentspecification AS department_speci INNER JOIN adminpanel_department AS department INNER JOIN adminpanel_organsproblemspecification AS organ_problem_speci WHERE department_speci.department_id = department.id AND department_speci.organ_problem_specification_id = organ_problem_speci.id AND department_speci.deleted_at IS NULL ORDER BY department_speci.id ASC"""
    with connection.cursor() as cursor:
        cursor.execute(query)
        results = cursor.fetchall()
    department_specifications = []
    for row in results:
        department_specification = {
            'id': row[0],
            'department_name': row[1],
            'problem_name': row[2],
            'description': row[3],
        }
        department_specifications.append(department_specification)
    serializer = DepartmentSpecificationSerializer(department_specifications, many=True)
    serialized_data = serializer.data
    print(serialized_data)
    return Response(serialized_data)


@api_view(['GET'])
def department_specification_dataview(request, department_specification_id):
    query = """SELECT department_speci.id,department.name AS department_name, organ_problem_speci.problem, department_speci.description FROM adminpanel_departmentspecification AS department_speci INNER JOIN adminpanel_department AS department INNER JOIN adminpanel_organsproblemspecification AS organ_problem_speci WHERE department_speci.id = %s AND department_speci.department_id = department.id AND department_speci.organ_problem_specification_id = organ_problem_speci.id AND department_speci.deleted_at IS NULL ORDER BY department_speci.id ASC """
    with connection.cursor() as cursor:
        cursor.execute(query, [department_specification_id])
        results = cursor.fetchall()

    for row in results:
        department_specification = {
            'id': row[0],
            'department_name': row[1],
            'problem_name': row[2],
            'description': row[3],
        }

    serializer = DepartmentSpecificationSerializer(instance=department_specification)
    serialized_data = serializer.data
    return Response(serialized_data)


# edit organ problem data

@api_view(['PUT', 'POST'])
def edit_department_specification_data(request, department_specification_id):
    department_specification = DepartmentSpecification.objects.get(id=department_specification_id)
    serializer = DepartmentSpecificationStoreSerializer(department_specification, data=request.data)
    if serializer.is_valid():
        if serializer.save(updated_at=datetime.now()):
            return Response({'status': 200})
        else:
            return Response({'status': 403})

    else:
        return Response({'status': 403})


# delete organ problem data

@api_view(['PUT', 'GET'])
def softdelete_department_specification_data(request, department_specification_id):
    department_specification = DepartmentSpecification.objects.get(id=department_specification_id)
    serializer = DepartmentSpecificationDeleteSerializer(department_specification, data=request.data)
    if serializer.is_valid():
        if serializer.save(deleted_at=datetime.now()):
            return Response({'status': 200})
        else:
            return Response({'status': 403})
    else:
        return Response({'status': 403})