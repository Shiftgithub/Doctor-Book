from rest_framework import serializers
from .models import *
from admin.personal_data.serializers import *


class PatientSerializer(serializers.ModelSerializer):
    class Meta:
        model = Patient_Profile
        fields = '__all__'


class PatientAllDataSerializer(serializers.ModelSerializer):
    blood_group = serializers.SerializerMethodField()
    gender = serializers.SerializerMethodField()
    matrimony = serializers.SerializerMethodField()
    religion = serializers.SerializerMethodField()
    email = serializers.SerializerMethodField()

    class Meta:
        model = Patient_Profile
        fields = [
            'id', 'full_name', 'father_name', 'mother_name', 'date_of_birth',
            'nid_no', 'phone_no', 'address', 'blood_group',
            'gender', 'matrimony', 'religion', 'email'
        ]

    def get_blood_group(self, obj):
        blood_group = obj.blood_group
        if blood_group is None:
            return None
        return blood_group.name

    def get_gender(self, obj):
        gender = obj.gender
        if gender is None:
            return None
        return gender.name

    def get_matrimony(self, obj):
        matrimony = obj.matrimony
        if matrimony is None:
            return None
        return matrimony.name

    def get_religion(self, obj):
        religion = obj.religion
        if religion is None:
            return None
        return religion.name

    def get_email(self, obj):
        user = obj.user
        if user is None:
            return None
        return user.email
