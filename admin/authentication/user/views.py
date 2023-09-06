from rest_framework.decorators import api_view
from rest_framework.response import Response
from admin.doctor.models import Doctor_Profile
from admin.patient.models import Patient_Profile
from admin.doctor.serializers import DoctorAllDataSerializer
from admin.patient.serializers import PatientAllDataSerializer

@api_view(['GET'])
def get_doctor_details(request, user_id):
    doctor_profile = Doctor_Profile.objects.filter(user_id=user_id).first()

    if doctor_profile is None:
        return Response({"error": "Doctor profile not found"}, status=404)

    doctor_id = doctor_profile.id

    doctor = Doctor_Profile.objects.filter(id=doctor_id, deleted_at=None).select_related(
        'gender', 'religion', 'blood_group', 'matrimony', 'department'
    ).prefetch_related(
        'user', 'images', 'awards', 'availability', 'education', 'services', 'social_media'
    ).first()

    serializer = DoctorAllDataSerializer(doctor)
    return Response(serializer.data)

@api_view(['GET'])
def get_patient_details(request, user_id):
    patient_profile = Patient_Profile.objects.filter(user_id=user_id).first()

    if patient_profile is None:
        return Response({"error": "Patient profile not found"}, status=404)

    patient_id = patient_profile.id

    patient = Patient_Profile.objects.filter(id=patient_id, deleted_at=None).select_related(
        'gender', 'religion', 'blood_group', 'matrimony', 'user'
    ).first()

    serializer = PatientAllDataSerializer(patient)
    return Response(serializer.data)
