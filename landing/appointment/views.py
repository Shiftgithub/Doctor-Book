import hashlib
from rest_framework.response import Response
from .serializers import *
from rest_framework.decorators import api_view
from admin.doctor.models import OffDay
from admin.doctor.models import ScheduleTime, AppointmentSchedule
from datetime import datetime, timedelta
from admin.patient.models import PatientProfile
from django.db import transaction
from admin.doctor.models import DoctorProfile
from admin.authentication.user.serializers import UserSerializer
from admin.patient.serializers import PatientSerializer
from admin.authentication.otp.function.send_email import generate_unique
from admin.authentication.user.models import Images
from admin.authentication.otp.function.send_email import generate_token
from admin.authentication.otp.verifyotp.models import VerifyOtp
from django.http import JsonResponse


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
        return Response({"error": "No off days found for this doctor", "status": 404})
    except Exception as e:
        # Handle any other exceptions or errors that may occur during the process
        return Response({"error": str(e), "status": 500})


def generate_date(request, doctor_id):
    # Get today's date
    today = datetime.now().date()
    # Create a list to store the dates and days
    date_list = []
    off_day_list = []

    off_days_response = get_off_day_list(request, doctor_id)

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


# Function to get existing appointment times
def get_existing_appointment_times(doctor_id, date):
    existing_appointment_data = GetAppointment.objects.filter(doctor=doctor_id, appointment_date=date)
    serializer = PatientAppointmentSerializer(existing_appointment_data, many=True)
    return [item['appointment_time'] for item in serializer.data]


# Function to generate schedule time
def generate_schedule_time(request, doctor_id, date):
    get_working_schedule_response = get_working_schedule(request, doctor_id)
    existing_appointment_times = get_existing_appointment_times(doctor_id, date)

    appointment_times = doctor_schedule_time(get_working_schedule_response, existing_appointment_times)

    # Return the appointment times as a JSON response
    data = {'appointment_times': appointment_times}
    return JsonResponse(data)


# Function to simplify doctor_schedule_time
def doctor_schedule_time(get_working_schedule_response, existing_appointment_times):
    if get_working_schedule_response.status_code == 200:
        schedule_times_data = get_working_schedule_response.data
        available_appointment_times = []

        for item in schedule_times_data:
            start_time, end_time = convert_to_datetime(item['start_time'], item['end_time'])

            if not is_valid_hour(start_time.hour) or not is_valid_hour(end_time.hour):
                continue

            minutes_duration = calculate_duration_in_minutes(start_time, end_time)
            per_patient_time = item['per_patient_time']
            num_appointments = calculate_num_appointments(minutes_duration, per_patient_time)

            current_time = calculate_minutes_since_midnight(start_time)

            for _ in range(num_appointments):
                end_time_patient = current_time + per_patient_time
                formatted_start_time = format_time(current_time)

                appointment_time_str = f"{formatted_start_time} - {format_time(end_time_patient)}"
                if appointment_time_str not in existing_appointment_times:
                    available_appointment_times.append(appointment_time_str)

                current_time = end_time_patient

        return available_appointment_times

    return None


def convert_to_datetime(start_time_str, end_time_str):
    start_time = datetime.strptime(start_time_str, "%H:%M:%S")
    end_time = datetime.strptime(end_time_str, "%H:%M:%S")
    return start_time, end_time


def is_valid_hour(hour):
    return 0 <= hour <= 23


def calculate_duration_in_minutes(start_time, end_time):
    return (end_time - start_time).seconds // 60


def calculate_num_appointments(minutes_duration, per_patient_time):
    return minutes_duration // per_patient_time


def calculate_minutes_since_midnight(time):
    return time.hour * 60 + time.minute


