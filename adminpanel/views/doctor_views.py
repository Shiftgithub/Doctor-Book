import hashlib

from django.core.mail import send_mail
from rest_framework.response import Response
from rest_framework.decorators import api_view
from adminpanel.serializers.user_serializers import *
from adminpanel.serializers.doctor_serializers import *
from django.views.decorators.csrf import csrf_protect
from django.db import connection, transaction, InternalError


@api_view(['POST'])
def store_doctor_data(request):
    try:
        if request.method == 'POST':
            user_serializer = UserSerializer(data=request.data)
            doctor_serializer = DoctorSerializer(data=request.data)
            image_serializer = ImageSerializer(data=request.data)
            present_address_serializer = PresentAddressSerializer(data=request.data)
            permanent_address_serializer = PermanentAddressSerializer(data=request.data)
            if user_serializer.is_valid(
                    raise_exception=True) and doctor_serializer.is_valid() and image_serializer.is_valid() and present_address_serializer.is_valid() and permanent_address_serializer.is_valid():
                password = request.data.get('password')
                hashed_password = hashlib.sha256(password.encode()).hexdigest()

                with transaction.atomic():
                    user_instance = user_serializer.save(hash=hashed_password, role="Doctor", status="Approved")
                    doctor_data = doctor_serializer.validated_data
                    user_fields = [user_serializer.validated_data['user_name']]
                    user_name = ' - '.join(user_fields)
                    email_fields = [user_serializer.validated_data['email']]
                    email = ' - '.join(email_fields)
                    message = 'Message From Doctor-Book [Personalized Doctor Predictor]:\n\n' \
                              'Your username: ' + user_name + '\n' + 'Your password: ' + password
                    send_mail(
                        'Doctor-Book From', message, 'settings.EMAIL_HOST_USER',
                        [email], fail_silently=False)
                    try:
                        user_profile_instance = UserProfile.objects.get(pk=user_instance)
                        doctor_data['user'] = user_profile_instance
                    except UserProfile.DoesNotExist:
                        return Response({'status': 400})
                    doctor_instance = doctor_serializer.save(**doctor_data)
                    image_serializer.save(doctor_profile=doctor_instance)
                    present_address_serializer.save(doctor_profile=doctor_instance)
                    permanent_address_serializer.save(doctor_profile=doctor_instance)
                    return Response({'status': 200})
            else:
                return Response({'status': 400})
        else:
            return Response({'status': 405})
    except UserProfile.DoesNotExist:
        return Response({'status': 400})


@api_view(['GET'])
def get_all_doctors_list(request):
    doctors = Doctor_Profile.objects.all()
    serializer = DoctorSerializer(doctors, many=True)
    serialized_data = serializer.data
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


@api_view(['POST'])
def store_doctor_work_details_data(request):
    if request.method == 'POST':
        certification_serializer = CertificationSerializer(data=request.data)
        education_serializer = EducationSerializer(data=request.data)
        services_serializer = ServicesSerializer(data=request.data)
        social_media_serializer = SocialMediaSerializer(data=request.data)
        if certification_serializer.is_valid() and education_serializer.is_valid() and services_serializer.is_valid() and social_media_serializer.is_valid():
            with transaction.atomic():
                if certification_serializer.save() and education_serializer.save() and services_serializer.save() and social_media_serializer.save():
                    return Response({'status': 200})
                else:
                    return Response({'status': 403})
        else:
            return Response({'status': 403})
    else:
        return Response({'status': 403})
