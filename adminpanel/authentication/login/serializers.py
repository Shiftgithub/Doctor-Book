from rest_framework import serializers
from adminpanel.user.models import *


class LoginSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ('user_name', 'password', 'hash', 'role', 'status')

    def create(self, validated_data):
        instance = super().create(validated_data)
        return instance.pk  # Fetch the primary key of the saved object