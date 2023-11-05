from rest_framework import serializers
from admin.department_speci.models import *
from admin.doctor.models import DoctorProfile, ScheduleTime
from admin.authentication.user.serializers import *
from admin.bodypart.models import *

from admin.organ.models import *
from admin.doctor.models import OffDay
from admin.personal_data.serializers import *

from .models import *


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


class PatientAppointmentSerializer(serializers.ModelSerializer):
    class Meta:
        model = GetAppointment
        fields = '__all__'


class DateTimeSerializer(serializers.ModelSerializer):
    class Meta:
        model = GetAppointment
        fields = [
            'appointment_date', 'appointment_time', 'doctor',
        ]
