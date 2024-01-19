import os
import csv
import numpy as np
import matplotlib.pyplot as plt

from admin.department.serializers import DepartmentSerializer
from admin.department_speci.serializers import DepartmentSpecificationSerializer
from .serializers import *
from .models import Prediction
from admin.organ.models import Organ
from admin.bodypart.models import BodyPart
from rest_framework.response import Response
from admin.department.models import Department
from django.shortcuts import get_object_or_404
from rest_framework.decorators import api_view
from admin.bodypart.serializers import BodyPartSerializer
from admin.organ.serializers import OrganBodyPartSerializer, OrganSerializer
from admin.department_speci.models import DepartmentSpecification
from admin.organ_problem_speci.models import OrgansProblemSpecification
from admin.organ_problem_speci.serializers import OrganProblemSerializer

from sklearn.neighbors import KNeighborsClassifier
from sklearn.preprocessing import StandardScaler
from sklearn.pipeline import make_pipeline


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

    return knn_model, labels


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
        save_raw_prediction_data_to_csv(prediction_list)

        if department_specifications.exists():
            department_ids = department_specifications.values_list('department', flat=True)

            doctor_department_id = department_ids[0]
            department_specification_id = department_specifications.first().id

            # Train the KNN model using the training data
            knn_model, labels = train_knn_model(prediction_list)

            knn_model = knn_model
            # Extract features from the input data
            for problem_spec_id in problem_specs:
                features = [
                    body_part_id,
                    organ_id,
                    problem_spec_id,
                    department_specification_id,
                ]
                # Convert the features to a 2D array
                features_2d = np.array(features).reshape(1, -1)

                # Make a prediction using the trained KNN model
                predicted_department_id = knn_model.predict(features_2d)[0]
                # Check accuracy and save matplotlib image
                accuracy = knn_model.score(features_2d, [labels[0]])
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
                        problem_specification = OrgansProblemSpecification.objects.get(id=problem_spec_id)
                        problem_specs_data.append(OrganProblemSerializer(problem_specification).data)
                    except OrgansProblemSpecification.DoesNotExist:
                        data = {'status': 403, 'message': 'Organ Problem not exist'}
                        return Response(data)

                # Assuming Prediction model has fields 'department' and 'department_speci'
                department_instance = Department.objects.get(id=department_ids[0])
                department_speci_instance = department_specifications.first()

                prediction_store_serializer = PredictionStoreSerializer(data=request.data)
                specification_serializer = SpecificationSerializer(data=request.data)
                if prediction_store_serializer.is_valid() and specification_serializer.is_valid():
                    # Save the model with the department and department_specification
                    prediction_save = prediction_store_serializer.save(
                        organ=organ,
                        body_part=body_part,
                        department=department_instance,
                        department_speci=department_speci_instance,
                    )
                    spec_objs = []
                    for problem_spec_id in problem_specs:
                        try:
                            problem_spec = OrgansProblemSpecification.objects.get(id=problem_spec_id)
                            spec_obj = Specification.objects.create(
                                prediction=prediction_save,
                                problem_specification=problem_spec,
                                accuracy=accuracy,
                            )
                            save_matplotlib_image(body_part_id, organ_id, problem_spec_id,
                                                  department_specification_id,
                                                  predicted_department_id, accuracy, spec_obj.id)
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
                    'body_part_name': prediction.body_part.name,
                    'organ_id': prediction.organ_id,
                    'organ_name': prediction.organ.name,
                    'problem_id': spec.problem_specification.id,
                    'problem_name': spec.problem_specification.problem,
                    'problem_specification_name': spec.problem_specification.problem_specification,
                    'department_speci_id': prediction.department_speci.id,
                    'description': prediction.department_speci.description,
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
                    'graph_path': spec.graph_path,
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
            'graph_path': spec.graph_path,
            'body_part_id': prediction.body_part.id,
            'body_part': prediction.body_part.name,
            'organ_id': prediction.organ.id,
            'organ': prediction.organ.name,
            'problem_id': spec.problem_specification.id,
            'problem': spec.problem_specification.problem,
            'problem_specification': spec.problem_specification.problem_specification,
            'department': prediction.department.name,
            'department_speci': prediction.department_speci.description,
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
    print(serialized_data)

    return Response(serialized_data)


def save_prediction_to_csv(dataset):
    # Define the file path where you want to save the CSV file
    dataset_directory = 'media/uploads/dataset/'
    # Create the directory if it does not exist
    os.makedirs(dataset_directory, exist_ok=True)
    file_path = os.path.join(dataset_directory, 'prediction_data.csv')

    # Create a CSV writer and write the header
    with open(file_path, 'w', newline='', encoding='utf-8') as csv_file:
        csv_writer = csv.writer(csv_file)
        csv_writer.writerow(
            ['Body Part ID', 'Organ ID', 'Problem ID', 'Department Id',
             'Department Specification Id'])

        # Write data to the CSV file
        for objs in dataset:
            for obj in objs['training_data']:
                csv_writer.writerow([
                    obj['body_part_id'],
                    obj['organ_id'],
                    obj['problem_id'],
                    obj['department_speci_id'],
                    obj['department_id'],
                ])

    # Return the file path (optional)
    return file_path


