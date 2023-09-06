from admin.doctor.models import *
from rest_framework import serializers
from admin.authentication.user.models import *
from admin.personal_data.serializers import *
from admin.authentication.user.serializers import *


class DoctorSerializer(serializers.ModelSerializer):
    class Meta:
        model = Doctor_Profile
        fields = '__all__'

    def create(self, validated_data):
        instance = super().create(validated_data)
        return instance


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
    services = ServicesSerializer(many=True)
    social_media = SocialMediaSerializer(many=True)
    images = ImageSerializer(source='user.images', many=True)
    present_address = PresentAddressAllSerializer(source='user.present_address', many=True)
    permanent_address = PermanentAddressAllSerializer(source='user.permanent_address', many=True)

    class Meta:
        model = Doctor_Profile
        fields = [
            'id', 'full_name', 'father_name', 'mother_name', 'date_of_birth', 'nid_no', 'phone_no', 'experience',
            'biography', 'languages_spoken', 'passport_no', 'department', 'blood_group', 'gender', 'matrimony',
            'religion', 'user_name', 'email', 'images', 'availability', 'awards', 'education', 'services',
            'social_media', 'present_address', 'permanent_address'
        ]
