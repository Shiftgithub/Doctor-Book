from rest_framework.response import Response
from rest_framework.decorators import api_view
from landingpanel.landing.serializers import *


@api_view(['GET'])
def count_department(request):
    # Getting all doctor data from Department model ...
    departments = Department.objects.filter(deleted_at=None).order_by('id')

    # Get the count of departments
    department_count = departments.count()

    # Serializing department count
    serialized_department_count = {'department_count': department_count}

    return Response(serialized_department_count)


@api_view(['GET'])
def count_doctor(request):
    # Getting all doctor data from Doctor_Profile model ...
    doctors = Doctor_Profile.objects.filter(deleted_at=None).order_by('id')

    # Get the count of doctors
    doctor_count = doctors.count()

    # Serializing doctor count
    serialized_doctor_count = {'doctor_count': doctor_count}

    return Response(serialized_doctor_count)


@api_view(['GET'])
def count_patient(request):
    # Getting all doctor data from Patient_Profile model ...
    patients = Patient_Profile.objects.filter(deleted_at=None).order_by('id')

    # Get the count of patients
    patient_count = patients.count()

    # Serializing patient count
    serialized_patient_count = {'patient_count': patient_count}

    return Response(serialized_patient_count)
