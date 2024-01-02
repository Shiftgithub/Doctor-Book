import socket
import hashlib
<<<<<<< HEAD
from .models import *
from .serializers import *
=======
>>>>>>> 0a0d8f532772ef8919a2217788d4c6179800016c
from django.db import transaction
from django.utils import timezone
from admin.doctor.serializers import *
from rest_framework.response import Response
<<<<<<< HEAD
from rest_framework import status, serializers
=======
>>>>>>> 0a0d8f532772ef8919a2217788d4c6179800016c
from django.shortcuts import get_object_or_404
from rest_framework.decorators import api_view
from admin.authentication.user.serializers import *
from admin.authentication.login.views import set_user_info
from admin.authentication.otp.function.send_otp import send_otp
<<<<<<< HEAD
from admin.authentication.otp.function.send_email import send_email
=======
from admin.authentication.otp.function.send_email import *
>>>>>>> 0a0d8f532772ef8919a2217788d4c6179800016c


# doctor account create
@api_view(['POST'])
@transaction.atomic
def store_doctor_data(request):
    try:
        user_serializer = DoctorUserSerializer(data=request.data)
        doctor_serializer = DoctorSerializer(data=request.data)
        image_serializer = ImageSerializer(data=request.data)
        present_address_serializer = PresentAddressSerializer(data=request.data)
        permanent_address_serializer = PermanentAddressSerializer(data=request.data)

        if user_serializer.is_valid(
                raise_exception=True) and doctor_serializer.is_valid() and image_serializer.is_valid() and present_address_serializer.is_valid() and permanent_address_serializer.is_valid():

            user_name = request.data.get('user_name')
            email = request.data.get('email')

            if User.objects.filter(user_name=user_name).exists():
                return Response({'message': 'This User name already taken. Please try another.', 'status': 404})

            if User.objects.filter(email=email, ).exists():
                return Response({'message': 'This email already used. Please try another.', 'status': 404})
            password = '1'
            hashed_password = hashlib.sha256(password.encode()).hexdigest()

            user_instance = user_serializer.save(password=password, hash=hashed_password,
                                                 role='doctor', status='active')
            doctor_user_id = doctor_serializer.validated_data
            try:
                user_instance = User.objects.get(pk=user_instance)
                doctor_user_id['user'] = user_instance
            except User.DoesNotExist:
                return Response({'status': 404, 'message': 'user id does not exist'})
            otp = 0
            is_verified = True
            save_otp = send_otp(user_instance, otp, is_verified)
            if save_otp:
                doctor_instance = doctor_serializer.save(**doctor_user_id)
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
<<<<<<< HEAD
                    # send_email(email, message)
                    return Response({'status': 200, 'message': 'Doctor data stored successfully'})
=======
                    sent_email = send_email(email, message)
                    if sent_email:
                        return Response({'status': 200, 'message': 'Doctor data stored successfully'})
                    else:
                        transaction.set_rollback(True)
                        return Response({'status': 403, 'message': 'Error in sending mail. try again.'})
>>>>>>> 0a0d8f532772ef8919a2217788d4c6179800016c
                else:
                    transaction.set_rollback(True)
                    return Response({'status': 403, 'message': 'Error in storing doctor data'})
            else:
                transaction.set_rollback(True)
                return Response({'status': 403, 'message': 'Error in otp sending!'})
        else:
            return Response({'status': 400, 'message': 'Invalid request!'})

    except socket.gaierror as e:
        error_message = 'Error: Unable to resolve the hostname or no internet connection.'
        return Response({'status': 1000, 'message': error_message})


@api_view(['GET'])
def get_all_doctors_list(request):
    # Fetch all doctor profiles along with related fields
    doctors = DoctorProfile.objects.filter(deleted_at=None).select_related(
        'user', 'gender', 'religion', 'blood_group', 'matrimony', 'department'
    ).prefetch_related(
        'user__images', 'user__present_address', 'user__permanent_address',
    ).order_by('-id')
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
        'user__images', 'user__present_address', 'user__permanent_address',
    )
    serializer = DoctorViewSerializer(doctors, many=True)
    return Response(serializer.data)


@api_view(['PUT', 'POST'])
@transaction.atomic
def edit_doctor_data(request, doctor_id):
    try:
        doctor = get_object_or_404(DoctorProfile, id=doctor_id, deleted_at=None)
        if not doctor.user:
            return Response({'message': 'No associated user found', 'status': 404})
<<<<<<< HEAD

