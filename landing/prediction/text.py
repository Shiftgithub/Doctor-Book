# from admin.bodypart.models import BodyPart
# from admin.bodypart.serializers import BodyPartSerializer
# from admin.doctor.models import DoctorProfile
# from admin.organ.models import Organ
# from admin.organ.serializers import OrganBodyPartSerializer
# from admin.department_speci.models import DepartmentSpecification
# from admin.organ_problem_speci.models import OrgansProblemSpecification
# from admin.organ_problem_speci.serializers import OrganProblemSerializer
# from sklearn.neighbors import KNeighborsClassifier
# from rest_framework.response import Response
# from rest_framework.decorators import api_view
# from .serializers import PredictionSerializer, PredictionDoctorSerializer
#
# # Assuming you have a trained KNN model and X_train, y_train
# # Replace these with your actual model and training data
# knn_model = KNeighborsClassifier(n_neighbors=3)
# X_train = # Your training data
# y_train = # Your training labels
# knn_model.fit(X_train, y_train)
#
# @api_view(['POST'])
# def prediction(request):
#     predict_serializer = PredictionSerializer(data=request.data)
#     if predict_serializer.is_valid():
#         bodypart_id = predict_serializer.validated_data.get('bodypart')
#         organ_id = predict_serializer.validated_data.get('organ')
#         problem_specs = request.POST.getlist('problem_specs[]')
#
#         department_specifications = DepartmentSpecification.objects.filter(
#             organ_problem_specification__in=problem_specs
#         )
#         print('department_specifications :',department_specifications)
#         if department_specifications.exists():
#             department_ids = department_specifications.values_list('department', flat=True)
#             if len(set(department_ids)) == 1:
#                 doctor_data = DoctorProfile.objects.filter(
#                     department__in=department_ids
#                 )
#                 doctor_serializer = PredictionDoctorSerializer(doctor_data, many=True)
#
#                 bodypart = BodyPart.objects.get(id=bodypart_id)
#                 bodypart_serializer = BodyPartSerializer(bodypart, many=False)
#
#                 organ = Organ.objects.get(id=organ_id)
#                 organ_serializer = OrganBodyPartSerializer(organ, many=False)
#
#                 problem_specs_data = []
#                 for problem_spec_id in problem_specs:
#                     try:
#                         problem_spec = OrgansProblemSpecification.objects.get(id=problem_spec_id)
#                         problem_specs_data.append(OrganProblemSerializer(problem_spec).data)
#                     except OrgansProblemSpecification.DoesNotExist:
#                         data = {'status': 403, 'message': 'Organ Problem not exist'}
#                         return Response(data)
#
#                 # Assuming you have features for prediction, you can use the k-NN model here
#                 # Replace X_new with your actual input features
#                 X_new = # Your input features
#                 prediction_result = knn_model.predict([X_new])
#
#                 response_data = {
#                     'status': 200,
#                     'bodypart_name': bodypart_serializer.data,
#                     'organ_name': organ_serializer.data,
#                     'doctors_data': doctor_serializer.data,
#                     'problem_specs': problem_specs_data,
#                     'prediction_result': prediction_result.tolist(),  # Convert to list if necessary
#                 }
#                 return Response(response_data)
#             else:
#                 return Response({'status': 403, 'message': 'DepartmentSpecifications have different departments'})
#         else:
#             return Response({'status': 403, 'message': 'DepartmentSpecification does not exist'})
#     else:
#         return Response({'status': 403, 'message': 'Invalid request'})
