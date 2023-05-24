from rest_framework import serializers
from app.models import *
from .models import *


class DepartmentSerializer(serializers.ModelSerializer):
    class Meta:
        model = Department
        fields = '__all__'


class DoctorsSerializer(serializers.ModelSerializer):
    department = serializers.CharField(source='department_name')

    class Meta:
        model = Doctor
        fields = ['id', 'name', 'description', 'department']


class DoctorSerializer(serializers.ModelSerializer):
    class Meta:
        model = Doctor
        fields = '__all__'


class BodyPartSerializer(serializers.ModelSerializer):
    class Meta:
        model = BodyPart
        fields = '__all__'
