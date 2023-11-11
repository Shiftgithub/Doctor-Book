import socket
import hashlib
from .models import *
from .serializers import *
from django.db import transaction
from django.utils import timezone
from admin.doctor.serializers import *
from rest_framework.response import Response
from rest_framework import status, serializers
from django.shortcuts import get_object_or_404
from rest_framework.decorators import api_view
from admin.authentication.user.serializers import *
from admin.authentication.otp.function.send_otp import send_otp
from admin.authentication.otp.function.send_email import send_email


@api_view(['POST'])
def store_doctor_data(request):
    try:
        user_serializer = UserSerializer(data=request.data)
        doctor_serializer = DoctorSerializer(data=request.data)
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
    except socket.gaierror as e:
        error_message = 'Error: Unable to resolve the hostname or no internet connection.'
        return Response({'status': 1000, 'message': error_message})


@api_view(['POST'])
def store_doctor_work_details_data(request):
    appointment_schedule_serializer = AppointmentScheduleSerializer(data=request.data)
    social_media_serializer = SocialMediaSerializer(data=request.data)

    with transaction.atomic():
        if appointment_schedule_serializer.is_valid() and social_media_serializer.is_valid():
            doctor_profile_id = request.data.get('doctor_profile')
            appointment_schedule_instance = appointment_schedule_serializer.save(doctor_profile_id=doctor_profile_id)
            social_media_instance = social_media_serializer.save(doctor_profile_id=doctor_profile_id)

            if appointment_schedule_instance and social_media_instance:

                awards = request.data.getlist('awards[]')
                honors = request.data.getlist('honors[]')
                publications = request.data.getlist('publications[]')
                research_interests = request.data.getlist('research_interests[]')

                certificate_degrees = request.data.getlist('certificate_degrees[]')
                institutions = request.data.getlist('institutions[]')
                boards = request.data.getlist('boards[]')
                results = request.data.getlist('results[]')
                passing_years = request.data.getlist('passing_years[]')

                off_days = request.data.getlist('off_day[]')

                start_times = request.data.getlist('start_time[]')
                end_times = request.data.getlist('end_time[]')

                try:
                    doctor_profile = DoctorProfile.objects.get(id=doctor_profile_id)

                    awards_objs = []
                    education_objs = []
                    off_day_objs = []
                    schedule_time_objs = []

                    for certificate_degree, institution, board_id, result, passing_year, start_time, end_time, off_day, award, honor, publication, research_interest in zip(
                            certificate_degrees, institutions, boards, results, passing_years, start_times, end_times,
                            off_days, awards, honors, publications, research_interests):
                        board_instance = Board.objects.get(id=board_id)
                        awards_obj = Awards.objects.create(
                            awards=award,
                            honors=honor,
                            publications=publication,
                            research_interests=research_interest,
                            doctor_profile=doctor_profile
                        )
                        education_obj = Education.objects.create(
                            certificate_degree=certificate_degree,
                            institution=institution,
                            result=result,
                            passing_year=passing_year,
                            doctor_profile=doctor_profile,
                            board=board_instance,
                        )
                        day_instance = Day.objects.get(id=off_day)
                        off_day_obj = OffDay.objects.create(
                            off_day=day_instance,
                            doctor_profile=doctor_profile
                        )
                        schedule_time_obj = ScheduleTime.objects.create(
                            start_time=start_time,
                            end_time=end_time,
                            appointment_schedule=appointment_schedule_instance,
                            doctor_profile=doctor_profile
                        )
                        awards_objs.append(awards_obj)
                        education_objs.append(education_obj)  # Append created instances to the lists
                        off_day_objs.append(off_day_obj)
                        schedule_time_objs.append(schedule_time_obj)

                    if all(awards_objs) and all(education_objs) and all(off_day_objs) and all(schedule_time_objs):
                        return Response({'status': 200})
                    else:
                        transaction.set_rollback(True)
                        return Response({'status': 404, 'message': 'Data not stored'})
                except (Board.DoesNotExist, Day.DoesNotExist):
                    transaction.set_rollback(True)
                    return Response({'status': 404, 'message': 'Board not found'})
                except DoctorProfile.DoesNotExist:
                    transaction.set_rollback(True)
                    return Response({'status': 404, 'message': 'DoctorProfile not found'})
            else:
                transaction.set_rollback(True)
                return Response({'status': 400, 'message': 'Appointment Schedule Or Social Media Data insert Failed'})
        else:
            transaction.set_rollback(True)
            return Response({'status': 400, 'message': 'Bad Request'})


