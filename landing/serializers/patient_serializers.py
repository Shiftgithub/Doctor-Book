from rest_framework import serializers
from landing.models.patient_models import *


class PatientSerializer(serializers.ModelSerializer):
    class Meta:
        model = Patient_Profile
        fields = '__all__'
