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
                specification_serializer = SpecificationSerializer(data=request.data)
                if prediction_store_serializer.is_valid() and specification_serializer.is_valid():
                    # Save the model with the department and department_speci
                    prediction_save = prediction_store_serializer.save(
                        organ=organ,
                        body_part=body_part,
                        department=department_instance,
                        department_speci=department_speci_instance
                    )

                    spec_objs = []
                    for problem_spec_id in problem_specs:
                        try:
                            problem_spec = OrgansProblemSpecification.objects.get(id=problem_spec_id)
                            spec_obj = Specification.objects.create(
                                prediction=prediction_save,
                                problem_specification=problem_spec,
                            )
                            spec_objs.append(spec_obj)
                        except OrgansProblemSpecification.DoesNotExist:
                            data = {'status': 403, 'message': 'Organ Problem not exist'}
                            return Response(data)

                    if prediction_save and spec_objs:
                        response_data = {
                            'status': 200,
                            'prediction_id': prediction_save.id,
                            'body_part_name': body_part_serializer.data,
                            'organ_name': organ_serializer.data,
                            'doctors_data': doctor_serializer.data,
                            'problem_specs': problem_specs_data,
                            'message': 'Here are all Doctor List',
                        }
                        return Response(response_data)
                    else:
                        response_data = {'status': 403, 'message': 'Error in prediction storing data.'}
                else:
                    response_data = {'status': 400, 'message': 'Invalid request!'}
            else:
                response_data = {'status': 403,
                                 'message': 'Department have multiple departments'}
        else:
            response_data = {'status': 403,
                             'message': 'DepartmentSpecifications have different departments'}
    else:
        response_data = {'status': 400, 'message': 'Invalid data'}

    return Response(response_data)


@api_view(['GET'])
def get_all_prediction_list_by_patient(request):
    patient_id = request.session["patient_id"]

    predictions = Prediction.objects.filter(created_by=patient_id, deleted_at=None).order_by('-id')
    serialized_data = PredictionViewSerializer(predictions, many=True).data

    return Response(serialized_data)


@api_view(['GET'])
def prediction_data_view(request, prediction_id):
    patient_id = request.session["patient_id"]

    predictions = Prediction.objects.filter(id=prediction_id, created_by_id=patient_id, deleted_at=None).order_by('-id')
    serialized_data = PredictionViewSerializer(predictions, many=True).data

    return Response(serialized_data)


@api_view(['GET'])
def specification_data_view(request, prediction_id):
    specifications = Specification.objects.filter(prediction=prediction_id).order_by('-id')
    serialized_data = SpecificationViewSerializer(specifications, many=True).data

    return Response(serialized_data)
