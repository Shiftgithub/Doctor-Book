from .serializers import *
from .models import Prediction
from admin.organ.models import Organ
from admin.bodypart.models import BodyPart
from rest_framework.response import Response
from admin.department.models import Department
from django.shortcuts import get_object_or_404
from rest_framework.decorators import api_view
from admin.bodypart.serializers import BodyPartSerializer
from admin.organ.serializers import OrganBodyPartSerializer
from admin.department_speci.models import DepartmentSpecification
from admin.organ_problem_speci.models import OrgansProblemSpecification
from admin.organ_problem_speci.serializers import OrganProblemSerializer

from django.db import connection
from collections import namedtuple


@api_view(['POST'])
def prediction(request):
    predict_serializer = PredictionSerializer(data=request.data)
    if predict_serializer.is_valid():
        body_part_id = predict_serializer.validated_data.get('bodypart')
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

                body_part = BodyPart.objects.get(id=body_part_id)
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
                                 'message': 'Department Specifications have multiple departments'}
        else:
            response_data = {'status': 403,
                             'message': 'DepartmentSpecifications dose not exits departments'}
    else:
        response_data = {'status': 400, 'message': 'Invalid data'}

    return Response(response_data)


@api_view(['GET'])
def get_all_prediction_list_by_patient(request):
    patient_id = request.session.get("patient_id")

    # Fetch all predictions for the patient using Django ORM
    predictions = Prediction.objects.filter(created_by_id=patient_id, deleted_at=None).order_by('-id')

    # Prepare a list of dictionaries representing predictions
    predictions_data = [
        {
            'prediction_id': prediction.id,
            'specifications': [
                {
                    'specification_id': spec.id,
                    'body_part_id': prediction.body_part_id,
                    'body_part': prediction.body_part.name,
                    'organ_id': prediction.organ_id,
                    'organ': prediction.organ.name,
                    'problem_id': spec.problem_specification.id,
                    'problem': spec.problem_specification.problem,
                    'problem_specification': spec.problem_specification.problem_specification,
                    'department': prediction.department.name,
                    'department_speci': prediction.department_speci.description,
                }
                for spec in prediction.specification.all()
            ]
        }
        for prediction in predictions
    ]

    # Assuming you have a serializer for this specific query
    serializer = PredictionViewSerializer(data=predictions_data, many=True)
    serializer.is_valid()

    # Access the serialized data after validation
    serialized_data = serializer.data

    return Response(serialized_data)


@api_view(['GET'])
def prediction_data_view(request, prediction_id):
    patient_id = request.session["patient_id"]

    # Fetch data using Django ORM
    prediction = get_object_or_404(Prediction, created_by_id=patient_id, id=prediction_id, deleted_at=None)

    # Get the related specifications using the manager
    specifications = prediction.specification.all()

    # Create a dictionary with the necessary fields
    data = {
        'prediction_id': prediction.id,
        'specifications': [{
            'specification_id': spec.id,
            'body_part_id': prediction.body_part.id,
            'body_part': prediction.body_part.name,
            'organ_id': prediction.organ.id,
            'organ': prediction.organ.name,
            'problem_id': spec.problem_specification.id,
            'problem': spec.problem_specification.problem,
            'problem_specification': spec.problem_specification.problem_specification,
            'department': prediction.department.name,
            'department_speci': prediction.department_speci.description
        } for spec in specifications]
    }

    # Handle the nested structure for body_part
    for spec_data in data['specifications']:
        spec_data['body_part'] = {'name': spec_data['body_part']}

    # Assuming you have a serializer for this specific query
    serializer = PredictionViewSerializer(data=data)
    serializer.is_valid()

    # Access the serialized data after validation
    serialized_data = serializer.data

    return Response(serialized_data)

# @api_view(['GET'])
# def prediction_data_view(request, prediction_id):
#     patient_id = request.session["patient_id"]
#
#     with connection.cursor() as cursor:
#         cursor.execute("""
#             SELECT
#                 prediction.id AS prediction_id,
#                 specification.id AS specification_id,
#                 body_part.id as body_part_id,
#                 body_part.name,
#                 organ.id as organ_id,
#                 organ.name,
#                 specification.problem_specification_id as problem_id,
#                 organ_problem_speci.problem,
#                 organ_problem_speci.problem_specification,
#                 department.name,
#                 department_speci.description
#             FROM
#                 specification
#             INNER JOIN prediction ON specification.prediction_id = prediction.id
#             INNER JOIN body_part ON prediction.body_part_id = body_part.id
#             INNER JOIN organ ON prediction.organ_id = organ.id
#             INNER JOIN organ_problem_speci ON specification.problem_specification_id = organ_problem_speci.id
#             INNER JOIN department ON prediction.department_id = department.id
#             INNER JOIN department_speci ON prediction.department_speci_id = department_speci.id
#             WHERE
#                 prediction.created_by_id = %s AND prediction.id = %s
#         """, [patient_id, prediction_id])
#
#         # Fetch all rows from the result set
#         rows = cursor.fetchall()
#
#     # Convert each tuple into a dictionary
#     fields = ['prediction_id', 'specification_id', 'body_part_id', 'body_part', 'organ_id', 'organ', 'problem_id',
#               'problem', 'problem_specification', 'department', 'department_speci']
#     Row = namedtuple('Row', fields)
#     rows_as_dicts = [Row(*row)._asdict() for row in rows]
#
#     # Handle the nested structure for body_part
#     for data in rows_as_dicts:
#         data['body_part'] = {'name': data['body_part']}
#
#     # Assuming you have a serializer for this specific query
#     serializer = PredictionViewSerializer(data=rows_as_dicts, many=True)
#
#     # Validate the serializer
#     serializer.is_valid()
#
#     return Response(serializer.data)
