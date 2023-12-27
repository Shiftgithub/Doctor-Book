from rest_framework import serializers
from admin.department.models import Department
from admin.doctor.models import DoctorProfile
from admin.patient.models import *
from admin.personal_data.serializers import *


class CountDepartmentsSerializers(serializers.ModelSerializer):
    class Meta:
        model = Department
        fields = ['id']


class CountDoctorsSerializers(serializers.ModelSerializer):
    class Meta:
        model = DoctorProfile
        fields = ['id']


class CountPatientsSerializers(serializers.ModelSerializer):
    class Meta:
        model = PatientProfile
        fields = ['id']
