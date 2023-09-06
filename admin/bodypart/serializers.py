from rest_framework import serializers
from admin.bodypart.models import *


class BodyPartSerializer(serializers.ModelSerializer):
    class Meta:
        model = BodyPart
        fields = ('name', 'description')

    def validate(self, data):
        name = data.get('name')
        description = data.get('description')

        # Perform validation on the field values
        if len(name) < 3:
            raise serializers.ValidationError("Name must be at least 3 characters long.")

        # Add more validation conditions as needed

        return data


class BodyPartSerializerView(serializers.ModelSerializer):
    class Meta:
        model = BodyPart
        fields = '__all__'


class BodyPartDeleteSerializer(serializers.ModelSerializer):
    class Meta:
        model = BodyPart
        fields = ['deleted_at']