def save_raw_prediction_data_to_csv(dataset):
    # Define the file path where you want to save the CSV file
    dataset_directory = 'media/uploads/dataset/'
    # Create the directory if it does not exist
    os.makedirs(dataset_directory, exist_ok=True)
    file_path = os.path.join(dataset_directory, 'prediction_raw_data.csv')

    # Create a CSV writer and write the header
    with open(file_path, 'w', newline='', encoding='utf-8') as csv_file:
        csv_writer = csv.writer(csv_file)
        csv_writer.writerow(
            ['Body Part Name', 'Organ Name', 'Problem Name', 'Problem Specification Name', 'Description'])

        # Write data to the CSV file
        for objs in dataset:
            for obj in objs['training_data']:
                csv_writer.writerow([
                    obj['body_part_name'],
                    obj['organ_name'],
                    obj['problem_name'],
                    obj['problem_specification_name'],
                    obj['description'],
                ])

    # Return the file path (optional)
    return file_path


def save_matplotlib_image(body_part_id, organ_id, problem_spec_id,
                          department_specification_id,
                          predicted_department_id, accuracy, spec_objs):
    # Define specific colors
    colors = ['black', 'blue', 'green', 'red']
    # Convert numerical values to strings
    department = Department.objects.get(id=predicted_department_id)
    serializer = DepartmentSerializer(instance=department)
    department_name = serializer.data['name']

    # Get body part information
    body_part = BodyPart.objects.get(id=body_part_id)
    body_part_serializer = BodyPartSerializer(instance=body_part)
    body_part_name = body_part_serializer.data['name'].split(' (')[0]

    # Get organ information
    organ = Organ.objects.get(id=organ_id)
    organ_serializer = OrganSerializer(instance=organ)
    organ_name = organ_serializer.data['name'].split(' (')[0]

    # Get problem specification information
    problem_spec = OrgansProblemSpecification.objects.get(id=problem_spec_id)
    problem_spec_serializer = OrganProblemSerializer(instance=problem_spec)
    problem_spec_name = problem_spec_serializer.data['problem'].split(' (')[0]

    # Get department specification information
    department_specification = DepartmentSpecification.objects.get(id=department_specification_id)
    department_spec_serializer = DepartmentSpecificationSerializer(instance=department_specification)
    department_spec_description = department_spec_serializer.data['description'].split(' (')[0]
    specification_count = Specification.objects.count()

    # Create a bar plot
    fig, ax = plt.subplots()

    # Assuming features contain relevant data for plotting
    feature_names = ['Body Part', 'Organ', 'Problem', 'Dept. Specification']
    feature_values = [body_part_name, organ_name, problem_spec_name, department_spec_description]
    print('feature_values, feature_values', feature_values)
    # Use the 'color' parameter to set different colors for each bar
    bars = ax.bar(feature_names, [str(value) for value in feature_values], label='Features', color=colors)

    # Add labels and title
    ax.set_ylabel('Feature Values')
    ax.set_title(f'Predicted Department: {department_name}, Accuracy: {accuracy}')

    # Add annotations for each bar
    for bar, value in zip(bars, feature_values):
        height = bar.get_height()
        ax.annotate(f'{value}',
                    xy=(bar.get_x() + bar.get_width() / 2, height),
                    xytext=(0, 3),  # 3 points vertical offset
                    textcoords="offset points",
                    ha='center', va='bottom')

    graph_image_directory = 'media/uploads/graphs/'
    # Create the directory if it does not exist
    os.makedirs(graph_image_directory, exist_ok=True)
    # Save the figure to the media folder
    image_path = os.path.join(graph_image_directory, 'specification_{}.png'.format(specification_count + 1))
    plt.savefig(image_path)

    # Assuming SpecificationGraphSerializer is used for the Specification model
    specification = Specification.objects.get(id=spec_objs)
    serializer = SpecificationGraphSerializer(specification, data={'graph_path': image_path}, partial=True)
    serializer.is_valid(raise_exception=True)
    serializer.save()

    return image_path


@api_view(['GET'])
def count_predictions(request, patient_id):
    # Get the PrescriptionForLabTest instances for the given patient_id
    predictions = Prediction.objects.filter(created_by=patient_id)

    # Get the count of prediction
    prediction_count = predictions.count()

    # Serializing prediction_count
    serialized_data = {'prediction_count': prediction_count}

    return Response(serialized_data)


@api_view(['GET'])
def count_prediction_for_admin(request):
    # Get the PrescriptionForLabTest instances for the given patient_id
    predictions = Prediction.objects.filter(deleted_at=None)

    # Get the count of prediction
    prediction_count = predictions.count()

    # Serializing prediction_count
    serialized_data = {'prediction_count': prediction_count}

    return Response(serialized_data)
