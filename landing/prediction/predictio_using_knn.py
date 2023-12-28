import os
import csv

from landing.prediction.models import *
from django.conf import settings
from admin.organ.models import Organ
from admin.bodypart.models import BodyPart
from rest_framework.response import Response
from admin.doctor.models import DoctorProfile
from admin.department.models import Department
from rest_framework.decorators import api_view
from admin.bodypart.serializers import BodyPartSerializer
from admin.organ.serializers import OrganBodyPartSerializer
from admin.department_speci.models import DepartmentSpecification
from admin.organ_problem_speci.models import OrgansProblemSpecification
from admin.organ_problem_speci.serializers import OrganProblemSerializer

from sklearn.neighbors import KNeighborsClassifier
from sklearn.preprocessing import StandardScaler
from sklearn.pipeline import make_pipeline

from landing.prediction.serializers import *


def train_knn_model(dataset):
    # Extract features and labels from the training data
    features = []
    labels = []

    for training_data in dataset:
        for obj in training_data['training_data']:
            features.append([
                obj['body_part_id'],
                obj['organ_id'],
                obj['problem_id'],
                obj['department_speci_id'],
            ])
            labels.append(obj['department_id'])

    # Create and train the KNN model
    knn_model = make_pipeline(StandardScaler(), KNeighborsClassifier(n_neighbors=3))
    knn_model.fit(features, labels)

    return knn_model


@api_view(['POST'])
def prediction(request):
    predict_serializer = PredictionSerializer(data=request.data)
    if predict_serializer.is_valid():
        body_part_id = predict_serializer.validated_data.get('body_part')
        organ_id = predict_serializer.validated_data.get('organ')
        problem_specs = request.POST.getlist('problem_specs[]')
        department_specifications = DepartmentSpecification.objects.filter(
            organ_problem_specification__in=problem_specs
        )

        prediction_list = get_all_prediction_list(request)
        save_prediction_to_csv(prediction_list)

        if department_specifications.exists():
            department_ids = department_specifications.values_list('department', flat=True)

            doctor_department_id = department_ids[0]
            department_specification_id = department_specifications.first().id

            ###################################################################################

            # Train the KNN model using the training data
            knn_model = train_knn_model(prediction_list)

            knn_model = knn_model

            # Extract features from the input data
            for problem_spec_id in problem_specs:
                features = [
                    body_part_id,
                    organ_id,
                    problem_spec_id,  # You may need to process problem_specs based on your model requirements
                    department_specification_id,
                ]
                # Make a prediction using the trained KNN model
                predicted_department_id = knn_model.predict([features])[0]

            ############################################################################

            if predicted_department_id:
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


def get_all_prediction_list(request):
    predictions = Prediction.objects.filter(deleted_at=None).order_by('-id')

    # Prepare a list of dictionaries representing predictions
    predictions_data = [
        {
            'training_data': [
                {
                    'body_part_id': prediction.body_part_id,
                    'organ_id': prediction.organ_id,
                    'problem_id': spec.problem_specification.id,
                    'department_speci_id': prediction.department_speci.id,
                    'department_id': prediction.department.id,
                }
                for spec in prediction.specification.all()
            ]
        }
        for prediction in predictions
    ]

    # Assuming you have a serializer for this specific query
    serializer = PredictionDataViewSerializer(data=predictions_data, many=True)
    serializer.is_valid()

    # Access the serialized data after validation
    serialized_data = serializer.data

    return serialized_data


def save_prediction_to_csv(data):
    # Define the file path where you want to save the CSV file
    file_path = os.path.join(settings.MEDIA_ROOT, 'prediction_data.csv')

    # Create a CSV writer and write the header
    with open(file_path, 'w', newline='', encoding='utf-8') as csv_file:
        csv_writer = csv.writer(csv_file)
        csv_writer.writerow(
            ['Body Part ID', 'Organ ID', 'Problem ID', 'Department Id',
             'Department Specification Id'])

        # Write data to the CSV file
        for prediction in data:
            for spec in prediction['training_data']:
                csv_writer.writerow([
                    spec['body_part_id'],
                    spec['organ_id'],
                    spec['problem_id'],
                    spec['department_speci_id'],
                    spec['department_id'],
                ])

    # Return the file path (optional)
    return file_path
