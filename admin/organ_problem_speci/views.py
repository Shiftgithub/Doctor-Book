from .serializers import *
from django.utils import timezone
from admin.department_speci.models import *
from rest_framework.response import Response
from rest_framework.decorators import api_view
from rest_framework.generics import get_object_or_404


# store organ problem data
@api_view(['POST'])
def store_organ_problem_specification_data(request):
    try:
        organ_id = request.POST.get('organ')
        problems = request.POST.getlist('problems[]')
        problem_specis = request.POST.getlist('problem_specifications[]')
        organ_id = get_object_or_404(Organ, id=organ_id)

        for problem, problem_speci in zip(problems, problem_specis):
            problem_speci_obj = OrgansProblemSpecification(organ=organ_id, problem=problem,
                                                           problem_specification=problem_speci)
            problem_speci_obj.save()
        return Response({'status': 200})
    except Exception as e:
        # Handle other exceptions here if needed
        return Response({'status': 500, 'error': str(e)})


# all organproblem data
@api_view(['GET'])
def get_all_organ_problem_specification_list(request):
    organ_problem_specifications = (
        OrgansProblemSpecification.objects.filter(deleted_at__isnull=True).select_related('organ').order_by('id'))
    serialized_data = OrganProblemViewSerializer(organ_problem_specifications, many=True).data
    return Response(serialized_data)


# single organ problem data using id
@api_view(['GET'])
def organ_problem_specification_dataview(request, organ_problem_specification_id):
    organ_problem_specification = get_object_or_404(OrgansProblemSpecification, id=organ_problem_specification_id,
                                                    deleted_at__isnull=True)
    serialized_data = OrganProblemViewSerializer(instance=organ_problem_specification).data

    return Response(serialized_data)


# edit organ problem data

@api_view(['PUT', 'POST'])
def edit_organ_problem_specification_data(request, organ_problem_specification_id):
    organ_problem_specification = OrgansProblemSpecification.objects.get(id=organ_problem_specification_id)
    serializer = OrganProblemSerializer(organ_problem_specification, data=request.data)
    if serializer.is_valid():
        if serializer.save(updated_at=timezone.now()):
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
    problem_specification = DepartmentSpecification.objects.filter(
        organ_problem_specification_id=organ_problem_specification_id)
    if problem_specification:
        return Response({'status': 404})
    else:
        if serializer.is_valid():
            if serializer.save(deleted_at=timezone.now()):
                return Response({'status': 200})
            else:
                return Response({'status': 403})
        else:
            return Response({'status': 403})
