from .models import *
from rest_framework import serializers


class OrganSerializer(serializers.ModelSerializer):
    class Meta:
        model = Organ
        fields = '__all__'


class OrganViewSerializer(serializers.ModelSerializer):
    bodypart = serializers.CharField(source='body_part.name')

    class Meta:
        model = Organ
        fields = '__all__'


class OrganBodyPartSerializer(serializers.ModelSerializer):
    class Meta:
        model = Organ
        fields = ['id', 'name']


class OrganDeleteSerializer(serializers.ModelSerializer):
    class Meta:
        model = Organ
        fields = ['deleted_at']
