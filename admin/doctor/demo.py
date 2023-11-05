@api_view(['POST'])
def store_doctor_work_details_data(request):
    appointment_schedule_serializer = AppointmentScheduleSerializer(data=request.data)
    social_media_serializer = SocialMediaSerializer(data=request.data)

    if appointment_schedule_serializer.is_valid() and social_media_serializer.is_valid():
        with transaction.atomic():
            try:
                doctor_profile_id = request.data.get('doctor_profile')
                social_media_instance = social_media_serializer.save(doctor_profile_id=doctor_profile_id)
                appointment_schedule_instance = appointment_schedule_serializer.save(
                    doctor_profile_id=doctor_profile_id)

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

                doctor_profile = get_object_or_404(DoctorProfile, id=doctor_profile_id)

                for i in range(len(certificate_degrees)):
                    try:
                        board_id = boards[i]
                        result = results[i]
                        passing_year = passing_years[i]
                        start_time = start_times[i]
                        end_time = end_times[i]
                        day_id = off_days[i]
                        award = awards[i]
                        honor = honors[i]
                        publication = publications[i]
                        research_interest = research_interests[i]

                        board_instance = Board.objects.get(id=board_id)
                        education_obj = Education.objects.create(
                            certificate_degree=certificate_degrees[i],
                            institution=institutions[i],
                            result=result,
                            passing_year=passing_year,
                            doctor_profile=doctor_profile,
                            board=board_instance,
                        )
                        schedule_time_obj = ScheduleTime.objects.create(
                            start_time=start_time,
                            end_time=end_time,
                            appointment_schedule=appointment_schedule_instance,
                            doctor_profile=doctor_profile
                        )
                        day_instance = Day.objects.get(id=day_id)
                        off_day_obj = OffDay.objects.create(
                            off_day=day_instance,
                            doctor_profile=doctor_profile
                        )
                        awards_obj = Awards.objects.create(
                            awards=award,
                            honors=honor,
                            publications=publication,
                            research_interests=research_interest,
                            doctor_profile=doctor_profile
                        )
                    except (Board.DoesNotExist, Day.DoesNotExist) as e:
                        transaction.set_rollback(True)
                        return Response({'status': 404, 'message': str(e)}
            except Exception as e:
                transaction.set_rollback(True)
                return Response({'status': 404, 'message': str(e)})

        # If no exceptions were raised, all items were saved successfully
        return Response({'status': 200})

    else:
        return Response({'status': 403, 'message': 'Validation failed'})

    @api_view(['POST'])
    def store_doctor_work_details_data(request):
        appointment_schedule_serializer = AppointmentScheduleSerializer(data=request.data)
        social_media_serializer = SocialMediaSerializer(data=request.data)

        if appointment_schedule_serializer.is_valid() and social_media_serializer.is_valid():
            with transaction.atomic():
                try:
                    doctor_profile_id = request.data.get('doctor_profile')
                    social_media_instance = social_media_serializer.save(doctor_profile_id=doctor_profile_id)
                    appointment_schedule_instance = appointment_schedule_serializer.save(
                        doctor_profile_id=doctor_profile_id)

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

                    doctor_profile = get_object_or_404(DoctorProfile, id=doctor_profile_id)
                    for certificate_degree, institution, board_id, result, passing_year, start_time, end_time, off_day, award, honor, publication, research_interests in zip(
                            certificate_degrees, institutions, boards, results, passing_years, start_times, end_times,
                            awards, honors, publications, research_interests, off_days):
                        try:
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
                            try:
                                schedule_time_obj = ScheduleTime.objects.create(
                                    start_time=start_time,
                                    end_time=end_time,
                                    appointment_schedule=appointment_schedule_instance,
                                    doctor_profile=doctor_profile
                                )
                            except Exception as e:
                                return Response({'status': 404})
                            try:
                                day_instance = Day.objects.get(id=day_id)
                                off_day_obj = OffDay.objects.create(
                                    off_day=day_instance,
                                    doctor_profile=doctor_profile
                                )
                            except Day.DoesNotExist:
                                # Handle the case when the board with the given ID does not exist
                                return Response({'status': 404})
                            try:
                                awards_obj = Awards.objects.create(
                                    awards=award,
                                    honors=honor,
                                    publications=publication,
                                    research_interests=research_interest,
                                    doctor_profile=doctor_profile
                                )
                            except Exception as e:
                                return Response({'status': 404})

                        except (Board.DoesNotExist, Day.DoesNotExist) as e:
                            transaction.set_rollback(True)
                            return Response({'status': 404, 'message': str(e)})
                except Exception as e:
                    transaction.set_rollback(True)
                    return Response({'status': 404, 'message': str(e)})

            # If no exceptions were raised, all items were saved successfully
            return Response({'status': 200})

        else:
            return Response({'status': 403, 'message': 'Validation failed'})