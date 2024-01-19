from rest_framework import serializers
from admin.personal_data.models import *
from admin.organ_problem_speci.models import *
from landing.appointment.models import GetAppointment


class OrganBodyPartSerializer(serializers.ModelSerializer):
    class Meta:
        model = Organ
        fields = ['id', 'name']


class OrganProblemOrganSerializer(serializers.ModelSerializer):
    class Meta:
        model = OrgansProblemSpecification
        fields = ['id', 'problem', 'problem_specification']


class DistrictByDivisionSerializer(serializers.ModelSerializer):
    class Meta:
        model = District
        fields = ['id', 'name']


class UpazilaByDistrictBySerializer(serializers.ModelSerializer):
    class Meta:
        model = Upazila
        fields = ['id', 'name']


class AppointmentDateTimeByPatientNameSerializer(serializers.ModelSerializer):
    class Meta:
        model = GetAppointment
        fields = ['id', 'appointment_date', 'appointment_time', 'prediction_id', 'patient', 'is_check_up']


class AJAXSpecificationViewSerializer(serializers.Serializer):
    problem_id = serializers.IntegerField()
    problem = serializers.CharField()
    problem_specification = serializers.CharField()


class AJAXPredictionViewSerializer(serializers.Serializer):
    predictions = AJAXSpecificationViewSerializer(many=True)

    class Meta:
        fields = '__all__'
