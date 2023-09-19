from rest_framework import serializers
from admin.department_speci.models import *


class DepartmentSpecificationSerializer(serializers.ModelSerializer):
    class Meta:
        model = DepartmentSpecification
        fields = '__all__'


class DepartmentSpecificationViewSerializer(serializers.ModelSerializer):
    department = serializers.CharField(source='department.name')
    problem = serializers.CharField(source='organ_problem_specification.problem')

    class Meta:
        model = DepartmentSpecification
        fields = '__all__'


class DepartmentSpecificationDeleteSerializer(serializers.ModelSerializer):
    class Meta:
        model = DepartmentSpecification
        fields = ['deleted_at']
