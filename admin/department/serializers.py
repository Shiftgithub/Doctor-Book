from .models import *
from rest_framework import serializers


class DepartmentSerializer(serializers.ModelSerializer):
    class Meta:
        model = Department
        fields = '__all__'


class DepartmentDeleteSerializer(serializers.ModelSerializer):
    class Meta:
        model = Department
        fields = ['deleted_at']
