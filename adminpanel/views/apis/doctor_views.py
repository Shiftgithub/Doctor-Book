import hashlib
from django.db.models import Q

from django.db import transaction
from django.utils import timezone
from django.core.mail import send_mail
from rest_framework.response import Response
from rest_framework.decorators import api_view
from adminpanel.serializers.user_serializers import *
from adminpanel.serializers.doctor_serializers import *
from adminpanel.models.doctor_models import *
from adminpanel.models.user_models import *


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
                    user_instance = user_serializer.save(hash=hashed_password, role="doctor", status="active")
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
                        user_instance = User.objects.get(pk=user_instance)
                        doctor_data['user'] = user_instance
                    except User.DoesNotExist:
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
    except User.DoesNotExist:
        return Response({'status': 400})


@api_view(['GET'])
def get_all_doctors_name(request):
    doctors = Doctor_Profile.objects.filter(deleted_at=None)
    serialized_data = []

    for doctor in doctors:
        availability = Availability.objects.filter(doctor_profile_id=doctor.id).exists()
        if not availability:
            serializer = DoctorSerializer(doctor)
            serialized_data.append(serializer.data)

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


@api_view(['POST'])
def store_doctor_work_details_data(request):
    awards_serializer = AwardsSerializer(data=request.data)
    availability_serializer = AvailabilitySerializer(data=request.data)
    services_serializer = ServicesSerializer(data=request.data)
    social_media_serializer = SocialMediaSerializer(data=request.data)

    if all(
            serializer.is_valid() for serializer in
            [awards_serializer, availability_serializer, services_serializer, social_media_serializer]
    ):
        with transaction.atomic():
            awards_instance = awards_serializer.save()
            availability_instance = availability_serializer.save()
            services_instance = services_serializer.save()
            social_media_instance = social_media_serializer.save()

            if awards_instance and availability_instance and services_instance and social_media_instance:
                doctor_profile_id = request.data.get('doctor_profile')
                certificate_degrees = request.data.getlist('certificate_degrees[]')
                institutions = request.data.getlist('institutions[]')
                boards = request.data.getlist('boards[]')
                results = request.data.getlist('results[]')
                passing_years = request.data.getlist('passing_years[]')

                for certificate_degree, institution, board_id, result, passing_year in zip(
                        certificate_degrees, institutions, boards, results, passing_years
                ):
                    try:
                        board_instance = Board.objects.get(id=board_id)
                        education_obj = Education.objects.create(
                            certificate_degree=certificate_degree,
                            institution=institution,
                            result=result,
                            passing_year=passing_year,
                            doctor_profile_id=doctor_profile_id,
                            board=board_instance,  # Assign the board_instance to the board field
                        )
                    except Board.DoesNotExist:
                        # Handle the case when the board with the given ID does not exist
                        return Response({'status': 404})

                return Response({'status': 200})
            else:
                return Response({'status': 403})
    else:
        return Response({'status': 403})


@api_view(['GET'])
def get_all_doctors_list(request):
    doctors = Doctor_Profile.objects.filter(deleted_at=None).select_related(
        'gender', 'religion', 'blood_group', 'matrimony', 'department'
    ).prefetch_related(
        'user', 'images', 'awards', 'availability', 'education', 'services', 'social_media'
    )

    serializer = DoctorAllDataSerializer(doctors, many=True)
    print(serializer.data)
    return Response(serializer.data)


# Getting doctor's full details by doctor id ......................................................................
@api_view(['GET'])
def doctor_data(request, id):
    doctor = Doctor_Profile.objects.filter(id=id, deleted_at=None).select_related(
        'gender', 'religion', 'blood_group', 'matrimony', 'department').prefetch_related(
        'user', 'images', 'awards', 'availability', 'education', 'services', 'social_media'
    ).first()

    if doctor:
        serializer = DoctorAllDataSerializer(doctor)
        return Response(serializer.data)
    else:
        return Response(status=404)


@api_view(['PUT', 'POST'])
def edit_doctor_data(request, doctor_id):
    try:
        doctor = Doctor_Profile.objects.get(id=doctor_id)
    except Doctor_Profile.DoesNotExist:
        return Response({'status': 404})

    doctor_serializer = DoctorSerializer(doctor, data=request.data, partial=True)
    image_serializer = ImageSerializer(doctor.images.first(), data=request.data)
    present_address_serializer = PresentAddressSerializer(doctor.present_addresses.first(), data=request.data,
                                                          partial=True)
    permanent_address_serializer = PermanentAddressSerializer(doctor.permanent_addresses.first(), data=request.data,
                                                              partial=True)
    awards_serializer = AwardsSerializer(doctor.awards.first(), data=request.data, partial=True)
    availability_serializer = AvailabilitySerializer(doctor.availability.first(), data=request.data, partial=True)
    services_serializer = ServicesSerializer(doctor.services.first(), data=request.data, partial=True)
    social_media_serializer = SocialMediaSerializer(doctor.social_media.first(), data=request.data, partial=True)

    if (
            doctor_serializer.is_valid() and
            image_serializer.is_valid() and
            present_address_serializer.is_valid() and
            permanent_address_serializer.is_valid() and
            awards_serializer.is_valid() and
            availability_serializer.is_valid() and
            services_serializer.is_valid() and
            social_media_serializer.is_valid()
    ):
        doctor_serializer.save(updated_at=timezone.now())
        image_serializer.save()
        present_address_serializer.save()
        permanent_address_serializer.save()
        awards_serializer.save()
        availability_serializer.save()
        services_serializer.save()
        social_media_serializer.save()
        return Response({'status': 200})
    else:
        errors = {
            'doctor_serializer': doctor_serializer.errors,
            'image_serializer': image_serializer.errors,
            'present_address_serializer': present_address_serializer.errors,
            'permanent_address_serializer': permanent_address_serializer.errors,
            'awards_serializer': awards_serializer.errors,
            'availability_serializer': availability_serializer.errors,
            'services_serializer': services_serializer.errors,
            'social_media_serializer': social_media_serializer.errors,
        }
        return Response({'status': 403, 'errors': errors})


@api_view(['PUT', 'GET'])
def softdelete_doctor_data(request, doctor_id):
    try:
        doctor_data = Doctor_Profile.objects.get(id=doctor_id)
        doctor_serializer = DoctorSerializer(doctor_data, data=request.data, partial=True)

        # Assuming there is a foreign key relationship between Doctor_Profile and User
        user_data = doctor_data.user  # Use the appropriate foreign key field
        user_serializer = UserSerializer(user_data, data=request.data, partial=True)

        if doctor_serializer.is_valid() and user_serializer.is_valid():
            doctor_serializer.save(deleted_at=timezone.now())
            user_serializer.save(status='inactive', deleted_at=timezone.now())
            return Response({'status': 200})
        else:
            return Response(doctor_serializer.errors, status=400)
    except Doctor_Profile.DoesNotExist:
        return Response({'status': 404})


@api_view(['GET'])
def get_all_doctors_info_for_landing(request):
    doctors = Doctor_Profile.objects.filter(deleted_at=None).select_related('department').prefetch_related(
        'images', 'social_media')
    if doctors.exists():
        serializer = DoctorDataForLandingDataSerializer(doctors, many=True)
        return Response(serializer.data)
    else:
        return Response({'status': 404})

