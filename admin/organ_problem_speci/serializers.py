from rest_framework import serializers
from admin.organ_problem_speci.models import *


class OrganProblemSerializer(serializers.ModelSerializer):
    class Meta:
        model = OrgansProblemSpecification
        fields = '__all__'


class OrganProblemViewSerializer(serializers.ModelSerializer):
    organ = serializers.CharField(source='organ.name')

    class Meta:
        model = OrgansProblemSpecification
        fields = '__all__'


class OrganProblemOrganSerializer(serializers.ModelSerializer):
    class Meta:
        model = OrgansProblemSpecification
        fields = ['id', 'problem']


class OrganProblemDeleteSerializer(serializers.ModelSerializer):
    class Meta:
        model = OrgansProblemSpecification
        fields = ['deleted_at']
