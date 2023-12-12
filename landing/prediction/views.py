from .serializers import *
from .models import Prediction
from admin.organ.models import Organ
from admin.bodypart.models import BodyPart
from rest_framework.response import Response
from admin.department.models import Department
from rest_framework.decorators import api_view
from admin.patient.models import PatientProfile
from admin.bodypart.serializers import BodyPartSerializer
from admin.organ.serializers import OrganBodyPartSerializer
from admin.department_speci.models import DepartmentSpecification
from admin.organ_problem_speci.models import OrgansProblemSpecification
from admin.organ_problem_speci.serializers import OrganProblemSerializer


@api_view(['POST'])
def prediction(request):
    predict_serializer = PredictionSerializer(data=request.data)
    if predict_serializer.is_valid():
        bodypart_id = predict_serializer.validated_data.get('bodypart')
        organ_id = predict_serializer.validated_data.get('organ')
        problem_specs = request.POST.getlist('problem_specs[]')
        print(problem_specs)

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

                body_part = BodyPart.objects.get(id=bodypart_id)
                body_part_serializer = BodyPartSerializer(body_part, many=False)

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

                # Assuming Prediction model has fields 'department' and 'department_speci'
                department_instance = Department.objects.get(id=department_ids[0])
                department_speci_instance = department_specifications.first()

                prediction_store_serializer = PredictionStoreSerializer(data=request.data)
                if prediction_store_serializer.is_valid():
                    print(prediction_store_serializer)
                    # Save the model with the department and department_speci
                    save = prediction_store_serializer.save(
                        organ=organ,
                        body_part=body_part,  # Change 'bodypart' to 'body_part'
                        department=department_instance,
                        department_speci=department_speci_instance
                    )

                    if save:
                        response_data = {
                            'status': 200,
                            'body_part_name': body_part_serializer.data,
                            'organ_name': organ_serializer.data,
                            'doctors_data': doctor_serializer.data,
                            'problem_specs': problem_specs_data,
                        }
                        return Response(response_data)
                    else:
                        response_data = {'status': 403,
                                         'message': 'DepartmentSpecifications have different departments'}
                else:
                    response_data = {'status': 403,
                                     'message': 'DepartmentSpecifications have different departments'}
            else:
                response_data = {'status': 403,
                                 'message': 'DepartmentSpecifications have different departments'}
        else:
            response_data = {'status': 403,
                             'message': 'DepartmentSpecifications have different departments'}
    else:
        response_data = {'status': 400, 'message': 'Invalid data'}

    return Response(response_data)
