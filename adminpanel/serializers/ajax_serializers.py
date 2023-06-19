from rest_framework import serializers
from adminpanel.models.problem_specification_models import *


class OrganBodyPartSerializer(serializers.ModelSerializer):
    class Meta:
        model = Organ
        fields = ['id', 'name']


class OrganProblemOrganSerializer(serializers.ModelSerializer):
    class Meta:
        model = OrgansProblem
        fields = ['id', 'name']


class ProblemSpecificationOrganProblemSerializer(serializers.ModelSerializer):
    class Meta:
        model = ProblemSpecification
        fields = ['id', 'specification']
