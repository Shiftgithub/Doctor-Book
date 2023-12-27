from .models import *
from rest_framework import serializers
from admin.patient.serializers import PatientViewSerializer
from admin.doctor.serializers import DoctorPrescriptionSerializer
# from admin.medicine.serializers import MedicineScheduleSerializer
from admin.authentication.user.models import User


class PrescriptionForMedicineSerializer(serializers.ModelSerializer):
    class Meta:
        model = PrescriptionForMedicine
        fields = '__all__'


class MedicinePrescriptionSerializer(serializers.ModelSerializer):
    class Meta:
        model = MedicinePrescription
        fields = '__all__'


class PrescriptionForLabTestSerializer(serializers.ModelSerializer):
    class Meta:
        model = PrescriptionForLabTest
        fields = '__all__'


class LabTestPrescriptionSerializer(serializers.ModelSerializer):
    class Meta:
        model = LabTestPrescription
        fields = '__all__'


class PrescriptionForMedicineViewSerializer(serializers.ModelSerializer):
    patient_name = serializers.CharField(source='patient_profile.full_name', allow_null=True)
    patient_email = serializers.CharField(source='patient_profile.user.email', allow_null=True)
    birth_date = serializers.CharField(source='patient_profile.date_of_birth', allow_null=True)
    address = serializers.CharField(source='patient_profile.address', allow_null=True)
    patient_phone_no = serializers.CharField(source='patient_profile.phone_no', allow_null=True)
    registration_no = serializers.CharField(source='patient_profile.registration_no', allow_null=True)
    doctor_name = serializers.CharField(source='doctor_profile.full_name', allow_null=True)
    doctor_email = serializers.CharField(source='doctor_profile.user.email', allow_null=True)
    doctor_phone_no = serializers.CharField(source='doctor_profile.phone_no', allow_null=True)
    department = serializers.CharField(source='doctor_profile.department', allow_null=True)

    medicine_name = serializers.SerializerMethodField()

    # duration = serializers.CharField(source='medicine_prescription.duration', required=True)
    duration = serializers.SerializerMethodField()
    frequency = serializers.SerializerMethodField()

    medicine_schedule_time = serializers.SerializerMethodField()

    class Meta:
        model = PrescriptionForMedicine
        fields = '__all__'

    def get_duration(self, obj):
        medicine_prescriptions = obj.medicine_prescription.all()
        if medicine_prescriptions.exists():
            return [medicine_prescription.duration for medicine_prescription in medicine_prescriptions]
        return None

    def get_frequency(self, obj):
        medicine_prescriptions = obj.medicine_prescription.all()
        if medicine_prescriptions.exists():
            return [medicine_prescription.frequency for medicine_prescription in medicine_prescriptions]
        return None

    def get_medicine_name(self, obj):
        medicine_prescriptions = obj.medicine_prescription.all()
        if medicine_prescriptions.exists():
            return [medicine.medicine.name for medicine in medicine_prescriptions]
        return None

    def get_medicine_schedule_time(self, obj):
        medicine_prescriptions = obj.medicine_prescription.all()
        if medicine_prescriptions.exists():
            return [medicine.medicine_schedule.schedule for medicine in medicine_prescriptions]
        return None


class PrescriptionForLabTestViewSerializer(serializers.ModelSerializer):
    patient_name = serializers.CharField(source='patient_profile.full_name', allow_null=True)
    patient_email = serializers.CharField(source='patient_profile.user.email', allow_null=True)
    birth_date = serializers.CharField(source='patient_profile.date_of_birth', allow_null=True)
    address = serializers.CharField(source='patient_profile.address', allow_null=True)
    patient_phone_no = serializers.CharField(source='patient_profile.phone_no', allow_null=True)
    registration_no = serializers.CharField(source='patient_profile.registration_no', allow_null=True)
    doctor_name = serializers.CharField(source='doctor_profile.full_name', allow_null=True)
    doctor_email = serializers.CharField(source='doctor_profile.user.email', allow_null=True)
    doctor_phone_no = serializers.CharField(source='doctor_profile.phone_no', allow_null=True)
    department = serializers.CharField(source='doctor_profile.department', allow_null=True)

    lab_test_name = serializers.SerializerMethodField()

    class Meta:
        model = PrescriptionForLabTest
        fields = '__all__'

    def get_lab_test_name(self, obj):
        return [lab_test.lab_test.name for lab_test in obj.prescription_lab.all()]
