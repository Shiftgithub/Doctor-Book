from rest_framework import serializers
from adminpanel.models.doctor_models import *


class DoctorSerializer(serializers.ModelSerializer):
    class Meta:
        model = Doctor_Profile
        fields = '__all__'

    def create(self, validated_data):
        instance = super().create(validated_data)
        return instance


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


class DivisionSerializer(serializers.ModelSerializer):
    class Meta:
        model = Division
        fields = '__all__'

    def create(self, validated_data):
        instance = super().create(validated_data)
        return instance.pk  # Fetch the primary key of the saved object


class DistrictSerializer(serializers.ModelSerializer):
    class Meta:
        model = District
        fields = '__all__'

    def create(self, validated_data):
        instance = super().create(validated_data)
        return instance.pk  # Fetch the primary key of the saved object


class UpazilaSerializer(serializers.ModelSerializer):
    class Meta:
        model = Upazila
        fields = '__all__'

    def create(self, validated_data):
        instance = super().create(validated_data)
        return instance.pk  # Fetch the primary key of the saved object


class MatrimonieSerializer(serializers.ModelSerializer):
    class Meta:
        model = Matrimony
        fields = '__all__'

    def create(self, validated_data):
        instance = super().create(validated_data)
        return instance.pk  # Fetch the primary key of the saved object


class ReligionSerializer(serializers.ModelSerializer):
    class Meta:
        model = Religion
        fields = '__all__'

    def create(self, validated_data):
        instance = super().create(validated_data)
        return instance.pk  # Fetch the primary key of the saved object


class GenderSerializer(serializers.ModelSerializer):
    class Meta:
        model = Gender
        fields = '__all__'

    def create(self, validated_data):
        instance = super().create(validated_data)
        return instance  # Fetch the primary key of the saved object


class BloodGroupSerializer(serializers.ModelSerializer):
    class Meta:
        model = Blood_Group
        fields = '__all__'

    def create(self, validated_data):
        instance = super().create(validated_data)
        return instance  # Fetch the primary key of the saved object


class AvailabilitySerializer(serializers.ModelSerializer):
    class Meta:
        model = Availability
        fields = '__all__'

    def create(self, validated_data):
        instance = super().create(validated_data)
        return instance  # Fetch the primary key of the saved object


class CertificationSerializer(serializers.ModelSerializer):
    class Meta:
        model = Certification
        fields = '__all__'

    def create(self, validated_data):
        instance = super().create(validated_data)
        return instance  # Fetch the primary key of the saved object


class EducationSerializer(serializers.ModelSerializer):
    class Meta:
        model = Education
        fields = '__all__'

    def create(self, validated_data):
        instance = super().create(validated_data)
        return instance  # Fetch the primary key of the saved object


class ServicesSerializer(serializers.ModelSerializer):
    class Meta:
        model = Services
        fields = '__all__'

    def create(self, validated_data):
        instance = super().create(validated_data)
        return instance  # Fetch the primary key of the saved object


class SocialMediaSerializer(serializers.ModelSerializer):
    class Meta:
        model = Social_Media
        fields = '__all__'

    def create(self, validated_data):
        instance = super().create(validated_data)
        return instance  # Fetch the primary key of the saved object
