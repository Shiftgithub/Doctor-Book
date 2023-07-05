from rest_framework import serializers
from adminpanel.models.user_models import *


class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model = User_Profile
        fields = '__all__'

    def create(self, validated_data):
        instance = super().create(validated_data)
        return instance.pk  # Fetch the primary key of the saved object
