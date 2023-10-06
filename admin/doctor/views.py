import socket
import hashlib
from .models import *
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
        try:
            user_serializer = UserSerializer(data=request.data)
            doctor_serializer = DoctorSerializer(data=request.data)
            image_serializer = ImageSerializer(data=request.data)
            present_address_serializer = PresentAddressSerializer(data=request.data)
            permanent_address_serializer = PermanentAddressSerializer(data=request.data)

            if user_serializer.is_valid(
                    raise_exception=True) and doctor_serializer.is_valid() and image_serializer.is_valid() and present_address_serializer.is_valid() and permanent_address_serializer.is_valid():
                password = '1'
                hashed_password = hashlib.sha256(password.encode()).hexdigest()

                with transaction.atomic():
                    user_instance = user_serializer.save(password=password, hash=hashed_password,
                                                         role='doctor', status='active')
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
                            # send_email(email, message)
                            return Response({'status': 200})
                        else:
                            transaction.set_rollback(True)
                            return Response({'status': 403})
                    else:
                        transaction.set_rollback(True)
                        return Response({'status': 403})
            else:
                return Response({'status': 400})
        except User.DoesNotExist:
            return Response({'status': 400})
    except socket.gaierror as e:
        # Handle the error gracefully, and display a custom error message.
        error_message = 'Error: Unable to resolve the hostname or no internet connection.'
        return Response({'status': 1000, 'message': error_message})


@api_view(['POST'])
def store_doctor_work_details_data(request):
    appointment_schedule_serializer = AppointmentScheduleSerializer(data=request.data)
    social_media_serializer = SocialMediaSerializer(data=request.data)

    if appointment_schedule_serializer.is_valid() and social_media_serializer.is_valid():
        with transaction.atomic():
            doctor_profile_id = request.data.get('doctor_profile')
            social_media_instance = social_media_serializer.save(doctor_profile_id=doctor_profile_id)
            appointment_schedule_instance = appointment_schedule_serializer.save(doctor_profile_id=doctor_profile_id)

            if social_media_instance and appointment_schedule_instance:
                certificate_degrees = request.data.getlist('certificate_degrees[]')
                institutions = request.data.getlist('institutions[]')
                boards = request.data.getlist('boards[]')
                results = request.data.getlist('results[]')
                passing_years = request.data.getlist('passing_years[]')
                start_times = request.data.getlist('start_time[]')
                end_times = request.data.getlist('end_time[]')
                off_days = request.data.getlist('off_day[]')
                awards = request.data.getlist('awards[]')
                honors = request.data.getlist('honors[]')
                publications = request.data.getlist('publications[]')
                research_interests = request.data.getlist('research_interests[]')

                for certificate_degree, institution, board_id, result, passing_year, start_time, end_time, day_id, award, honor, publication, research_interest in zip(
                        certificate_degrees, institutions, boards, results, passing_years, start_times, end_times,
                        off_days, awards, honors, publications, research_interests
                ):
                    try:
                        board_instance = Board.objects.get(id=board_id)
                        education_obj = Education.objects.create(
                            certificate_degree=certificate_degree,
                            institution=institution,
                            result=result,
                            passing_year=passing_year,
                            doctor_profile_id=doctor_profile_id,
                            board=board_instance,
                        )
                        schedule_time_obj = ScheduleTime.objects.create(
                            start_time=start_time,
                            end_time=end_time,
                            appointment_schedule=appointment_schedule_instance,
                        )
                        day_instance = Day.objects.get(id=day_id)
                        off_day_obj = OffDay.objects.create(
                            off_day=day_instance,
                            doctor_profile_id=doctor_profile_id,
                        )
                        awards_obj = Awards.objects.create(
                            awards=award,
                            honors=honor,
                            publications=publication,
                            research_interests=research_interest,
                            doctor_profile_id=doctor_profile_id,
                        )
                    except Board.DoesNotExist:
                        # Handle the case when the board with the given ID does not exist
                        return Response({'status': 404})
                if education_obj and schedule_time_obj and awards_obj and off_day_obj:
                    # All items saved successfully
                    return Response({'status': 200})
                else:
                    transaction.set_rollback(True)
                    return Response({'status': 404})
            else:
                transaction.set_rollback(True)
                return Response({'status': 403})
    else:
        return Response({'status': 403})


@api_view(['GET'])
def get_all_doctors_list(request):
    # Fetch all doctor profiles along with related fields
    doctors = Doctor_Profile.objects.filter(deleted_at=None).select_related(
        'user', 'gender', 'religion', 'blood_group', 'matrimony', 'department'
    ).prefetch_related(
        'awards', 'appointment_schedules', 'education', 'social_media',
        'user__images', 'user__present_address', 'user__permanent_address',

    )
    # Serialize the data using the combined serializer
    serializer = DoctorViewSerializer(doctors, many=True)
    return Response(serializer.data)


