from rest_framework import serializers
from admin.personal_data.serializers import *
from admin.authentication.user.models import *


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
        fields = [
            'id', 'permanent_village_state', 'permanent_postal_code',
            'permanent_division', 'permanent_district', 'permanent_upazila',
        ]


class PresentAddressAllSerializer(serializers.ModelSerializer):
    present_division = DivisionSerializer()
    present_district = DistrictSerializer()
    present_upazila = UpazilaSerializer()

    class Meta:
        model = PresentAddress
        fields = [
            'id', 'present_village_state', 'present_postal_code',
            'present_division', 'present_district', 'present_upazila',
        ]
