from rest_framework import serializers
from adminpanel.department_speci.models import *
from adminpanel.doctor.models import Doctor_Profile
from adminpanel.doctor.serializers import ImageSerializer
from adminpanel.personal_data.serializers import *


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
