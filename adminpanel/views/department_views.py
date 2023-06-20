from datetime import datetime
from adminpanel.models.doctor_models import *
from django.db import connection
from rest_framework.response import Response
from rest_framework.decorators import api_view
from adminpanel.serializers.department_serializers import *
from adminpanel.models.department_specification_models import *


@api_view(['POST'])
def store_department_data(request):
    if request.method == 'POST':
        department_serializer = DepartmentSerializer(data=request.data)
        if department_serializer.is_valid():
            if department_serializer.save():
                return Response({'status': 200})
        else:
            return Response({'status': 403})
    else:
        return Response({'status': 403})


@api_view(['GET'])
def get_all_departments_list(request):
    query = """SELECT * FROM adminpanel_department WHERE deleted_at IS NULL ORDER BY id ASC"""
    with connection.cursor() as cursor:
        cursor.execute(query)
        results = cursor.fetchall()
    departments = []
    for row in results:
        department = {
            'id': row[0],
            'name': row[1],
            'description': row[2],
        }
        departments.append(department)

    serializer = DepartmentSerializer(departments, many=True)
    serialized_data = serializer.data
    return Response(serialized_data)


@api_view(['GET'])
def department_dataview(request, department_id):
    query = """SELECT * FROM adminpanel_department WHERE id = %s AND deleted_at IS NULL"""
    with connection.cursor() as cursor:
        cursor.execute(query, [department_id])
        results = cursor.fetchall()
    for row in results:
        department = {
            'id': row[0],
            'name': row[1],
            'description': row[2],
        }
    serializer = DepartmentSerializer(instance=department)
    serialized_data = serializer.data
    return Response(serialized_data)


# department edit funtion

@api_view(['PUT', 'POST'])
def edit_department_data(request, department_id):
    department = Department.objects.get(id=department_id)
    serializer = DepartmentSerializer(department, data=request.data)
    if serializer.is_valid():
        if serializer.save(updated_at=datetime.now()):
            return Response({'status': 200})
        else:
            return Response({'status': 403})
    else:
        return Response({'status': 403})


# department delete funtion
@api_view(['PUT', 'GET'])
def softdelete_department_data(request, department_id):
    department = Department.objects.get(id=department_id)
    serializer = DepartmentDeleteSerializer(department, data=request.data)
    department_specification = DepartmentSpecification.objects.filter(department_id =department_id)
    doctors = Doctor.objects.filter(department_id =department_id)
    if doctors.exists() or department_specification.exists():
         return Response({'status': 404})
    else:
        if serializer.is_valid():
            if serializer.save(deleted_at=datetime.now()):
                return Response({'status': 200})
            else:
                return Response({'status': 403})
        else:
            return Response({'status': 403})
