from rest_framework import serializers
from .models.bodypart_models import *


class BodyPartSerializer(serializers.ModelSerializer):
    class Meta:
        model = BodyPart
        fields = '__all__'


class BodyPartDeleteSerializer(serializers.ModelSerializer):
    class Meta:
        model = BodyPart
        fields = ['deleted_at']
