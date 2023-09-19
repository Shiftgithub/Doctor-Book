from .models import *
from rest_framework import serializers


class PrescriptionSerializer(serializers.ModelSerializer):
    class Meta:
        model = Prescription
        fields = '__all__'


class PrescriptionDeleteSerializer(serializers.ModelSerializer):
    class Meta:
        model = Prescription
        fields = ['deleted_at']


class PrescriptionMedicineSerializer(serializers.ModelSerializer):
    class Meta:
        model = PrescriptionMedicine
        fields = '__all__'


class MedicineScheduleSerializer(serializers.ModelSerializer):
    class Meta:
        model = MedicineSchedule
        fields = '__all__'


class LabTestSerializer(serializers.ModelSerializer):
    class Meta:
        model = LabTest
        fields = '__all__'


class PrescriptionLabTestSerializer(serializers.ModelSerializer):
    class Meta:
        model = PrescriptionLabTest
        fields = '__all__'
