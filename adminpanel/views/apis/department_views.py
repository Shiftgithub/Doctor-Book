from django.utils import timezone
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
    departments = Department.objects.filter(deleted_at=None).order_by('id')
    serializer = DepartmentSerializer(departments, many=True)
    return Response(serializer.data)


@api_view(['GET'])
def department_dataview(request, department_id):
    department = Department.objects.get(id=department_id)

    serializer = DepartmentSerializer(instance=department)

    return Response(serializer.data)


# department edit function

@api_view(['PUT', 'POST'])
def edit_department_data(request, department_id):
    department = Department.objects.get(id=department_id)
    serializer = DepartmentSerializer(department, data=request.data)

    if serializer.is_valid():
        if serializer.save(updated_at=timezone.now()):
            return Response({'status': 200})
        else:
            return Response({'status': 403})
    else:
        return Response({'status': 403})


# department delete function
@api_view(['PUT', 'GET'])
def softdelete_department_data(request, department_id):
    department = Department.objects.get(id=department_id)
    serializer = DepartmentDeleteSerializer(department, data=request.data)
    department_specification = DepartmentSpecification.objects.filter(department_id=department_id)
    doctors = Doctor_Profile.objects.filter(department_id=department_id)
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
