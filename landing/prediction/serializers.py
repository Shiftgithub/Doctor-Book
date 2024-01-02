<<<<<<< HEAD
from .models import Prediction
from rest_framework import serializers
from admin.department_speci.models import *
from admin.doctor.models import DoctorProfile, ScheduleTime
=======
from admin.organ_problem_speci.serializers import OrganProblemSerializer
from .models import Prediction, Specification
from rest_framework import serializers
from admin.department_speci.models import *
from admin.doctor.models import DoctorProfile
>>>>>>> 0a0d8f532772ef8919a2217788d4c6179800016c
from admin.authentication.user.serializers import *
from admin.personal_data.serializers import *


class PredictionSerializer(serializers.ModelSerializer):
    body_part = serializers.CharField()
    organ = serializers.CharField()

    class Meta:
        model = DepartmentSpecification
        fields = [
            'body_part', 'organ'
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
<<<<<<< HEAD
=======


class SpecificationSerializer(serializers.ModelSerializer):
    class Meta:
        model = Specification
        fields = '__all__'


class SpecificationViewSerializer(serializers.Serializer):
    specification_id = serializers.IntegerField()
    body_part_id = serializers.IntegerField()
    body_part = serializers.CharField()
    organ_id = serializers.IntegerField()
    organ = serializers.CharField()
    problem_id = serializers.IntegerField()
    problem = serializers.CharField()
    problem_specification = serializers.CharField()
    department = serializers.CharField()
    department_speci = serializers.CharField()


class PredictionViewSerializer(serializers.Serializer):
    prediction_id = serializers.IntegerField()
    specifications = SpecificationViewSerializer(many=True)

    class Meta:
        fields = '__all__'


class PredictionDataSerializer(serializers.Serializer):
    body_part_id = serializers.IntegerField()
    organ_id = serializers.IntegerField()
    problem_id = serializers.IntegerField()
    department_speci_id = serializers.IntegerField()
    department_id = serializers.IntegerField()


class PredictionDataViewSerializer(serializers.Serializer):
    training_data = PredictionDataSerializer(many=True)

    class Meta:
        fields = '__all__'
>>>>>>> 0a0d8f532772ef8919a2217788d4c6179800016c
