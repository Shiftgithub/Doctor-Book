from admin.bodypart.models import BodyPart
from admin.bodypart.serializers import BodyPartSerializer
from rest_framework.response import Response
from .serializers import *
from rest_framework.decorators import api_view
from admin.doctor.models import Doctor_Profile
from admin.organ.serializers import OrganBodyPartSerializer
from admin.department_speci.models import DepartmentSpecification
from admin.organ_problem_speci.serializers import OrganProblemSerializer
from admin.doctor.models import OffDay
from admin.doctor.models import ScheduleTime, AppointmentSchedule

from datetime import datetime, timedelta


@api_view(['POST'])
def prediction(request):
    predict_serializer = PredictionSerializer(data=request.data)

    problem_specs = request.POST.getlist('problem_specs[]')
    if predict_serializer.is_valid():
        bodypart_id = predict_serializer.validated_data.get('bodypart')
        organ_id = predict_serializer.validated_data.get('organ')

        department_specifications = DepartmentSpecification.objects.filter(
            organ_problem_specification__in=problem_specs
        )
        if department_specifications.exists():
            department_ids = department_specifications.values_list('department', flat=True)
            if len(set(department_ids)) == 1:
                doctor_data = Doctor_Profile.objects.filter(
                    department__in=department_ids
                )
                doctor_serializer = PredictionDoctorSerializer(doctor_data, many=True)

                bodypart = BodyPart.objects.get(id=bodypart_id)
                bodypart_serializer = BodyPartSerializer(bodypart, many=False)

                organ = Organ.objects.get(id=organ_id)
                organ_serializer = OrganBodyPartSerializer(organ, many=False)

                problem_specs_data = []
                for problem_spec_id in problem_specs:
                    try:
                        problem_spec = OrgansProblemSpecification.objects.get(id=problem_spec_id)
                        problem_specs_data.append(OrganProblemSerializer(problem_spec).data)
                    except OrgansProblemSpecification.DoesNotExist:
                        pass

                response_data = {
                    'status': 200,
                    'bodypart_name': bodypart_serializer.data,
                    'organ_name': organ_serializer.data,
                    'doctors_data': doctor_serializer.data,
                    'problem_specs': problem_specs_data,
                }
                return Response(response_data)
            else:
                return Response({'status': 403, 'message': 'DepartmentSpecifications have different departments'})
        else:
            return Response({'status': 403, 'message': 'DepartmentSpecification does not exist'})


def generate_date(request, doctor_id):
    # Get today's date
    today = datetime.now().date()

    # Create a list to store the dates and days

    date_list = []
    off_day_list = []

    off_days_response = get_off_day_list(request, doctor_id)
    # schedule_times = get_working_schedule(request, doctor_id)
    # print(schedule_times)

    if off_days_response.status_code == 200:
        off_days_data = off_days_response.data
        # Iterate through the off_days_data to access doctor_profile data
        for off_day in off_days_data:
            off_day_list.append(off_day.get('off_day_name')['name'])

        # Generate the next 8 days
        for index in range(8):
            date = today + timedelta(days=index)
            formatted_date = date.strftime('%d-%m-%Y')
            day_of_week = date.strftime('%A')

            # Check if the day_of_week is not in the off_day_list before adding it
            if day_of_week not in off_day_list:
                date_with_day = f'{formatted_date} ({day_of_week})'
                date_list.append(date_with_day)
    return date_list


def generate_schedule_time(request, doctor_id):
    appointment_times = []

    # Get the schedule times and data
    get_working_schedule_response = get_working_schedule(request, doctor_id)

    if get_working_schedule_response.status_code == 200:
        schedule_times_data = get_working_schedule_response.data

        for item in schedule_times_data:
            start_time_str = item['start_time']
            end_time_str = item['end_time']

            try:
                # Convert time strings to datetime objects
                start_time = datetime.strptime(start_time_str, "%H:%M:%S")
                end_time = datetime.strptime(end_time_str, "%H:%M:%S")
            except ValueError:
                # Handle invalid time format
                continue

            # Check if hours are in the valid range (0 to 23)
            if not (0 <= start_time.hour <= 23) or not (0 <= end_time.hour <= 23):
                # Handle invalid hour values
                continue

            # Calculate the time duration in minutes
            minutes_duration = (end_time - start_time).seconds // 60

            # Calculate the number of appointments that can be scheduled
            per_patient_time = item['per_patient_time']
            num_appointments = minutes_duration // per_patient_time

            # Initialize current_time as the number of minutes since midnight
            current_time = start_time.hour * 60 + start_time.minute

            # Calculate and format the appointment times in 12-hour clock with AM/PM
            for _ in range(num_appointments):
                end_time_patient = current_time + per_patient_time
                formatted_start_time = (datetime(1900, 1, 1, current_time // 60, current_time % 60)).strftime(
                    "%I:%M %p")
                formatted_end_time = (datetime(1900, 1, 1, end_time_patient // 60, end_time_patient % 60)).strftime(
                    "%I:%M %p")
                appointment_times.append(f"{formatted_start_time} - {formatted_end_time}")
                current_time = end_time_patient

    return appointment_times


@api_view(['GET'])
def get_off_day_list(request, doctor_id):
    try:
        # Filter OffDay objects by the doctor_profile
        off_days = OffDay.objects.filter(doctor_profile_id=doctor_id)

        # Serialize the OffDay objects using OffDayForAppointmentSerializer
        serializer = OffDayForAppointmentSerializer(off_days, many=True)
        serialized_data = serializer.data

        # Return the serialized data as a JSON response
        return Response(serialized_data)
    except OffDay.DoesNotExist:
        # Handle the case where no off days are found for the specified doctor
        return Response({"error": "No off days found for this doctor"}, status=404)
    except Exception as e:
        # Handle any other exceptions or errors that may occur during the process
        return Response({"error": str(e)}, status=500)


@api_view(['GET'])
def get_working_schedule(request, doctor_id):
    try:
        # Query the database for ScheduleTime objects related to the specified doctor_id
        schedule_times = ScheduleTime.objects.filter(doctor_profile_id=doctor_id)

        # Use select_related or prefetch_related to optimize database queries if applicable
        # schedule_times = ScheduleTime.objects.filter(doctor_profile_id=doctor_id).select_related('doctor_profile')

        # Check if the doctor exists; if not, return a 404 Not Found response
        if not schedule_times.exists():
            return Response({"error": "Doctor not found"}, status=404)

        # Serialize the ScheduleTime objects
        serializer = ScheduleTimeInfoSerializer(schedule_times, many=True)
        serialized_data = serializer.data

        # Return the serialized data as a JSON response
        return Response(serialized_data)

    except ScheduleTime.DoesNotExist:
        return Response({"error": "No schedule times found for the specified doctor"}, status=404)
    except Exception as e:
        # Handle any other exceptions or errors that may occur during the process
        return Response({"error": str(e)}, status=500)
