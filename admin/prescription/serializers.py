from .models import *
from rest_framework import serializers
from admin.patient.serializers import PatientViewSerializer
from admin.doctor.serializers import DoctorPrescriptionSerializer


class PrescriptionSerializer(serializers.ModelSerializer):
    # patient_name = serializers.CharField(source='patient_profile.full_name',allow_null=True)
    # doctor_name = serializers.CharField(source='doctor_profile.full_name', allow_null=True)

    class Meta:
        model = Prescription
        fields = '__all__'


class PrescriptionDeleteSerializer(serializers.ModelSerializer):
    class Meta:
        model = Prescription
        fields = ['deleted_at']


class PrescriptionMedicineSerializer(serializers.ModelSerializer):
    class Meta:
        model = PrescriptionMedicine
        fields = '__all__'


class MedicineScheduleSerializer(serializers.ModelSerializer):
    class Meta:
        model = MedicineSchedule
        fields = '__all__'


class LabTestSerializer(serializers.ModelSerializer):
    class Meta:
        model = LabTest
        fields = '__all__'


class PrescriptionLabTestSerializer(serializers.ModelSerializer):
    class Meta:
        model = PrescriptionLabTest
        fields = '__all__'


class PrescriptionViewSerializer(serializers.ModelSerializer):
    patient_profile = PatientViewSerializer()
    # patient_name = serializers.CharField(source='patient_profile.full_name', allow_null=True)
    # birth_date = serializers.CharField(source='patient_profile.date_of_birth', allow_null=True)
    # address = serializers.CharField(source='patient_profile.address', allow_null=True)
    # phone_no = serializers.CharField(source='patient_profile.phone_no', allow_null=True)
    # registration_no = serializers.CharField(source='patient_profile.registration_no', allow_null=True)
    doctor_profile = DoctorPrescriptionSerializer()
    medicine = PrescriptionMedicineSerializer(source='prescription_medicine', many=True)
    lab_test_name = serializers.SerializerMethodField()
    medicine_name = serializers.SerializerMethodField()
    medicine_schedule_time = serializers.SerializerMethodField()

    class Meta:
        model = Prescription
        fields = '__all__'

    def get_lab_test_name(self, obj):
        return [lab_test.lab_test.name for lab_test in obj.prescription_lab.all()]

    def get_medicine_name(self, obj):
        return [medicine.medicine.name for medicine in obj.prescription_medicine.all()]

    def get_medicine_schedule_time(self, obj):
        return [medicine.medicine_schedule.schedule for medicine in obj.prescription_medicine.all()]
