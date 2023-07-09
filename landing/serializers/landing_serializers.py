from rest_framework import serializers

from adminpanel.models.department_models import Department
from adminpanel.models.doctor_models import Doctor_Profile
from landing.models.patient_models import *
from adminpanel.serializers.personal_data_serializers import *


class CountDepartmentsSerializers(serializers.ModelSerializer):
    class Meta:
        model = Department
        fields = [
            'id'
        ]


class CountDoctorsSerializers(serializers.ModelSerializer):
    class Meta:
        model = Doctor_Profile
        fields = [
            'id'
        ]


class CountPatientsSerializers(serializers.ModelSerializer):
    class Meta:
        model = Patient_Profile
        fields = [
            'id'
        ]
