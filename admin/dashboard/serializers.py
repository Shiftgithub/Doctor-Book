from .models import *
from rest_framework import serializers
from admin.authentication.user.models import *
from admin.doctor.models import *
from admin.patient.models import *
from admin.personal_data.serializers import *
from admin.authentication.user.serializers import *


class AdminDataSerializer(serializers.ModelSerializer):
    blood_group = serializers.CharField(source='blood_group.name')
    email = serializers.EmailField(source='user.email')
    gender = serializers.CharField(source='gender.name')
    images = ImageSerializer(source='user.images', many=True)
    matrimony = serializers.CharField(source='matrimony.name')
    religion = serializers.CharField(source='religion.name')
    user_name = serializers.CharField(source='user.user_name')

    class Meta:
        model = AdminProfile
        fields = '__all__'


class DoctorDataSerializer(serializers.ModelSerializer):
    blood_group = serializers.CharField(source='blood_group.name')
    email = serializers.EmailField(source='user.email')
    gender = serializers.CharField(source='gender.name')
    images = ImageSerializer(source='user.images', many=True)
    matrimony = serializers.CharField(source='matrimony.name')
    religion = serializers.CharField(source='religion.name')
    user_name = serializers.CharField(source='user.user_name')

    class Meta:
        model = DoctorProfile
        fields = '__all__'


class PatientDataSerializer(serializers.ModelSerializer):
    blood_group = serializers.CharField(source='blood_group.name')
    email = serializers.EmailField(source='user.email')
    gender = serializers.CharField(source='gender.name')
    images = ImageSerializer(source='user.images', many=True)
    matrimony = serializers.CharField(source='matrimony.name')
    religion = serializers.CharField(source='religion.name')
    user_name = serializers.CharField(source='user.user_name')

    class Meta:
        model = PatientProfile
        fields = '__all__'
