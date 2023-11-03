from rest_framework.decorators import api_view
from rest_framework.response import Response
from django.db import transaction
from django.shortcuts import get_object_or_404
from your_app.models import Doctor_Profile, Board, Day  # Import your models
from your_app.serializers import DoctorSerializer, EducationSerializer, AwardsSerializer, OffDaySerializer, ScheduleTimeSerializer  # Import your serializers

@api_view(['PUT', 'POST'])
def edit_doctor_data(request, doctor_id):
    try:
        doctor = get_object_or_404(Doctor_Profile, id=doctor_id, deleted_at=None)

        if not doctor.user:
            return Response({'message': 'No associated user found', 'status': 200})

        with transaction.atomic():
            doctor_serializer = DoctorSerializer(doctor, data=request.data, partial=True)

            doctor_serializer = DoctorSerializer(doctor, data=request.data, partial=True)
            appointment_schedule_serializer = AppointmentScheduleSerializer(doctor.appointment_schedules.first(),
                                                                            data=request.data, partial=True)
            print(appointment_schedule_serializer)
            doctor_serializer = DoctorSerializer(doctor, data=request.data, partial=True)
            image_serializer = ImageSerializer(doctor.user.images.first(), data=request.data, partial=True)
            present_address_serializer = PresentAddressSerializer(doctor.user.present_address.first(),
                                                                  data=request.data,
                                                                  partial=True)
            permanent_address_serializer = PermanentAddressSerializer(doctor.user.permanent_address.first(),
                                                                      data=request.data,
                                                                      partial=True)
            social_media_serializer = SocialMediaSerializer(doctor.social_media.first(), data=request.data,
                                                            partial=True)
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
                    image_serializer.validated_data['photo_name'] = doctor.user.images.first().photo_name

                image = image_serializer.save()
                appointment_schedule_instance = appointment_schedule_serializer.save(doctor_profile=doctor)
                present_address = present_address_serializer.save()
                permanent_address = permanent_address_serializer.save()
                social = social_media_serializer.save(doctor_profile=doctor)
            else:
                return Response({'status': 400, 'message': 'Validation error for doctor data'})

            # Handle multiple instances of education using a for loop
            certificate_degrees = request.data.getlist('certificate_degrees[]')
            institutions = request.data.getlist('institutions[]')
            boards = request.data.getlist('boards[]')
            results = request.data.getlist('results[]')
            passing_years = request.data.getlist('passing_years[]')
            start_times = request.data.getlist('start_time[]')

            education_data = zip(certificate_degrees, institutions, boards, results, passing_years, start_times)
            education_objs = []

            for edu_data in education_data:
                certificate_degree, institution, board_id, result, passing_year, start_time = edu_data

                try:
                    board = Board.objects.get(id=board_id)
                except Board.DoesNotExist:
                    board = None

                education_serializer = EducationSerializer(data={
                    'certificate_degree': certificate_degree,
                    'institution': institution,
                    'result': result,
                    'passing_year': passing_year,
                    'start_time': start_time,
                    'doctor_profile': doctor.id,
                    'board': board,
                })

                if education_serializer.is_valid():
                    edu = education_serializer.save()
                    education_objs.append(edu)
                else:
                    return Response({'status': 400, 'message': 'Validation error for education data'})

            # Repeat the same structure for awards, off days, and schedule time
            # Handle multiple instances of awards using a for loop
            awards = request.data.getlist('awards[]')
            honors = request.data.getlist('honors[]')
            publications = request.data.getlist('publications[]')
            research_interests = request.data.getlist('research_interests[]')

            awards_data = zip(awards, honors, publications, research_interests)
            award_objs = []

            for award_data in awards_data:
                award, honor, publication, research_interest = award_data
                awards_serializer = AwardsSerializer(data={
                    'awards': award,
                    'honors': honor,
                    'publications': publication,
                    'research_interests': research_interest,
                    'doctor_profile': doctor.id,
                })

                if awards_serializer.is_valid():
                    awards_serializer.save()
                else:
                    return Response({'status': 400, 'message': 'Validation error for awards data'})

            # Handle multiple instances of off days using a for loop
            off_days = request.data.getlist('off_day[]')
            off_day_objs = []

            for off_day_data in off_days:
                off_day_serializer = OffDaySerializer(data={'off_day': off_day_data, 'doctor_profile': doctor.id})

                if off_day_serializer.is_valid():
                    off_day_serializer.save()
                else:
                    return Response({'status': 400, 'message': 'Validation error for off day data'})

            # Handle multiple instances of schedule time using a for loop
            start_times = request.data.getlist('start_time[]')
            end_times = request.data.getlist('end_time[]')

            schedule_time_data = zip(start_times, end_times)
            schedule_time_objs = []

            for schedule_time_data in schedule_time_data:
                start_time, end_time = schedule_time_data
                schedule_time_serializer = ScheduleTimeSerializer(data={
                    'start_time': start_time,
                    'end_time': end_time,
                    'doctor_profile': doctor.id,
                })

                if schedule_time_serializer.is_valid():
                    schedule_time_serializer.save()
                else:
                    return Response({'status': 400, 'message': 'Validation error for schedule time data'})

            return Response({'status': 200})

    except Exception as e:
        return Response({'status': 500, 'message': str(e)})
