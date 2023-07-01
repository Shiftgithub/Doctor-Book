from rest_framework import serializers
from adminpanel.models.department_specification_models import *


class DepartmentSpecificationStoreSerializer(serializers.ModelSerializer):
    class Meta:
        model = DepartmentSpecification
        fields = '__all__'


class DepartmentSpecificationSerializer(serializers.ModelSerializer):
    department = serializers.CharField(source='department.name')
    problem = serializers.CharField(source='organ_problem_specification.problem')

    class Meta:
        model = DepartmentSpecification
        fields = ['id', 'department', 'problem', 'description']


class DepartmentSpecificationDeleteSerializer(serializers.ModelSerializer):
    class Meta:
        model = DepartmentSpecification
        fields = ['deleted_at']
