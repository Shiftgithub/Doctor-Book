from django.utils import timezone
from rest_framework.response import Response
from rest_framework.decorators import api_view
from admin.department_speci.serializers import *


@api_view(['POST'])
def store_department_specification_data(request):
    department_specification_serializer = DepartmentSpecificationSerializer(
        data=request.data)
    if department_specification_serializer.is_valid():
        if department_specification_serializer.save():
            return Response({'status': 200})
        else:
            return Response({'status': 403})
    else:
        return Response({'status': 403})


@api_view(['GET'])
def get_all_department_specifications_list(request):
    department_specifications = (
        DepartmentSpecification.objects.filter(deleted_at__isnull=True).order_by('id'))
    serialized_data = DepartmentSpecificationViewSerializer(department_specifications, many=True).data
    return Response(serialized_data)


@api_view(['GET'])
def department_specification_dataview(request, department_specification_id):
    # getting bodypart data from department specification model ...
    department_specification = DepartmentSpecification.objects.get(id=department_specification_id)

    # serializing faq data ...
    serializer = DepartmentSpecificationViewSerializer(department_specification, many=False)

    return Response(serializer.data)


# edit organ problem data

@api_view(['PUT', 'POST'])
def edit_department_specification_data(request, department_specification_id):
    department_specification = DepartmentSpecification.objects.get(id=department_specification_id)
    serializer = DepartmentSpecificationSerializer(department_specification, data=request.data)
    if serializer.is_valid():
        if serializer.save(updated_at=timezone.now()):
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
        if serializer.save(deleted_at=timezone.now()):
            return Response({'status': 200})
        else:
            return Response({'status': 403})
    else:
        return Response({'status': 403})
