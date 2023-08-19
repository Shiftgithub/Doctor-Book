from rest_framework import serializers
from adminpanel.user.models import *


class UserPasswordSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ["password", "hash"]

    def create(self, validated_data):
        instance = super().create(validated_data)
        return instance.pk  # Fetch the primary key of the saved object


class ForgetPasswordSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ["email"]  # Use a list or tuple instead of a string