@api_view(['GET'])
def get_all_doctors_list(request):
    # Fetch all doctor profiles along with related fields
    doctors = DoctorProfile.objects.filter(deleted_at=None).select_related(
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
def doctor_data(request, doctor_id):
    # Fetch all doctor profiles along with user data and related fields
    doctors = DoctorProfile.objects.filter(id=doctor_id, deleted_at=None).select_related(
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
        doctor = get_object_or_404(DoctorProfile, id=doctor_id, deleted_at=None)

        if not doctor.user:
            return Response({'message': 'No associated user found', 'status': 200})

        else:
            with transaction.atomic():
                appointment_schedule_instance = doctor.appointment_schedules.first()

                appointment_schedule_serializer = AppointmentScheduleSerializer(appointment_schedule_instance,
                                                                                data=request.data, partial=True)
                doctor_serializer = DoctorSerializer(doctor, data=request.data, partial=True)
                image_instance = doctor.user.images.first()
                image_serializer = ImageSerializer(image_instance, data=request.data, partial=True)
                present_address_instance = doctor.user.present_address.first()
                present_address_serializer = PresentAddressSerializer(present_address_instance, data=request.data,
                                                                      partial=True)
                permanent_address_instance = doctor.user.permanent_address.first()
                permanent_address_serializer = PermanentAddressSerializer(permanent_address_instance, data=request.data,
                                                                          partial=True)
                social_media_instance = doctor.social_media.first()
                social_media_serializer = SocialMediaSerializer(social_media_instance, data=request.data, partial=True)

                if (
                        doctor_serializer.is_valid()
                        and image_serializer.is_valid()
                        and present_address_serializer.is_valid()
                        and permanent_address_serializer.is_valid()
                        and appointment_schedule_serializer.is_valid()
                        and social_media_serializer.is_valid()
                ):
                    doctor_serializer.save(updated_at=timezone.now())

                    # Update 'photo_name' if provided
                    if 'photo_name' in request.data and request.data['photo_name']:
                        image_serializer.validated_data['photo_name'] = request.data['photo_name']
                    else:
                        image_serializer.validated_data['photo_name'] = image_instance.photo_name

                    image_serializer.save()
                    appointment_schedule_serializer.save(doctor_profile=doctor)
                    present_address_serializer.save()
                    permanent_address_serializer.save()
                    social_media_serializer.save()

                    awards = request.data.getlist('awards[]')
                    honors = request.data.getlist('honors[]')
                    publications = request.data.getlist('publications[]')
                    research_interests = request.data.getlist('research_interests[]')
                    certificate_degrees = request.data.getlist('certificate_degrees[]')
                    institutions = request.data.getlist('institutions[]')
                    boards = request.data.getlist('boards[]')
                    results = request.data.getlist('results[]')
                    passing_years = request.data.getlist('passing_years[]')
                    off_days = request.data.getlist('off_day[]')
                    start_times = request.data.getlist('start_time[]')
                    end_times = request.data.getlist('end_time[]')

                    existing_awards = Awards.objects.filter(doctor_profile=doctor)
                    existing_educations = Education.objects.filter(doctor_profile=doctor)
                    existing_off_days = OffDay.objects.filter(doctor_profile=doctor)
                    existing_schedule_times = ScheduleTime.objects.filter(doctor_profile=doctor)
                    # Iterate through the existing awards
                    for award_instance, award, honor, publication, research_interest, education_instance, certificate_degree, institution, board_id, result, passing_year, off_day_instance, off_day, schedule_time_instance, start_time, end_time in zip(
                            existing_awards, awards, honors, publications, research_interests, existing_educations,
                            certificate_degrees, institutions, boards, results, passing_years, existing_off_days,
                            off_days, existing_schedule_times, start_times, end_times
                    ):
                        try:
                            board = Board.objects.get(id=board_id)
                            off_day_id = OffDay.objects.get(id=off_day)
                        except (Board, OffDay).DoesNotExist as e:
                            data = {'status': 404,
                                    'message': 'Board or off day are not Existing in db',
                                    'error': str(e)
                                    }
                            return Response(data)

                        award_serializer = AwardsSerializer(award_instance, data={
                            'awards': award,
                            'honors': honor,
                            'publications': publication,
                            'research_interests': research_interest,
                            'doctor_profile': doctor.id,
                        })
                        edu_serializer = EducationEditSerializer(education_instance, data={
                            'certificate_degree': certificate_degree,
                            'institution': institution,
                            'result': result,
                            'passing_year': passing_year,
                            'board': board.id,
                            'doctor_profile': doctor.id,
                        })
                        off_day_serializer = OffDaySerializer(off_day_instance, data={
                            'off_day': off_day_id.id,
                            'doctor_profile': doctor.id
                        })
                        schedule_time_serializer = ScheduleTimeSerializer(schedule_time_instance, data={
                            'start_time': start_time,
                            'end_time': end_time,
                            'doctor_profile': doctor.id
                        })
                        if (
                                award_serializer.is_valid() and
                                edu_serializer.is_valid() and
                                off_day_serializer.is_valid() and
                                schedule_time_serializer.is_valid()
                        ):
                            award = award_serializer.save(updated_at=timezone.now())
                            edu = edu_serializer.save(updated_at=timezone.now())
                            day = off_day_serializer.save(updated_at=timezone.now())
                            time = schedule_time_serializer.save(updated_at=timezone.now())
                        else:
                            transaction.set_rollback(True)
                            return Response(
                                {'status': 404, 'message': 'Request data are invalid.'})
                    if award and edu and day and time:
                        return Response({'status': 200})
                    else:
                        transaction.set_rollback(True)
                        return Response(
                            {'status': 404, 'message': 'Data updated failed.'})
                else:
                    transaction.set_rollback(True)
                    return Response({'status': 400, 'message': 'Validation error for doctor data'})
    except Exception as e:
        return Response({'status': 500, 'message': str(e)})


@api_view(['PUT', 'GET'])
def softdelete_doctor_data(request, doctor_id):
    try:
        doctor_data = DoctorProfile.objects.get(id=doctor_id)
        doctor_serializer = DoctorSerializer(doctor_data, data=request.data, partial=True)

        # Assuming there is a foreign key relationship between DoctorProfile and User
        user_data = doctor_data.user  # Use the appropriate foreign key field
        user_serializer = UserSerializer(user_data, data=request.data, partial=True)

        if doctor_serializer.is_valid() and user_serializer.is_valid():
            doctor_serializer.save(deleted_at=timezone.now())
            user_serializer.save(status='inactive', deleted_at=timezone.now())
            return Response({'status': 200})
        else:
            return Response(doctor_serializer.errors, status=400)
    except DoctorProfile.DoesNotExist:
        return Response({'status': 404})
