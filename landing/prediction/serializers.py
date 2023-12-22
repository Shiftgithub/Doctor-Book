from admin.organ_problem_speci.serializers import OrganProblemSerializer
from .models import Prediction, Specification
from rest_framework import serializers
from admin.department_speci.models import *
from admin.doctor.models import DoctorProfile
from admin.authentication.user.serializers import *
from admin.personal_data.serializers import *


class PredictionSerializer(serializers.ModelSerializer):
    bodypart = serializers.CharField()
    organ = serializers.CharField()

    class Meta:
        model = DepartmentSpecification
        fields = [
            'bodypart', 'organ'
        ]


class PredictionDoctorSerializer(serializers.ModelSerializer):
    images = ImageSerializer(source='user.images', many=True)
    department_name = serializers.CharField(source='department.name', required=False)

    class Meta:
        model = DoctorProfile
        fields = [
            'id', 'full_name', 'biography', 'department_name', 'images'
        ]


class PredictionStoreSerializer(serializers.ModelSerializer):
    class Meta:
        model = Prediction
        fields = '__all__'


class PredictionUpdateSerializer(serializers.ModelSerializer):
    class Meta:
        model = Prediction
        fields = ['id', 'created_by']


class SpecificationSerializer(serializers.ModelSerializer):
    class Meta:
        model = Specification
        fields = '__all__'


class PredictionViewSerializer(serializers.ModelSerializer):
    body_part = serializers.CharField(source='body_part.name')
    organ = serializers.CharField(source='organ.name')
    department = serializers.CharField(source='department.name')
    department_speci = serializers.CharField(source='department_speci.description')

    class Meta:
        model = Prediction
        fields = '__all__'


class SpecificationViewSerializer(serializers.ModelSerializer):
    problem = serializers.CharField(source='problem_specification.problem')
    problem_specification = serializers.CharField(source='problem_specification.problem_specification')

    class Meta:
        model = Specification
        fields = '__all__'
