from admin.bodypart.models import BodyPart
from admin.bodypart.serializers import BodyPartSerializer
from rest_framework.response import Response
from rest_framework.decorators import api_view
from admin.doctor.models import DoctorProfile
from admin.organ.serializers import OrganBodyPartSerializer
from admin.department_speci.models import DepartmentSpecification
from admin.organ_problem_speci.serializers import OrganProblemSerializer
from sklearn.neighbors import KNeighborsClassifier
from .serializers import *


@api_view(['POST'])
def prediction(request):
    predict_serializer = PredictionSerializer(data=request.data)

    problem_specs = request.POST.getlist('problem_specs[]')
    if predict_serializer.is_valid():
        bodypart_id = predict_serializer.validated_data.get('bodypart')
        organ_id = predict_serializer.validated_data.get('organ')

        department_specifications = DepartmentSpecification.objects.filter(
            organ_problem_specification__in=problem_specs
        )
        if department_specifications.exists():
            department_ids = department_specifications.values_list('department', flat=True)
            if len(set(department_ids)) == 1:
                doctor_data = DoctorProfile.objects.filter(
                    department__in=department_ids
                )
                doctor_serializer = PredictionDoctorSerializer(doctor_data, many=True)

                bodypart = BodyPart.objects.get(id=bodypart_id)
                bodypart_serializer = BodyPartSerializer(bodypart, many=False)

                organ = Organ.objects.get(id=organ_id)
                organ_serializer = OrganBodyPartSerializer(organ, many=False)

                problem_specs_data = []
                for problem_spec_id in problem_specs:
                    try:
                        problem_spec = OrgansProblemSpecification.objects.get(id=problem_spec_id)
                        problem_specs_data.append(OrganProblemSerializer(problem_spec).data)
                    except OrgansProblemSpecification.DoesNotExist:
                        data = {'status': 403, 'message': 'Organ Problem not exist'}
                        return Response(data)

                response_data = {
                    'status': 200,
                    'bodypart_name': bodypart_serializer.data,
                    'organ_name': organ_serializer.data,
                    'doctors_data': doctor_serializer.data,
                    'problem_specs': problem_specs_data,
                }
                return Response(response_data)
            else:
                return Response({'status': 403, 'message': 'DepartmentSpecifications have different departments'})
        else:
            return Response({'status': 403, 'message': 'DepartmentSpecification does not exist'})
