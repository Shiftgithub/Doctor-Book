from rest_framework import serializers
from .models.doctor_models import *

class DoctorsSerializer(serializers.ModelSerializer):
    department = serializers.CharField(source='department_name')

    class Meta:
        model = Doctor
        fields = ['id', 'name', 'description', 'department']


class DoctorSerializer(serializers.ModelSerializer):
    class Meta:
        model = Doctor
        fields = '__all__'
