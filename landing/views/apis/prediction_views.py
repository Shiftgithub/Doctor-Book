from rest_framework.decorators import api_view
from rest_framework.response import Response
from adminpanel.models.department_specification_models import DepartmentSpecification
from adminpanel.models.doctor_models import Doctor_Profile
from landing.serializers.predict_serializers import PredictionSerializer, PredictionDoctorSerializer


@api_view(['POST'])
def prediction(request):
    predict_serializer = PredictionSerializer(data=request.data)
    problem_specs = request.POST.getlist('problem_specs[]')
    if predict_serializer.is_valid():
        department_specifications = DepartmentSpecification.objects.filter(
            organ_problem_specification__in=problem_specs
        )
        if department_specifications.exists():
            department_ids = department_specifications.values_list('department', flat=True)
            if len(set(department_ids)) == 1:
                doctor_data = Doctor_Profile.objects.filter(
                    department__in=department_ids
                )
                doctor_serializer = PredictionDoctorSerializer(doctor_data, many=True)
                return Response({'status': 200, 'doctors_data': doctor_serializer.data})
            else:
                return Response({'status': 403, 'message': 'DepartmentSpecifications have different departments'})
        else:
            return Response({'status': 403, 'message': 'DepartmentSpecification does not exist'})
    else:
        return Response({'status': 400, 'errors': predict_serializer.errors})
