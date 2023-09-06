from rest_framework import serializers
from admin.department_speci.models import *
from admin.doctor.models import Doctor_Profile
from admin.authentication.user.serializers import *
from admin.bodypart.models import *
from admin.organ.models import *


class PredictionSerializer(serializers.ModelSerializer):
    bodypart = serializers.CharField(source='bodypart.name', required=False)
    organ = serializers.CharField(source='organ.name', required=False)
    organ_problem_specification_id = serializers.CharField(source='departmentdpecification.id', required=False)

    class Meta:
        model = DepartmentSpecification
        fields = [
            'bodypart', 'organ', 'organ_problem_specification_id'
        ]


class PredictionDoctorSerializer(serializers.ModelSerializer):
    images = ImageSerializer(source='user.images', many=True)
    department_name = serializers.CharField(source='department.name', required=False)

    class Meta:
        model = Doctor_Profile
        fields = [
            'full_name', 'biography', 'department_name', 'images'
        ]
