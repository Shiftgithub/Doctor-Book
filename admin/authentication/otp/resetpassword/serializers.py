from rest_framework import serializers
from admin.authentication.user.models import User


class UserPasswordSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ['password', 'hash']

    def create(self, validated_data):
        instance = super().create(validated_data)
        return instance.pk  # Fetch the primary key of the saved object


class PasswordSerializer(serializers.ModelSerializer):
    new_password = serializers.CharField()

    class Meta:
        model = User
        fields = ['password', 'new_password']

    def create(self, validated_data):
        instance = super().create(validated_data)
        return instance.pk  # Fetch the primary key of the saved object


class ForgetPasswordSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ['email']  # Use a list or tuple instead of a string


class EmailSerializer(serializers.ModelSerializer):
    new_email = serializers.EmailField()

    class Meta:
        model = User
        fields = ['email', 'password', 'new_email']

    def create(self, validated_data):
        instance = super().create(validated_data)
        return instance.pk  # Fetch the primary key of the saved object
