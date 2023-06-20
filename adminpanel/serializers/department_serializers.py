from rest_framework import serializers
from adminpanel.models.department_models import *


class DepartmentSerializer(serializers.ModelSerializer):
    class Meta:
        model = Department
        fields = ['id','name','description']


class DepartmentDeleteSerializer(serializers.ModelSerializer):
    class Meta:
        model = Department
        fields = ['deleted_at']
