from rest_framework import serializers
from admin.department.models import *


class DepartmentSerializer(serializers.ModelSerializer):
    class Meta:
        model = Department
        fields = ['id','name','description']


class DepartmentDeleteSerializer(serializers.ModelSerializer):
    class Meta:
        model = Department
        fields = ['deleted_at']
