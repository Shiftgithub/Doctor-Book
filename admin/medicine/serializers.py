from .models import *
from rest_framework import serializers


class BrandSerializer(serializers.ModelSerializer):
    class Meta:
        model = Brand
        fields = '__all__'


class GenericSerializer(serializers.ModelSerializer):
    class Meta:
        model = Generic
        fields = '__all__'


class MedicineTypeSerializer(serializers.ModelSerializer):
    class Meta:
        model = MedicineType
        fields = '__all__'


class StrengthSerializer(serializers.ModelSerializer):
    class Meta:
        model = Strength
        fields = '__all__'


class MedicineSerializer(serializers.ModelSerializer):
    class Meta:
        model = Medicine
        fields = '__all__'


class MedicineViewSerializer(serializers.ModelSerializer):
    brand_name = serializers.CharField(source='brand.name', required=False)
    generic_name = serializers.CharField(source='generic.name', required=False)
    medicine_type = serializers.CharField(source='medicine_type.name', required=False)
    strength = serializers.CharField(source='strength.name', required=False)

    class Meta:
        model = Medicine
        fields = '__all__'


class MedicineDeleteSerializer(serializers.ModelSerializer):
    class Meta:
        model = Medicine
        fields = ['deleted_at']
