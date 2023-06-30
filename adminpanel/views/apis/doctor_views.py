import hashlib

from django.core.mail import send_mail
from django.db.models import F
from rest_framework.response import Response
from rest_framework.decorators import api_view
from adminpanel.serializers.user_serializers import *
from adminpanel.serializers.doctor_serializers import *
from adminpanel.models.user_models import *
from adminpanel.models.doctor_models import *
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


def get_all_doctors_list(request):
    queryset = Doctor_Profile.objects.filter(deleted_at=None).annotate(
        specialty_name=F('department.name'),
        blood_group_name=F('blood_group.name'),
        gender_name=F('gender.name'),
        matrimony_name=F('matrimony.name'),
        religion_name=F('religion.name'),
        user_name=F('user.user_name'),
        email=F('user.email'),
        doctor_photos=F('images.doctor_photos'),
        permanent_village_state=F('permanent_address.permanent_village_state'),
        permanent_division_name=F('permanent_address.permanent_division.name'),
        permanent_district_name=F('permanent_address.permanent_district.name'),
        permanent_upazila_name=F('permanent_address.permanent_upazila.name'),
        present_village_state=F('present_address.present_village_state'),
        present_postal_code=F('present_address.present_postal_code'),
        present_division_name=F('present_address.present_division.name'),
        present_district_name=F('present_address.present_district.name'),
        present_upazila_name=F('present_address.present_upazila.name'),
        awards_and_honors=F('awards.awards_and_honors'),
        publications=F('awards.publications'),
        memberships=F('awards.memberships'),
        board_certification_number=F('awards.board_certification_number'),
        research_interests=F('awards.research_interests'),
        appointment_availability=F('availability.appointment_availability'),
        accepting_new_patients=F('availability.accepting_new_patients'),
        average_wait_time=F('availability.average_wait_time'),
        consultation_fee=F('availability.consultation_fee'),
        available_facilities=F('availability.available_facilities'),
        treatments=F('services.treatments'),
        procedures=F('services.procedures'),
        hours=F('services.hours'),
        location=F('services.location'),
        website=F('social_media.website'),
        facebook=F('social_media.facebook'),
        instagram=F('social_media.instagram'),
        linkedin=F('social_media.linkedin'),
        twitter=F('social_media.twitter'),
    )
    serializer = DoctorAllDataSerializer(queryset, many=True)
    serialized_data = serializer.data
    return Response(serialized_data)


@api_view(['GET'])
def get_all_doctors_name(request):
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
        awards_serializer = AwardsSerializer(data=request.data)
        availability_serializer = AvailabilitySerializer(data=request.data)

        doctor_profile_id = request.POST.get('doctor_profile')
        certificate_degrees = request.POST.getlist('certificate_degrees[]')
        institutions = request.POST.getlist('institutions[]')
        boards = request.POST.getlist('boards[]')
        results = request.POST.getlist('results[]')
        passing_years = request.POST.getlist('passing_years[]')

        services_serializer = ServicesSerializer(data=request.data)
        social_media_serializer = SocialMediaSerializer(data=request.data)

        if awards_serializer.is_valid() and availability_serializer.is_valid() and services_serializer.is_valid() and social_media_serializer.is_valid():
            with transaction.atomic():
                awards_instance = awards_serializer.save()
                availability_instance = availability_serializer.save()
                services_instance = services_serializer.save()
                social_media_instance = social_media_serializer.save()

                if awards_instance and availability_instance and services_instance and social_media_instance:
                    for certificate_degree, institution, board, result, passing_year in zip(certificate_degrees,
                                                                                            institutions, boards,
                                                                                            results, passing_years):
                        education_obj = Education(
                            certificate_degree=certificate_degree,
                            institution=institution,
                            board=board,
                            result=result,
                            passing_year=passing_year,
                            doctor_profile_id=doctor_profile_id
                        )
                        education_obj.save()

                    return Response({'status': 200})
                else:
                    return Response({'status': 403})
        else:
            return Response({'status': 403})
    else:
        return Response({'status': 403})


@api_view(['POST'])
def doctor_work_details_data(request, id):
    pass