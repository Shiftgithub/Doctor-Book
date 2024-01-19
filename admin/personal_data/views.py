from admin.doctor.models import *
from admin.doctor.serializers import *
from rest_framework.response import Response
from rest_framework.decorators import api_view


@api_view(['GET'])
def get_all_doctors_name(request):
    doctors = DoctorProfile.objects.filter(deleted_at=None)
    serialized_data = []

    for doctor in doctors:
        appointment_schedule = AppointmentSchedule.objects.filter(doctor_profile_id=doctor.id).exists()

        if not appointment_schedule:
            serializer = DoctorSerializer(doctor)
            serialized_data.append(serializer.data)

    return Response(serialized_data)


@api_view(['GET'])
def get_all_doctors_name_by_edu(request):
    doctors = DoctorProfile.objects.filter(deleted_at=None)
    serialized_data = []

    for doctor in doctors:
        edu = Education.objects.filter(doctor_profile_id=doctor.id).exists()
        if not edu:
            serializer = DoctorSerializer(doctor)
            serialized_data.append(serializer.data)

    return Response(serialized_data)


@api_view(['GET'])
def get_all_doctors_name_by_social(request):
    doctors = DoctorProfile.objects.filter(deleted_at=None)
    serialized_data = []

    for doctor in doctors:
        social_media = SocialMedia.objects.filter(doctor_profile_id=doctor.id).exists()

        if not social_media:
            serializer = DoctorSerializer(doctor)
            serialized_data.append(serializer.data)

    return Response(serialized_data)


@api_view(['GET'])
def get_all_doctors_name_by_award(request):
    doctors = DoctorProfile.objects.filter(deleted_at=None)
    serialized_data = []

    for doctor in doctors:
        award = Awards.objects.filter(doctor_profile_id=doctor.id).exists()

        if not award:
            serializer = DoctorSerializer(doctor)
            serialized_data.append(serializer.data)

    return Response(serialized_data)


@api_view(['GET'])
def get_all_doctors_name_by_chamber(request):
    doctors = DoctorProfile.objects.filter(deleted_at=None)
    serialized_data = []

    for doctor in doctors:
        chamber = Chamber.objects.filter(doctor_profile_id=doctor.id).exists()

        if not chamber:
            serializer = DoctorSerializer(doctor)
            serialized_data.append(serializer.data)
    print('serialized_data', serialized_data)
    return Response(serialized_data)


@api_view(['GET'])
def gender_list(request):
    gender = Gender.objects.all()
    serializer = GenderSerializer(gender, many=True)
    serialized_data = serializer.data
    return Response(serialized_data)


@api_view(['GET'])
def religion_list(request):
    religion = Religion.objects.all()
    serializer = ReligionSerializer(religion, many=True)
    serialized_data = serializer.data
    return Response(serialized_data)


@api_view(['GET'])
def blood_group_list(request):
    blood_group = Blood_Group.objects.all()
    serializer = BloodGroupSerializer(blood_group, many=True)
    serialized_data = serializer.data
    return Response(serialized_data)


@api_view(['GET'])
def board_list(request):
    board = Board.objects.all()
    serializer = BoardSerializer(board, many=True)
    serialized_data = serializer.data
    return Response(serialized_data)


@api_view(['GET'])
def matrimony_list(request):
    matrimonie = Matrimony.objects.all()
    serializer = MatrimonieSerializer(matrimonie, many=True)
    serialized_data = serializer.data
    return Response(serialized_data)


@api_view(['GET'])
def division_list(request):
    division = Division.objects.all()
    serializer = DivisionSerializer(division, many=True)
    serialized_data = serializer.data
    return Response(serialized_data)


@api_view(['GET'])
def district_list(request):
    district = District.objects.all()
    serializer = DistrictSerializer(district, many=True)
    serialized_data = serializer.data
    return Response(serialized_data)


@api_view(['GET'])
def upazila_list(request):
    upazila = Upazila.objects.all()
    serializer = UpazilaSerializer(upazila, many=True)
    serialized_data = serializer.data
    return Response(serialized_data)


@api_view(['GET'])
def day_list(request):
    day = Day.objects.all()
    serializer = DaySerializer(day, many=True)
    serialized_data = serializer.data
    return Response(serialized_data)
