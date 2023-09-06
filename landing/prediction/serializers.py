from rest_framework import serializers
from admin.department_speci.models import *
from admin.doctor.models import Doctor_Profile
from admin.doctor.serializers import ImageSerializer
from admin.personal_data.serializers import *


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
