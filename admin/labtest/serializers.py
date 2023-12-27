from .models import *
from rest_framework import serializers


class LabTestSerializer(serializers.ModelSerializer):
    class Meta:
        model = LabTest
        fields = '__all__'


class LabTestDeleteSerializer(serializers.ModelSerializer):
    class Meta:
        model = LabTest
        fields = ['deleted_at']
