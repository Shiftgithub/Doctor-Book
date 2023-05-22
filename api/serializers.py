from rest_framework import serializers
from app.models import *
from .models import *


class DoctorSerializer(serializers.ModelSerializer):
    class Meta:
        model = Doctor
        fields = '__all__'
