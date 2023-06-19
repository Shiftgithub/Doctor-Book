from rest_framework import serializers
from .models.department_department_models import *


class DepartmentSpecificationStoreSerializer(serializers.ModelSerializer):
    class Meta:
        model = DepartmentSpecification
        fields = '__all__'


class DepartmentSpecificationSerializer(serializers.ModelSerializer):
    department = serializers.CharField(source='department_name')
    department = serializers.CharField(source='problemspecification')

    class Meta:
        model = DepartmentSpecification
        fields = ['id', 'description', 'department', 'specification', 'created_at', 'updated_at']


class DepartmentSpecificationDeleteSerializer(serializers.ModelSerializer):
    class Meta:
        model = DepartmentSpecification
        fields = ['deleted_at']
