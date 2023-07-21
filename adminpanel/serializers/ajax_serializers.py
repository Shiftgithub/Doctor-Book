from rest_framework import serializers
from adminpanel.models.personal_data_models import *
from adminpanel.models.organ_problem_specification_models import *


class OrganBodyPartSerializer(serializers.ModelSerializer):
    class Meta:
        model = Organ
        fields = ['id', 'name']


class OrganProblemOrganSerializer(serializers.ModelSerializer):
    class Meta:
        model = OrgansProblemSpecification
        fields = ['id', 'problem', 'problem_specification']


class DistrictByDivisionSerializer(serializers.ModelSerializer):
    class Meta:
        model = District
        fields = ['id', 'name']


class UpazilaByDistrictBySerializer(serializers.ModelSerializer):
    class Meta:
        model = Upazila
        fields = ['id', 'name']
