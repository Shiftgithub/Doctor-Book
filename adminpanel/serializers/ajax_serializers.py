from rest_framework import serializers
from adminpanel.models.organ_problem_specification import *


class OrganBodyPartSerializer(serializers.ModelSerializer):
    class Meta:
        model = Organ
        fields = ['id', 'name']


class OrganProblemOrganSerializer(serializers.ModelSerializer):
    class Meta:
        model = OrgansProblemSpecification
        fields = ['id', 'name']