def format_time(minutes_since_midnight):
    return datetime(1900, 1, 1, minutes_since_midnight // 60, minutes_since_midnight % 60).strftime("%I:%M %p")


@api_view(['GET'])
def get_working_schedule(request, doctor_id):
    try:
        # Query the database for ScheduleTime objects related to the specified doctor_id
        schedule_times = ScheduleTime.objects.filter(doctor_profile_id=doctor_id)
        # Check if the doctor exists; if not, return a 404 Not Found response
        if not schedule_times.exists():
            return Response({"error": "Doctor not found", "status": 404})
        # Serialize the ScheduleTime objects
        serializer = ScheduleTimeInfoSerializer(schedule_times, many=True)
        serialized_data = serializer.data
        # Return the serialized data as a JSON response
        return Response(serialized_data)
    except ScheduleTime.DoesNotExist:
        return Response({"error": "No schedule times found for the specified doctor", "status": 404})
    except Exception as e:
        # Handle any other exceptions or errors that may occur during the process
        return Response({"error": str(e)})


@api_view(['POST'])
def date_time(request):
    date_time_serializer = DateTimeSerializer(data=request.data)
    if date_time_serializer.is_valid():
        appointment_date = date_time_serializer.validated_data['appointment_date']
        appointment_time = date_time_serializer.validated_data['appointment_time']
        return Response({'status': 308, 'appointment_date': appointment_date, 'appointment_time': appointment_time})
    else:
        return Response({'status': 403})


@api_view(['POST'])
def store_appointment_data(request):
    appointment_date = request.session.get('temp_appointment_date')
    appointment_time = request.session.get('temp_appointment_time')
    doctor_id = request.session.get('temp_doctor_id')
    appointment_serializer = PatientAppointmentSerializer(data=request.data)
    if appointment_serializer.is_valid():
        registration_id = request.data['registration_no']
        # Retrieve the PatientProfile instance using the registration_no
        try:
            patient = PatientProfile.objects.get(registration_no=registration_id)
        except PatientProfile.DoesNotExist:
            return Response({'status': 404, 'message': 'Patient not found'})
        # Retrieve the 'DoctorProfile' instance for the doctor using 'doctor_id'
        try:
            doctor = DoctorProfile.objects.get(id=doctor_id)
        except DoctorProfile.DoesNotExist:
            return Response({'status': 404, 'message': 'Doctor not found'})

        # Set the 'doctor' field to the retrieved 'User' instance
        appointment_serializer.save(
            appointment_date=appointment_date,
            appointment_time=appointment_time,
            doctor=doctor,
            patient=patient
        )
        return Response({'status': 200})
    else:
        return Response({'status': 403})


@api_view(['POST'])
def create_patient_account_store_appointment(request):
    appointment_date = request.session.get('temp_appointment_date')
    appointment_time = request.session.get('temp_appointment_time')
    doctor_id = request.session.get('temp_doctor_id')

    appointment_serializer = PatientAppointmentSerializer(data=request.data)
    patient_serializer = PatientSerializer(data=request.data)
    user_serializer = UserSerializer(data=request.data)
    if user_serializer.is_valid(raise_exception=True) and patient_serializer.is_valid():
        password = request.data.get('password')
        hashed_password = hashlib.sha256(password.encode()).hexdigest()

        with transaction.atomic():
            user_serializer.save(hash=hashed_password, role='patient', status='inactive')
            user_profile_instance = user_serializer.instance
            registration_no = generate_unique(18)
            patient = patient_serializer.save(user_id=user_profile_instance, registration_no=registration_no)

            image_serializer = Images(user_id=user_profile_instance)
            image_serializer.save()

            token_str = generate_token(6)
            email_fields = [user_serializer.validated_data['email']]
            email = ' - '.join(email_fields)
            message = f'Message From Doctor-Book [Personalized Doctor Predictor]:\n\nYour OTP number is: {token_str}'
            otp_serializer = VerifyOtp(otp=token_str, user_id=user_profile_instance)
            otp_serializer.save()
            # send_mail = send_email(email, message)
            if otp_serializer:
                if appointment_serializer.is_valid():
                    # Retrieve the 'DoctorProfile' instance for the doctor using 'doctor_id'
                    try:
                        doctor = DoctorProfile.objects.get(id=doctor_id)
                    except DoctorProfile.DoesNotExist:
                        return Response({'status': 404, 'message': 'Doctor not found'})

                    # Set the 'doctor' field to the retrieved 'User' instance
                    appointment_serializer.save(
                        appointment_date=appointment_date,
                        appointment_time=appointment_time,
                        doctor=doctor,
                        patient=patient
                    )
                    data = {'email': email, 'status': 200}
                    return Response(data)
                else:
                    transaction.set_rollback(True)
                    return Response({'status': 403})
            else:
                transaction.set_rollback(True)
                return Response({'status': 403})
    else:
        return Response({'status': 403})
