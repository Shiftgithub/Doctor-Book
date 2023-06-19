from rest_framework import serializers
from adminpanel.models.problem_specification_models import *


class ProblemSpecificationStoreSerializer(serializers.ModelSerializer):
    class Meta:
        model = ProblemSpecification
        fields = '__all__'


class ProblemSpecificationSerializer(serializers.ModelSerializer):
    organ_problem_name = serializers.CharField(source='organ_problem')

    class Meta:
        model = ProblemSpecification
        fields = ['id', 'specification', 'description', 'created_at', 'updated_at', 'organ_problem_name']


class ProblemSpecificationDeleteSerializer(serializers.ModelSerializer):
    class Meta:
        model = ProblemSpecification
        fields = ['deleted_at']


class ProblemSpecificationOrganProblemSerializer(serializers.ModelSerializer):
    class Meta:
        model = ProblemSpecification
        fields = ['id', 'specification']
