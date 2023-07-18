from rest_framework.decorators import api_view
from rest_framework.response import Response


@api_view(['POST'])
def prediction(request):
    body_part = request.POST.get('body_part')
    organ = request.POST.get('organ')
    problem_specs = request.POST.getlist('problem_specs[]')
    print(body_part)
    print(organ)
    print(problem_specs)
    return Response({'status': 200})
