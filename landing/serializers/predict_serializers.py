from rest_framework import serializers
from adminpanel.models.department_specification_models import DepartmentSpecification
from adminpanel.models.doctor_models import Doctor_Profile
from adminpanel.serializers.doctor_serializers import ImageSerializer
from adminpanel.serializers.personal_data_serializers import *


class PredictionSerializer(serializers.ModelSerializer):
    organ_problem_specification_id = serializers.CharField(source='departmentdpecification.id', required=False)

    class Meta:
        model = DepartmentSpecification
        fields = [
            'organ_problem_specification_id'
        ]


class PredictionDoctorSerializer(serializers.ModelSerializer):
    images = ImageSerializer(many=True)
    department_name = serializers.CharField(source='department.name', required=False)

    class Meta:
        model = Doctor_Profile
        fields = [
            'full_name', 'biography', 'department_name', 'images'
        ]
