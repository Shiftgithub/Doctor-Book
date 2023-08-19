from rest_framework import serializers
from adminpanel.department.models import Department
from adminpanel.doctor.models import Doctor_Profile
from adminpanel.patient.models import *
from adminpanel.personal_data.serializers import *


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
