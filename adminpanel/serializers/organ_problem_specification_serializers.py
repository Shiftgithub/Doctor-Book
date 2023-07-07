from rest_framework import serializers
from adminpanel.models.organ_problem_specification_models import *


class OrganProblemStoreSerializer(serializers.ModelSerializer):
    class Meta:
        model = OrgansProblemSpecification
        fields = '__all__'


class OrganProblemSerializer(serializers.ModelSerializer):
    organ = serializers.CharField(source='organ.name')

    class Meta:
        model = OrgansProblemSpecification
        fields = ['id', 'problem', 'problem_specification', 'organ']


class OrganProblemOrganSerializer(serializers.ModelSerializer):
    class Meta:
        model = OrgansProblemSpecification
        fields = ['id', 'problem']


class OrganProblemDeleteSerializer(serializers.ModelSerializer):
    class Meta:
        model = OrgansProblemSpecification
        fields = ['deleted_at']
