import hashlib
from admin.doctor.models import *
from django.db.models import Prefetch
from django.db import transaction
from django.utils import timezone
from admin.doctor.serializers import *
from rest_framework.response import Response
from rest_framework.decorators import api_view
from admin.authentication.otp.function.send_email import send_email
from admin.authentication.otp.function.send_otp import send_otp


@api_view(['POST'])
def store_doctor_data(request):
    try:
        user_serializer = UserSerializer(data=request.data)
        doctor_serializer = DoctorSerializer(data=request.data)
        image_serializer = ImageSerializer(data=request.data)
        present_address_serializer = PresentAddressSerializer(data=request.data)
        permanent_address_serializer = PermanentAddressSerializer(data=request.data)

        if user_serializer.is_valid(
                raise_exception=True) and doctor_serializer.is_valid() and image_serializer.is_valid() and present_address_serializer.is_valid() and permanent_address_serializer.is_valid():
            password = '@123456789'
            hashed_password = hashlib.sha256(password.encode()).hexdigest()

            with transaction.atomic():
                user_instance = user_serializer.save(password=password, hash=hashed_password,
                                                     role="doctor", status="active")
                doctor_data = doctor_serializer.validated_data
                try:
                    user_instance = User.objects.get(pk=user_instance)
                    doctor_data['user'] = user_instance
                except User.DoesNotExist:
                    return Response({'status': 400})
                otp = 0
                is_verified = True
                save_otp = send_otp(user_instance, otp, is_verified)
                if save_otp:
                    doctor_instance = doctor_serializer.save(**doctor_data)
                    image_instance = image_serializer.save(
                        user=user_instance)  # Assuming 'user' is the ForeignKey in Images
                    present_instance = present_address_serializer.save(user=user_instance)
                    permanent_instance = permanent_address_serializer.save(user=user_instance)
                    if doctor_instance and image_instance and present_instance and permanent_instance:
                        user_fields = [user_serializer.validated_data['user_name']]
                        user_name = ' - '.join(user_fields)
                        email_fields = [user_serializer.validated_data['email']]
                        email = ' - '.join(email_fields)
                        message = 'Message From Doctor-Book [Personalized Doctor Predictor]:\n\n' \
                                  'Your username: ' + user_name + '\n' + 'Your password: ' + password
                        send_email(email, message)
                        return Response({'status': 200})
                    else:
                        transaction.set_rollback(True)
                        return Response({'status': 403})
                else:
                    return Response({'status': 403})
        else:
            return Response({'status': 400})
    except User.DoesNotExist:
        return Response({'status': 400})


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
    # Fetch all doctor profiles along with user data and related fields
    doctors = Doctor_Profile.objects.filter(deleted_at=None).select_related(
        'user', 'gender', 'religion', 'blood_group', 'matrimony', 'department'
    ).prefetch_related(
        'awards', 'availability', 'education', 'services', 'social_media', 'user__images',
        'user__present_address', 'user__permanent_address'
    )

    # Serialize the data using the combined serializer
    serializer = DoctorAllDataSerializer(doctors, many=True)

    return Response(serializer.data)


# Getting doctor's full details by doctor id ......................................................................
@api_view(['GET'])
def doctor_data(request, id):
    # Fetch all doctor profiles along with user data and related fields
    doctors = Doctor_Profile.objects.filter(id=id, deleted_at=None).select_related(
        'user', 'gender', 'religion', 'blood_group', 'matrimony', 'department'
    ).prefetch_related(
        'awards', 'availability', 'education', 'services', 'social_media', 'user__images',
        'user__present_address', 'user__permanent_address'
    )
    # Serialize the data using the combined serializer
    serializer = DoctorAllDataSerializer(doctors, many=True)
    return Response(serializer.data)


@api_view(['PUT', 'POST'])
def edit_doctor_data(request, doctor_id):
    try:
        doctor = Doctor_Profile.objects.get(id=doctor_id)
    except Doctor_Profile.DoesNotExist:
        return Response({'status': 404})

    # Check if the doctor has a user associated with them
    if not doctor.user:
        return Response({'status': 200})

    # Access the related user and address objects
    user = doctor.user

    doctor_serializer = DoctorSerializer(doctor, data=request.data, partial=True)
    image_serializer = ImageSerializer(user.images.first(), data=request.data, partial=True)
    present_address_serializer = PresentAddressSerializer(user.present_address.first(), data=request.data, partial=True)
    permanent_address_serializer = PermanentAddressSerializer(user.permanent_address.first(), data=request.data,
                                                              partial=True)
    awards_serializer = AwardsSerializer(doctor.awards.first(), data=request.data, partial=True)
    availability_serializer = AvailabilitySerializer(doctor.availability.first(), data=request.data, partial=True)
    services_serializer = ServicesSerializer(doctor.services.first(), data=request.data, partial=True)
    social_media_serializer = SocialMediaSerializer(doctor.social_media.first(), data=request.data, partial=True)

    if (doctor_serializer.is_valid() and
            image_serializer.is_valid() and
            present_address_serializer.is_valid() and
            permanent_address_serializer.is_valid() and
            awards_serializer.is_valid() and
            availability_serializer.is_valid() and
            services_serializer.is_valid() and
            social_media_serializer.is_valid()):
        doctor_serializer.save(updated_at=timezone.now())
        if 'photo_name' in request.data and request.data['photo_name']:
            # New image is selected
            image_serializer.validated_data['photo_name'] = request.data['photo_name']
        else:
            # No new image selected, retain the existing image
            image_serializer.validated_data['photo_name'] = user.images.first().photo_name
        image_serializer.save()
        present_address_serializer.save()
        permanent_address_serializer.save()
        awards_serializer.save(doctor_profile=doctor)
        availability_serializer.save(doctor_profile=doctor)
        services_serializer.save(doctor_profile=doctor)
        social_media_serializer.save(doctor_profile=doctor)

        return Response({'status': 200})
    else:
        return Response({'status': 404})


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