=======
>>>>>>> 0a0d8f532772ef8919a2217788d4c6179800016c
        else:
            doctor_serializer = DoctorSerializer(doctor, data=request.data, partial=True)
            image_instance = doctor.user.images.first()
            image_serializer = ImageSerializer(image_instance, data=request.data, partial=True)
            present_address_instance = doctor.user.present_address.first()
            present_address_serializer = PresentAddressSerializer(present_address_instance, data=request.data,
                                                                  partial=True)
            permanent_address_instance = doctor.user.permanent_address.first()
            permanent_address_serializer = PermanentAddressSerializer(permanent_address_instance, data=request.data,
                                                                      partial=True)
            if (
                    doctor_serializer.is_valid()
                    and image_serializer.is_valid()
                    and present_address_serializer.is_valid()
                    and permanent_address_serializer.is_valid()
            ):
                doctor_data_updated = doctor_serializer.save(updated_at=timezone.now())

                # Update 'photo_name' if provided
                if 'photo_name' in request.data and request.data['photo_name']:
                    image_serializer.validated_data['photo_name'] = request.data['photo_name']
                else:
                    image_serializer.validated_data['photo_name'] = image_instance.photo_name

                image_updated = image_serializer.save()

                present_address = present_address_serializer.save()
                permanent_address = permanent_address_serializer.save()
                if doctor_data_updated and image_updated and present_address and permanent_address:
                    # session variable should be updated here
                    set_user_info(request, doctor, doctor.user.id, doctor.user.email)
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


# doctor working data
@api_view(['POST'])
@transaction.atomic
def work_details_store(request):
    appointment_schedule_serializer = AppointmentScheduleSerializer(data=request.data)
    if appointment_schedule_serializer.is_valid():
        doctor_profile_id = request.data.get('doctor_id')
        off_days = request.data.getlist('off_day[]')
        start_times = request.data.getlist('start_time[]')
        end_times = request.data.getlist('end_time[]')

        try:
            doctor_profile = DoctorProfile.objects.get(id=doctor_profile_id)
            appointment_schedule_instance = appointment_schedule_serializer.save(doctor_profile=doctor_profile)

            off_day_objs = []
            schedule_time_objs = []

            for start_time, end_time in zip(start_times, end_times):
                schedule_time_obj = ScheduleTime.objects.create(
                    start_time=start_time,
                    end_time=end_time,
                    appointment_schedule=appointment_schedule_instance,
                    doctor_profile=doctor_profile
                )
                schedule_time_objs.append(schedule_time_obj)

            for off_day_id in off_days:
                day_instance = Day.objects.get(id=off_day_id)
                off_day_obj = OffDay.objects.create(
                    off_day=day_instance,
                    doctor_profile=doctor_profile
                )
                off_day_objs.append(off_day_obj)

            if all(off_day_objs) and all(schedule_time_objs):
                return Response({'status': 200, 'message': 'Doctor working data stored successfully'})
            else:
                transaction.set_rollback(True)
                return Response({'status': 403, 'message': 'Error in storing doctor data'})
        except DoctorProfile.DoesNotExist:
            transaction.set_rollback(True)
            return Response({'status': 404, 'message': 'DoctorProfile not found'})
    else:
        transaction.set_rollback(True)
        return Response({'status': 400, 'message': 'Bad Request'})


@api_view(['GET'])
def doctor_working_data(request, doctor_id):
    # Fetch all doctor profiles along with user data and related fields
    doctors = DoctorProfile.objects.filter(id=doctor_id, deleted_at=None).select_related(
        'user').prefetch_related('appointment_schedules', 'user__images')
    serializer = DoctorWorkingSerializer(doctors, many=True)
    return Response(serializer.data)


# doctor education data

@api_view(['POST'])
@transaction.atomic
def edu_store(request):
    try:
        doctor_profile_id = request.data.get('doctor_id')
        doctor_profile = DoctorProfile.objects.get(id=doctor_profile_id)

        certificate_degrees = request.data.getlist('certificate_degrees[]')
        institutions = request.data.getlist('institutions[]')
        boards = request.data.getlist('boards[]')
        results = request.data.getlist('results[]')
        passing_years = request.data.getlist('passing_years[]')

        education_objs = []

        for certificate_degree, institution, board_id, result, passing_year in zip(
                certificate_degrees, institutions, boards, results, passing_years
        ):
            try:
                board_instance = Board.objects.get(id=board_id)
            except Board.DoesNotExist:
                transaction.set_rollback(True)
                return Response({'status': 404, 'message': 'Board not found'})

            education_obj = Education.objects.create(
                certificate_degree=certificate_degree,
                institution=institution,
                result=result,
                passing_year=passing_year,
                doctor_profile=doctor_profile,
                board=board_instance,
            )
            education_objs.append(education_obj)

        return Response({'status': 200, 'message': 'Doctor education data stored successfully'})

    except DoctorProfile.DoesNotExist:
        transaction.set_rollback(True)
        return Response({'status': 404, 'message': 'DoctorProfile not found'})
    except Exception as e:
        transaction.set_rollback(True)
        return Response({'status': 500, 'message': str(e)})


