from .models import *
from rest_framework import serializers
from admin.personal_data.serializers import *
from admin.authentication.user.serializers import ImageSerializer

from landing.appointment.models import GetAppointment


class PatientSerializer(serializers.ModelSerializer):
    class Meta:
        model = Patient_Profile
        fields = '__all__'


class PatientViewSerializer(serializers.ModelSerializer):
    blood_group = serializers.CharField(source='blood_group.name', required=False)
    gender = serializers.CharField(source='gender.name', required=False)
    matrimony = serializers.CharField(source='matrimony.name', required=False)
    religion = serializers.CharField(source='religion.name', required=False)
    email = serializers.CharField(source='user.email', required=False)
    images = ImageSerializer(source='user.images', many=True)

    class Meta:
        model = Patient_Profile
        fields = '__all__'


class PatientAppointmentSerializer(serializers.ModelSerializer):
    class Meta:
        model = GetAppointment
        fields = '__all__'