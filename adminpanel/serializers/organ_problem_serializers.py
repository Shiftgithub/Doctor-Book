from rest_framework import serializers
from adminpanel.models.organ_problem_models import *


class OrganProblemStoreSerializer(serializers.ModelSerializer):
    class Meta:
        model = OrgansProblem
        fields = '__all__'


class OrganProblemSerializer(serializers.ModelSerializer):
    organ = serializers.CharField(source='organ_name')

    class Meta:
        model = OrgansProblem
        fields = ['id', 'name', 'description', 'created_at', 'updated_at', 'organ']


class OrganProblemOrganSerializer(serializers.ModelSerializer):
    class Meta:
        model = OrgansProblem
        fields = ['id', 'name']


class OrganProblemDeleteSerializer(serializers.ModelSerializer):
    class Meta:
        model = OrgansProblem
        fields = ['deleted_at']