@api_view(['GET'])
def doctor_edu_data(request, doctor_id):
    # Fetch all doctor profiles along with user data and related fields
    doctors = DoctorProfile.objects.filter(id=doctor_id, deleted_at=None).select_related(
        'user').prefetch_related('education', 'user__images')
    serializer = DoctorEduSerializer(doctors, many=True)
    return Response(serializer.data)


@api_view(['PUT', 'POST'])
@transaction.atomic
def edit_edu_data(request, doctor_id):
    doctor = get_object_or_404(DoctorProfile, id=doctor_id)
    ids = request.data.getlist('edu_ids[]')
    certificate_degrees = request.data.getlist('certificate_degrees[]')
    institutions = request.data.getlist('institutions[]')
    boards = request.data.getlist('boards[]')
    results = request.data.getlist('results[]')
    passing_years = request.data.getlist('passing_years[]')

    for id, certificate_degree, institution, board_id, result, passing_year in zip(
            ids, certificate_degrees, institutions, boards, results, passing_years):
        existing_edu = Education.objects.filter(doctor_profile=doctor, id=id).first()
        board_instance = Board.objects.filter(id=board_id).first()
        edu_serializer = EducationEditSerializer(existing_edu, data={
            'certificate_degree': certificate_degree,
            'institution': institution,
            'board': board_instance.id,  # Provide nested dictionary for board
            'result': result,
            'passing_year': passing_year,
            'doctor_profile': doctor.id,
        })

        if edu_serializer.is_valid():
            demo = edu_serializer.save(updated_at=timezone.now())
        else:
            transaction.set_rollback(True)
            return Response({'status': 400, 'message': 'Invalid data'})

    edu_objs = []

    # Create additional awards
    additional_certificate_degrees = request.data.getlist('additional_certificate_degrees[]')
    additional_institutions = request.data.getlist('additional_institutions[]')
    additional_boards = request.data.getlist('additional_boards[]')
    additional_results = request.data.getlist('additional_results[]')
    additional_passing_years = request.data.getlist('additional_passing_years[]')

    for additional_certificate_degree, additional_institution, board_id, additional_result, additional_passing_year in zip(
            additional_certificate_degrees, additional_institutions, additional_boards, additional_results,
            additional_passing_years):
        board_instance = Board.objects.get(id=board_id)
        edu_obj = Education.objects.create(
            certificate_degree=additional_certificate_degree,
            institution=additional_institution,
            result=additional_result,
            passing_year=additional_passing_year,
            doctor_profile=doctor,
            board=board_instance,  # Provide nested dictionary for board
        )
        edu_objs.append(edu_obj)

    return Response({'status': 200, 'message': 'Doctor Education Data updated successfully'})


# doctor social data

@api_view(['POST'])
def social_store(request):
    social_media_serializer = SocialMediaSerializer(data=request.data)
    if social_media_serializer.is_valid():
        doctor_profile_id = request.data.get('doctor_id')
        if social_media_serializer.save(doctor_profile_id=doctor_profile_id):
            return Response({'status': 200, 'message': 'Social Media Data stored successfully'})
        else:
            return Response({'status': 403, 'message': 'Error in updating social media data'})
    else:
        return Response({'status': 400, 'message': 'Social Media Data stored Failed'})


@api_view(['GET'])
def doctor_social_data(request, doctor_id):
    # Fetch all doctor profiles along with user data and related fields
    doctors = DoctorProfile.objects.filter(id=doctor_id, deleted_at=None).select_related(
        'user').prefetch_related('awards', 'user__images')
    serializer = DoctorSocialSerializer(doctors, many=True)
    return Response(serializer.data)


@api_view(['PUT', 'POST'])
def edit_social_data(request, doctor_id):
    id = request.data.get('social_id')
    if id:
        social_data = SocialMedia.objects.get(id=doctor_id)
        serializer = SocialMediaSerializer(social_data, data=request.data)
        if serializer.is_valid():
            if serializer.save(updated_at=timezone.now()):
                return Response({'status': 200, 'message': 'Doctor Social Media data updated Successfully'})
            else:
                response = {'status': 403, 'message': 'Doctor Social Media data updated Failed'}
                return Response(response)
        else:
            response = {'status': 404, 'message ': 'Invalid Data.', 'errors': serializer.errors}
            return Response(response)
    else:
        social_media_serializer = SocialMediaSerializer(data=request.data)
        if social_media_serializer.is_valid():
            if social_media_serializer.save(doctor_profile_id=doctor_id):
                return Response({'status': 200, 'message': 'Social Media Data stored successfully'})
            else:
                return Response({'status': 403, 'message': 'Error in updating social media data'})
        else:
            return Response({'status': 400, 'message': 'Social Media Data stored Failed'})


