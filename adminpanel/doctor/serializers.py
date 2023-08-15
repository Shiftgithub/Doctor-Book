from rest_framework import serializers
from adminpanel.doctor.models import *
from adminpanel.personal_data.serializers import *


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


class AvailabilitySerializer(serializers.ModelSerializer):
    class Meta:
        model = Availability
        fields = '__all__'

    def create(self, validated_data):
        instance = super().create(validated_data)
        return instance  # Fetch the primary key of the saved object


class AwardsSerializer(serializers.ModelSerializer):
    class Meta:
        model = Awards
        fields = '__all__'

    def create(self, validated_data):
        instance = super().create(validated_data)
        return instance  # Fetch the primary key of the saved object


class BoardSerializer(serializers.ModelSerializer):
    class Meta:
        model = Religion
        fields = '__all__'


class EducationSerializer(serializers.ModelSerializer):
    board = serializers.CharField(source='board.name')  # Serialize the board's name

    class Meta:
        model = Education
        fields = ['id', 'certificate_degree', 'institution', 'board', 'result', 'passing_year']


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


class DoctorAllDataSerializer(serializers.ModelSerializer):
    department = serializers.CharField(source='department.name', required=False)
    blood_group = serializers.CharField(source='blood_group.name')
    gender = serializers.CharField(source='gender.name')
    matrimony = serializers.CharField(source='matrimony.name')
    religion = serializers.CharField(source='religion.name')
    user_name = serializers.CharField(source='user.user_name')
    email = serializers.EmailField(source='user.email')
    awards = AwardsSerializer(many=True)
    availability = AvailabilitySerializer(many=True)
    education = EducationSerializer(many=True)
    images = ImageSerializer(many=True)
    permanent_addresses = PermanentAddressAllSerializer(many=True)
    present_addresses = PresentAddressAllSerializer(many=True)
    services = ServicesSerializer(many=True)
    social_media = SocialMediaSerializer(many=True)

    class Meta:
        model = Doctor_Profile
        fields = [
            'id', 'full_name', 'father_name', 'mother_name', 'date_of_birth', 'nid_no', 'phone_no', 'experience',
            'biography', 'languages_spoken', 'passport_no', 'department', 'blood_group', 'gender', 'matrimony',
            'religion', 'user_name', 'email', 'availability', 'awards', 'education', 'images', 'permanent_addresses',
            'present_addresses', 'services', 'social_media'
        ]


class DoctorDataForLandingDataSerializer(serializers.ModelSerializer):
    department = serializers.CharField(source='department.name', required=False)
    images = ImageSerializer(many=True)
    social_media = SocialMediaSerializer(many=True)

    class Meta:
        model = Doctor_Profile
        fields = [
            'id', 'full_name', 'biography', 'department', 'images', 'social_media'
        ]
