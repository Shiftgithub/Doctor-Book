from .models import *
from rest_framework import serializers
from admin.personal_data.serializers import *


class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = '__all__'

    def create(self, validated_data):
        instance = super().create(validated_data)
        return instance.pk  # Fetch the primary key of the saved object


class ImageSerializer(serializers.ModelSerializer):
    class Meta:
        model = Images
        fields = '__all__'

    def create(self, validated_data):
        instance = super().create(validated_data)
        return instance


class PresentAddressSerializer(serializers.ModelSerializer):
    class Meta:
        model = PresentAddress
        fields = '__all__'

    def create(self, validated_data):
        instance = super().create(validated_data)
        return instance  # Fetch the primary key of the saved object


class PermanentAddressSerializer(serializers.ModelSerializer):
    class Meta:
        model = PermanentAddress
        fields = '__all__'

    def create(self, validated_data):
        instance = super().create(validated_data)
        return instance  # Fetch the primary key of the saved object

    def create(self, validated_data):
        instance = super().create(validated_data)
        return instance.pk  # Fetch the primary key of the saved object


class PermanentAddressAllSerializer(serializers.ModelSerializer):
    permanent_division = DivisionSerializer()
    permanent_district = DistrictSerializer()
    permanent_upazila = UpazilaSerializer()

    class Meta:
        model = PermanentAddress
        fields = '__all__'


class PresentAddressAllSerializer(serializers.ModelSerializer):
    present_division = DivisionSerializer()
    present_district = DistrictSerializer()
    present_upazila = UpazilaSerializer()

    class Meta:
        model = PresentAddress
        fields = '__all__'

class AdminProfileSerializer(serializers.ModelSerializer):
    class Meta:
        model = AdminProfile
        fields = '__all__'

    def create(self, validated_data):
        instance = super().create(validated_data)
        return instance.pk  # Fetch the primary key of the saved object

class AdminViewSerializer(serializers.ModelSerializer):
    blood_group = serializers.CharField(source='blood_group.name', required=False)
    gender = serializers.CharField(source='gender.name', required=False)
    matrimony = serializers.CharField(source='matrimony.name', required=False)
    religion = serializers.CharField(source='religion.name', required=False)
    email = serializers.CharField(source='user.email', required=False)
    images = ImageSerializer(source='user.images', many=True)

    class Meta:
        model = AdminProfile
        fields = '__all__'