# doctor award data

@api_view(['POST'])
@transaction.atomic
def award_store(request):
    try:
        doctor_profile_id = request.data.get('doctor_id')
        doctor_profile = DoctorProfile.objects.get(id=doctor_profile_id)

        awards = request.data.getlist('awards[]')
        honors = request.data.getlist('honors[]')
        publications = request.data.getlist('publications[]')
        research_interests = request.data.getlist('research_interests[]')

        awards_objs = []

        for award, honor, publication, research_interest in zip(awards, honors, publications, research_interests):
            awards_obj = Awards.objects.create(
                awards=award,
                honors=honor,
                publications=publication,
                research_interests=research_interest,
                doctor_profile=doctor_profile
            )
            awards_objs.append(awards_obj)

        if all(awards_objs):
            return Response({'status': 200, 'message': 'Award Data stored successfully'})
        else:
            return Response({'status': 400, 'message': 'Error in updating social media data'})

    except DoctorProfile.DoesNotExist:
        transaction.set_rollback(True)
        return Response({'status': 404, 'message': 'DoctorProfile not found'})
    except Exception as e:
        transaction.set_rollback(True)
        return Response({'status': 500, 'message': str(e)})


@api_view(['GET'])
def doctor_award_data(request, doctor_id):
    # Fetch all doctor profiles along with user data and related fields
    doctors = DoctorProfile.objects.filter(id=doctor_id, deleted_at=None).select_related(
        'user').prefetch_related('social_media', 'user__images')
    serializer = DoctorAwardSerializer(doctors, many=True)
    return Response(serializer.data)


@api_view(['PUT', 'POST'])
@transaction.atomic
def edit_award_data(request, doctor_id):
    doctor = get_object_or_404(DoctorProfile, id=doctor_id)
    ids = request.data.getlist('award_ids[]')
    awards = request.data.getlist('awards[]')
    honors = request.data.getlist('honors[]')
    publications = request.data.getlist('publications[]')
    research_interests = request.data.getlist('research_interests[]')

    for id, award_name, honor, publication, research_interest in zip(
            ids, awards, honors, publications, research_interests):
        existing_award = Awards.objects.filter(doctor_profile=doctor, id=id).first()
        award_serializer = AwardsSerializer(existing_award, data={
            'awards': award_name,
            'honors': honor,
            'publications': publication,
            'research_interests': research_interest,
            'doctor_profile': doctor.id,
        })
        if award_serializer.is_valid():
            award_serializer.save(updated_at=timezone.now())
        else:
            transaction.set_rollback(True)
            return Response({'status': 400, 'message': 'Invalid data'})

    awards_objs = []
    # Create additional awards
    additional_awards = request.data.getlist('additional_awards[]')
    additional_honors = request.data.getlist('additional_honors[]')
    additional_publications = request.data.getlist('additional_publications[]')
    additional_research_interests = request.data.getlist('additional_research_interests[]')

    for award, honor, publication, research_interest in zip(
            additional_awards, additional_honors, additional_publications, additional_research_interests):
        awards_obj = Awards.objects.create(
            awards=award,
            honors=honor,
            publications=publication,
            research_interests=research_interest,
            doctor_profile=doctor,
        )
        awards_objs.append(awards_obj)

    return Response({'status': 200, 'message': 'Doctor Award Data updated successfully'})


@api_view(['PUT', 'GET'])
def softdelete_doctor_data(request, doctor_id):
    try:
        doctor_details = DoctorProfile.objects.get(id=doctor_id)
        doctor_serializer = DoctorSerializer(doctor_details, data=request.data, partial=True)

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


@api_view(['GET'])
def get_doctors_name_department_data(request):
    # Fetch all doctor profiles along with related fields
    doctors = DoctorProfile.objects.filter(deleted_at=None).select_related().prefetch_related('education')
    # Serialize the data using the combined serializer
    serializer = DoctorNameDepartmentSerializer(doctors, many=True)
    return Response(serializer.data)


@api_view(['GET'])
def get_all_doctors_list_for_landing(request):
    # Fetch all doctor profiles along with related fields
    doctors = DoctorProfile.objects.filter(deleted_at=None).select_related(
        'user', 'gender', 'religion', 'blood_group', 'matrimony', 'department'
    ).prefetch_related(
        'awards', 'appointment_schedules', 'education', 'social_media',
        'user__images', 'user__present_address', 'user__permanent_address',

    )
    # Serialize the data using the combined serializer
    serializer = DoctorViewForLandingSerializer(doctors, many=True)
    return Response(serializer.data)
