from .serializers import *
from django.utils import timezone
from rest_framework.response import Response
from rest_framework.decorators import api_view
from admin.organ_problem_speci.serializers import OrganProblemViewSerializer


@api_view(['POST'])
def store_department_specification_data(request):
    department_specification_serializer = DepartmentSpecificationSerializer(
        data=request.data)
    if department_specification_serializer.is_valid():
        if department_specification_serializer.save():
            return Response({'status': 200, 'message': 'Department Specification data stored successfully'})
        else:
            return Response({'status': 403, 'message': 'Error in storing department specification data'})
    else:
        return Response({'status': 400, 'message': 'Invalid request!'})


@api_view(['GET'])
def get_all_problem_speci_depend_on_department_speci(request):
    organ_problems = OrgansProblemSpecification.objects.filter(deleted_at=None)
    serialized_data = []

    for organ_problem in organ_problems:
        specification = DepartmentSpecification.objects.filter(organ_problem_specification=organ_problem.id).exists()
        if not specification:
            serializer = OrganProblemViewSerializer(organ_problem)
            serialized_data.append(serializer.data)
    return Response(serialized_data)


@api_view(['GET'])
def get_all_department_specifications_list(request):
    department_specifications = (
        DepartmentSpecification.objects.filter(deleted_at__isnull=True).order_by('-id'))
    serialized_data = DepartmentSpecificationViewSerializer(department_specifications, many=True).data
    return Response(serialized_data)


@api_view(['GET'])
def department_specification_dataview(request, department_specification_id):
    department_specification = DepartmentSpecification.objects.get(id=department_specification_id)
    serializer = DepartmentSpecificationViewSerializer(department_specification, many=False)
    return Response(serializer.data)


# edit organ problem data

@api_view(['PUT', 'POST'])
def edit_department_specification_data(request, department_specification_id):
    department_specification = DepartmentSpecification.objects.get(id=department_specification_id)
    serializer = DepartmentSpecificationSerializer(department_specification, data=request.data)
    if serializer.is_valid():
        if serializer.save(updated_at=timezone.now()):
            return Response({'status': 200, 'message': 'Department Specification data updated successfully'})
        else:
            return Response({'status': 403, 'message': 'Error in updating department specification data'})
    else:
        return Response({'status': 400, 'message': 'Invalid request!'})


# delete organ problem data

@api_view(['PUT', 'GET'])
def softdelete_department_specification_data(request, department_specification_id):
    department_specification = DepartmentSpecification.objects.get(id=department_specification_id)
    serializer = DepartmentSpecificationDeleteSerializer(department_specification, data=request.data)
    if serializer.is_valid():
        if serializer.save(deleted_at=timezone.now()):
            return Response({'status': 200, 'message': 'Department Specification data  successfully'})
        else:
            return Response({'status': 403, 'message': 'Error in deleting department specification data'})
    else:
        return Response({'status': 400, 'message': 'Invalid request!'})
