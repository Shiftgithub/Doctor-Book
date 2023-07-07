from rest_framework import serializers
from landing.models.patient_models import *
from adminpanel.serializers.personal_data_serializers import *
from adminpanel.models.user_models import User


class PatientSerializer(serializers.ModelSerializer):
    class Meta:
        model = Patient_Profile
        fields = '__all__'


class PatientAllDataSerializer(serializers.ModelSerializer):
    blood_group = serializers.CharField(source='blood_group.name')
    gender = serializers.CharField(source='gender.name')
    matrimony = serializers.CharField(source='matrimony.name')
    religion = serializers.CharField(source='religion.name')
    email = serializers.EmailField(source='user.email')

    class Meta:
        model = Patient_Profile
        fields = [
            'id', 'full_name', 'father_name', 'mother_name', 'date_of_birth',
            'nid_no', 'phone_no', 'address', 'blood_group',
            'gender', 'matrimony', 'religion','email'
        ]
