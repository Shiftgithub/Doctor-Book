from rest_framework.decorators import api_view
from rest_framework.response import Response
from adminpanel.models.doctor_models import Doctor_Profile
from landing.models.patient_models import Patient_Profile
from adminpanel.serializers.doctor_serializers import DoctorAllDataSerializer
from landing.serializers.patient_serializers import PatientAllDataSerializer


@api_view(['GET'])
def get_doctor_details(request, user_id):
    doctor_id = Doctor_Profile.objects.filter(user_id=user_id).first().id

    doctor = Doctor_Profile.objects.filter(id=doctor_id, deleted_at=None).select_related(
        'gender', 'religion', 'blood_group', 'matrimony', 'department'
    ).prefetch_related(
        'user', 'images', 'awards', 'availability', 'education', 'services', 'social_media'
    ).first()

    serializer = DoctorAllDataSerializer(doctor)
    return Response(serializer.data)


def get_patient_details(request, user_id):
    patient_id = Patient_Profile.objects.filter(user_id=user_id).first().id

    patient = Patient_Profile.objects.filter(id=patient_id, deleted_at=None).select_related(
        'gender', 'religion', 'blood_group', 'matrimony', 'user'
    ).first()

    serializer = PatientAllDataSerializer(patient)
    return Response(serializer.data)
