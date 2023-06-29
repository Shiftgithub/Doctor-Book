import hashlib

from django.core.mail import send_mail
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
    query = """
    SELECT 
        doctor_profile.id,
        doctor_profile.full_name,
        doctor_profile.father_name,
        doctor_profile.mother_name,
        doctor_profile.date_of_birth,
        doctor_profile.nid_no,
        doctor_profile.phone_no,
        doctor_profile.experience,
        doctor_profile.biography,
        doctor_profile.languages_spoken,
        doctor_profile.passport_no,
        doctor_profile.deleted_at,

        department.name AS specialty,

        blood_group.name AS blood_group_name,
        gender.name AS gender_name,
        matrimony.name AS matrimony_name,
        religion.name AS religion_name,

        user_profile.user_name,
        user_profile.email,

        images.doctor_photos,

        permanent_division.name AS permanent_division_name,
        permanent_district.name AS permanent_district_name,
        permanent_upazila.name AS permanent_upazila_name,
        permanentaddress.permanent_village_state,
        permanentaddress.permanent_village_state,

        present_division.name AS present_division_name,
        present_district.name AS present_district_name,
        present_upazila.name AS present_upazila_name,
        presentaddress.present_village_state,
        presentaddress.present_postal_code,

        awards.awards_and_honors,
        awards.publications,
        awards.memberships,
        awards.board_certification_number,
        awards.research_interests,

        availability.appointment_availability,
        availability.accepting_new_patients,
        availability.average_wait_time,
        availability.consultation_fee,
        availability.available_facilities,
        education.certificate_degree,
        education.institution,
        education.board,
        education.result,
        education.passing_year,

        services.treatments,
        services.procedures,
        services.hours,
        services.location,

        social_media.website,
        social_media.facebook,
        social_media.instagram,
        social_media.linkedin,
        social_media.twitter

    FROM adminpanel_doctor_profile AS doctor_profile
    INNER JOIN adminpanel_gender AS gender ON doctor_profile.gender_id = gender.id
    INNER JOIN adminpanel_religion AS religion ON doctor_profile.religion_id = religion.id
    INNER JOIN adminpanel_blood_group AS blood_group ON doctor_profile.blood_group_id = blood_group.id
    INNER JOIN adminpanel_matrimony AS matrimony ON doctor_profile.matrimony_id = matrimony.id
    INNER JOIN adminpanel_department AS department ON doctor_profile.specialty = department.id
    INNER JOIN adminpanel_userprofile AS user_profile ON doctor_profile.user_id = user_profile.id
    INNER JOIN adminpanel_images AS images ON images.doctor_profile_id = doctor_profile.id
    INNER JOIN adminpanel_permanentaddress AS permanentaddress ON permanentaddress.doctor_profile_id = doctor_profile.id
    INNER JOIN adminpanel_presentaddress AS presentaddress ON presentaddress.doctor_profile_id = doctor_profile.id
    INNER JOIN adminpanel_division AS permanent_division ON permanent_division.id = permanentaddress.permanent_division_id
    INNER JOIN adminpanel_district AS permanent_district ON permanent_district.id = permanentaddress.permanent_district_id
    INNER JOIN adminpanel_upazila AS permanent_upazila ON permanent_upazila.id = permanentaddress.permanent_upazila_id
    INNER JOIN adminpanel_division AS present_division ON present_division.id = presentaddress.present_division_id
    INNER JOIN adminpanel_district AS present_district ON present_district.id = presentaddress.present_district_id
    INNER JOIN adminpanel_upazila AS present_upazila ON present_upazila.id = presentaddress.present_upazila_id
    INNER JOIN adminpanel_awards AS awards ON awards.doctor_profile_id = doctor_profile.id
    INNER JOIN adminpanel_availability AS availability ON availability.doctor_profile_id = doctor_profile.id
    INNER JOIN adminpanel_education AS education ON education.doctor_profile_id = doctor_profile.id
    INNER JOIN adminpanel_services AS services ON services.doctor_profile_id = doctor_profile.id
    INNER JOIN adminpanel_social_media AS social_media ON social_media.doctor_profile_id = doctor_profile.id
    WHERE doctor_profile.deleted_at IS NULL
    """

    with connection.cursor() as cursor:
        cursor.execute(query)
        rows = cursor.fetchall()

    # Convert the query result into a list of dictionaries
    keys = [
        "id", "full_name", "father_name", "mother_name", "date_of_birth", "nid_no", "phone_no", "experience",
        "biography", "languages_spoken", "passport_no", "deleted_at", "specialty", "blood_group_name",
        "gender_name", "matrimony_name", "religion_name", "user_name", "email", "doctor_photos",
        "permanent_division_name", "permanent_district_name", "permanent_upazila_name",
        "permanent_village_state", "permanent_village_state", "present_division_name",
        "present_district_name", "present_upazila_name", "present_village_state", "present_postal_code",
        "awards_and_honors", "publications", "memberships", "board_certification_number", "research_interests",
        "appointment_availability", "accepting_new_patients", "average_wait_time", "consultation_fee",
        "available_facilities", "certificate_degree", "institution", "board", "result", "passing_year",
        "treatments", "procedures", "hours", "location", "website", "facebook", "instagram", "linkedin", "twitter"
    ]
    serializer = [dict(zip(keys, row)) for row in rows]
    return Response(serializer)


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