# Getting doctor's full details by doctor id
@api_view(['GET'])
def doctor_data(request, id):
    # Fetch all doctor profiles along with user data and related fields
    doctors = Doctor_Profile.objects.filter(id=id, deleted_at=None).select_related(
        'user', 'gender', 'religion', 'blood_group', 'matrimony', 'department'
    ).prefetch_related(
        'awards', 'appointment_schedules', 'education', 'social_media',
        'user__images', 'user__present_address', 'user__permanent_address',
    )
    serializer = DoctorViewSerializer(doctors, many=True)
    return Response(serializer.data)


@api_view(['PUT', 'POST'])
def edit_doctor_data(request, doctor_id):
    try:
        doctor = Doctor_Profile.objects.get(id=doctor_id, deleted_at=None)
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
    appointment_schedule = doctor.appointment_schedules.first()
    appointment_schedule_serializer = AppointmentScheduleSerializer(appointment_schedule, data=request.data,
                                                                    partial=True)
    social_media_serializer = SocialMediaSerializer(doctor.social_media.first(), data=request.data, partial=True)

    # if not image_serializer.is_valid():
    #     print("Image Serializer Validation Errors:")
    #     print(image_serializer.errors)

    if (doctor_serializer.is_valid() and
            image_serializer.is_valid() and
            present_address_serializer.is_valid() and
            permanent_address_serializer.is_valid() and
            appointment_schedule_serializer.is_valid() and
            social_media_serializer.is_valid()):
        doctor_serializer.save(updated_at=timezone.now())
        if 'photo_name' in request.data and request.data['photo_name']:
            # New image is selected
            image_serializer.validated_data['photo_name'] = request.data['photo_name']
        else:
            # No new image selected, retain the existing image
            image_serializer.validated_data['photo_name'] = user.images.first().photo_name
        image = image_serializer.save()
        appointment_schedule_instance = appointment_schedule_serializer.save(doctor_profile=doctor)
        present_address = present_address_serializer.save()
        permanent_address = permanent_address_serializer.save()
        social = social_media_serializer.save(doctor_profile=doctor)
        # ...

        if appointment_schedule_instance and image and present_address and permanent_address and social:
            certificate_degrees = request.data.getlist('certificate_degrees[]')
            institutions = request.data.getlist('institutions[]')
            boards = request.data.getlist('boards[]')
            results = request.data.getlist('results[]')
            passing_years = request.data.getlist('passing_years[]')
            start_times = request.data.getlist('start_time[]')
            end_times = request.data.getlist('end_time[]')
            off_days = request.data.getlist('off_day[]')
            awards = request.data.getlist('awards[]')
            honors = request.data.getlist('honors[]')
            publications = request.data.getlist('publications[]')
            research_interests = request.data.getlist('research_interests[]')

            for certificate_degree, institution, board_id, result, passing_year, start_time, end_time, day_id, award, honor, publication, research_interest in zip(
                    certificate_degrees, institutions, boards, results, passing_years, start_times, end_times,
                    off_days, awards, honors, publications, research_interests
            ):
                try:
                    board_instance = Board.objects.get(id=board_id)

                    # Retrieve or create an Education instance based on the certificate degree
                    education_obj, created = Education.objects.get_or_create(
                        doctor_profile_id=doctor_id,
                        certificate_degree=certificate_degree,
                        defaults={
                            'institution': institution,
                            'result': result,
                            'passing_year': passing_year,
                            'board': board_instance,
                        }
                    )

                    # Update the existing Education instance if it was not created in this step
                    if not created:
                        education_obj.institution = institution
                        education_obj.result = result
                        education_obj.passing_year = passing_year
                        education_obj.board = board_instance
                        education_obj.save()

                    # Retrieve or create a ScheduleTime instance based on the start time and end time
                    schedule_time_obj, created = ScheduleTime.objects.get_or_create(
                        appointment_schedule=appointment_schedule_instance,
                        start_time=start_time,
                        end_time=end_time,
                    )

                    # Update the existing ScheduleTime instance if it was not created in this step
                    if not created:
                        schedule_time_obj.start_time = start_time
                        schedule_time_obj.end_time = end_time
                        schedule_time_obj.save()

                    # Retrieve or create an OffDay instance based on the day_id
                    day_instance = Day.objects.get(id=day_id)
                    off_day_obj, created = OffDay.objects.get_or_create(
                        doctor_profile_id=doctor_id,
                        off_day=day_instance,
                    )

                    # Update the existing OffDay instance if it was not created in this step
                    if not created:
                        off_day_obj.off_day = day_instance
                        off_day_obj.save()

                    # Retrieve or create an Awards instance based on the award
                    awards_obj, created = Awards.objects.get_or_create(
                        doctor_profile_id=doctor_id,
                        awards=award,
                    )

                    # Update the existing Awards instance if it was not created in this step
                    if not created:
                        awards_obj.awards = award
                        awards_obj.honors = honor
                        awards_obj.publications = publication
                        awards_obj.research_interests = research_interest
                        awards_obj.save()
                except Board.DoesNotExist:
                    # Handle the case when the board with the given ID does not exist
                    return Response({'status': 404})

            # All items updated successfully
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
