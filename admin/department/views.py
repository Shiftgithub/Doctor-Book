from .serializers import *
from django.utils import timezone
from admin.doctor.models import *
from admin.department_speci.models import *
from rest_framework.response import Response
from rest_framework.decorators import api_view


@api_view(['POST'])
def store_department_data(request):
    department_serializer = DepartmentSerializer(data=request.data)
    if department_serializer.is_valid():
        if department_serializer.save():
            return Response({'status': 200, 'message': 'Department data stored successfully'})
        else:
            return Response({'status': 403, 'message': 'Error in storing department data'})
    else:
        return Response({'status': 400, 'message': 'Invalid request!'})


@api_view(['GET'])
def get_all_departments_list(request):
    departments = Department.objects.filter(deleted_at=None).order_by('-id')
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
            return Response({'status': 200, 'message': 'Department data updated successfully'})
        else:
            return Response({'status': 403, 'message': 'Error in updating department data'})
    else:
        return Response({'status': 400, 'message': 'Invalid request!'})


# department delete function
@api_view(['PUT', 'GET'])
def softdelete_department_data(request, department_id):
    department = Department.objects.get(id=department_id)
    serializer = DepartmentDeleteSerializer(department, data=request.data)
    department_specification = DepartmentSpecification.objects.filter(department_id=department_id)
    doctors = DoctorProfile.objects.filter(department_id=department_id)
    if doctors.exists() or department_specification.exists():
        response = {'status': 404,
                    'message': 'Department cannot delete. because it is associated with Doctor Table Or Department Specification Table.'}
        return Response(response)
    else:
        if serializer.is_valid():
            if serializer.save(deleted_at=timezone.now()):
                return Response({'status': 200, 'message': 'Department data deleted successfully'})
            else:
                return Response({'status': 403, 'message': 'Error in  deleting department data'})
        else:
            return Response({'status': 400, 'message': 'Invalid request!'})
