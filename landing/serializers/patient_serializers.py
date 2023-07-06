from rest_framework import serializers
from landing.models.patient_models import *


class PatientSerializer(serializers.ModelSerializer):
    class Meta:
        model = Patient_Profile
        fields = '__all__'


class PatientDataSerializer(serializers.ModelSerializer):
    blood_group = serializers.CharField(source='blood_group.name')
    gender = serializers.CharField(source='gender.name')
    matrimony = serializers.CharField(source='matrimony.name')
    religion = serializers.CharField(source='religion.name')
    user_name = serializers.CharField(source='user_profile.user_name')
    email = serializers.EmailField(source='user_profile.email')

    class Meta:
        model = Patient_Profile
        fields = [
            'id', 'full_name', 'father_name', 'mother_name', 'date_of_birth',
            'nid_no', 'phone_no', 'address', 'blood_group',
            'gender', 'matrimony', 'religion', 'user_name', 'email'
        ]
