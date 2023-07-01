from rest_framework import serializers
from adminpanel.models.organ_models import *


class OrganStoreSerializer(serializers.ModelSerializer):
    class Meta:
        model = Organ
        fields = '__all__'


class OrganSerializer(serializers.ModelSerializer):
    bodypart = serializers.CharField(source='body_part.name')

    class Meta:
        model = Organ
        fields = ['id', 'name', 'description', 'created_at', 'updated_at', 'bodypart']


class OrganBodyPartSerializer(serializers.ModelSerializer):
    class Meta:
        model = Organ
        fields = ['id', 'name']


class OrganDeleteSerializer(serializers.ModelSerializer):
    class Meta:
        model = Organ
        fields = ['deleted_at']
