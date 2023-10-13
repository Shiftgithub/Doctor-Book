from rest_framework import serializers
from admin.department_speci.models import *
from admin.doctor.models import Doctor_Profile, ScheduleTime
from admin.authentication.user.serializers import *
from admin.bodypart.models import *
from admin.doctor.serializers import AppointmentScheduleSerializer
from admin.organ.models import *
from admin.doctor.models import OffDay
from admin.personal_data.serializers import *


class PredictionSerializer(serializers.ModelSerializer):
    bodypart = serializers.CharField()
    organ = serializers.CharField()
    organ_problem_specification_id = serializers.CharField(source='departmentdpecification.id', required=False)

    class Meta:
        model = DepartmentSpecification
        fields = [
            'bodypart', 'organ', 'organ_problem_specification_id'
        ]


class PredictionDoctorSerializer(serializers.ModelSerializer):
    images = ImageSerializer(source='user.images', many=True)
    department_name = serializers.CharField(source='department.name', required=False)

    class Meta:
        model = Doctor_Profile
        fields = [
            'id', 'full_name', 'biography', 'department_name', 'images'
        ]


class OffDayForAppointmentSerializer(serializers.ModelSerializer):
    off_day_name = DaySerializer(source='off_day')

    class Meta:
        model = OffDay
        fields = [
            'id', 'doctor_profile', 'off_day', 'off_day_name',
        ]


class ScheduleTimeInfoSerializer(serializers.ModelSerializer):
    per_patient_time = serializers.IntegerField(source='appointment_schedule.per_patient_time')

    class Meta:
        model = ScheduleTime
        fields = [
            'id', 'doctor_profile', 'start_time', 'end_time', 'appointment_schedule', 'per_patient_time',
        ]

    def create(self, validated_data):
        instance = super().create(validated_data)
        return instance