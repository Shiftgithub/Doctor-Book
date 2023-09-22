from .models import *
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


class AppointmentScheduleSerializer(serializers.ModelSerializer):
    class Meta:
        model = AppointmentSchedule
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


class DoctorViewSerializer(serializers.ModelSerializer):
    department = serializers.CharField(source='department.name', required=False)
    blood_group = serializers.CharField(source='blood_group.name')
    gender = serializers.CharField(source='gender.name')
    matrimony = serializers.CharField(source='matrimony.name')
    religion = serializers.CharField(source='religion.name')
    user_name = serializers.CharField(source='user.user_name')
    email = serializers.EmailField(source='user.email')
    awards = AwardsSerializer(many=True)
    appointment = AppointmentSchedule()
    education = EducationSerializer(many=True)
    social_media = SocialMediaSerializer(many=True)
    images = ImageSerializer(source='user.images', many=True)
    present_address = PresentAddressAllSerializer(source='user.present_address', many=True)
    permanent_address = PermanentAddressAllSerializer(source='user.permanent_address', many=True)

    class Meta:
        model = Doctor_Profile
        fields = '__all__'



