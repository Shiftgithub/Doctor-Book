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
from admin.authentication.otp.function.send_email import generate_unique, send_email
from admin.authentication.user.models import Images
from admin.authentication.otp.function.send_email import generate_token
from admin.authentication.otp.verifyotp.models import VerifyOtp
from django.http import JsonResponse
from django.utils import timezone
from django.shortcuts import get_object_or_404

from landing.prediction.serializers import PredictionUpdateSerializer
from ..prediction.models import Prediction


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
    # Step 1: Get all existing appointments for the specified doctor and date
    existing_appointments = GetAppointment.objects.filter(doctor=doctor_id, appointment_date=date)

    # Step 2: Extract the 'appointment_time' field from each appointment
    extracted_times = existing_appointments.values('appointment_time')

    # Step 3: Convert the queryset to a list of appointment times
    appointment_times = [appointment['appointment_time'] for appointment in extracted_times]

    # Step 4: Return the list of appointment times
    return appointment_times


# Add a new helper function to check if the time is after the current time
def is_time_after_current(time_str, current_time_str):
    formatted_time = datetime.strptime(time_str.split(" - ")[0], "%I:%M %p").time()
    current_time = datetime.strptime(current_time_str, "%I:%M %p").time()
    return formatted_time > current_time


# Function to generate schedule time
def generate_schedule_time(request, doctor_id, date):
    get_working_schedule_response = get_working_schedule(request, doctor_id)
    existing_appointment_times = get_existing_appointment_times(doctor_id, date)

    appointment_times = doctor_schedule_time(get_working_schedule_response, existing_appointment_times, date)

    # Return the appointment times as a JSON response
    data = {'appointment_times': appointment_times}
    return JsonResponse(data)


# Function to simplify doctor_schedule_time
def doctor_schedule_time(get_working_schedule_response, existing_appointment_times, date):
    if get_working_schedule_response.status_code == 200:
        schedule_times_data = get_working_schedule_response.data
        available_appointment_times = []
        today_date = datetime.now().date()
        formatted_today_date = today_date.strftime('%d-%m-%Y (%A)')

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

                # Check if the date is today
                if date == formatted_today_date:
                    current_time_now = datetime.now().strftime("%I:%M %p")

                    # Check if the appointment time is in the future
                    if is_time_after_current(formatted_start_time, current_time_now):
                        appointment_time_str = f"{formatted_start_time} - {format_time(end_time_patient)}"
                        # Check if the appointment time is not in existing_appointment_times
                        if appointment_time_str not in existing_appointment_times:
                            available_appointment_times.append(appointment_time_str)
                else:
                    appointment_time_str = f"{formatted_start_time} - {format_time(end_time_patient)}"

                    # Check if the appointment time is not in existing_appointment_times
                    if appointment_time_str not in existing_appointment_times:
                        available_appointment_times.append(appointment_time_str)

                current_time = end_time_patient
        # Move the return statement outside the loop
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
    # Calculate hours and minutes
    hours = minutes_since_midnight // 60
    minutes = minutes_since_midnight % 60

    # Ensure hours is within the valid range (0 to 23)
    hours = hours % 24

    # Create a datetime object with a dummy date (1900, 1, 1)
    return datetime(1900, 1, 1, hours, minutes).strftime("%I:%M %p")


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
        response = {'status': 308, 'appointment_date': appointment_date, 'appointment_time': appointment_time,
                    'message': 'Please Enter your registration ID or Create a new account for registration ID'}
        return Response(response)
    else:
        return Response({'status': 400, 'message': 'Invalid request!'})


@api_view(['POST'])
@transaction.atomic
def store_appointment_data(request):
    appointment_date = request.session.get('temp_appointment_date')
    appointment_time = request.session.get('temp_appointment_time')
    doctor_id = request.session.get('temp_doctor_id')
    prediction_id = request.session['prediction_id']
    if appointment_date and appointment_time and doctor_id:
        get_appointment = GetAppointment.objects.filter(doctor=doctor_id, appointment_date=appointment_date,
                                                        appointment_time=appointment_time, deleted_at=None)
        if get_appointment.exists():
            return Response({'status': 404, 'message': 'this time already taken'})
        else:
            appointment_serializer = PatientAppointmentSerializer(data=request.data)
            if appointment_serializer.is_valid():
                registration_id = request.data['registration_no']
                try:
                    patient = PatientProfile.objects.get(registration_no=registration_id)
                except PatientProfile.DoesNotExist:
                    return Response({'status': 404, 'message': 'Patient not found'})
                try:
                    doctor = DoctorProfile.objects.get(id=doctor_id)
                except DoctorProfile.DoesNotExist:
                    return Response({'status': 404, 'message': 'Doctor not found'})
                prediction = get_object_or_404(Prediction, id=prediction_id, deleted_at=None)
                prediction_serializer = PredictionUpdateSerializer(prediction, data={'created_by': patient.id},
                                                                   partial=True)
                if prediction_serializer.is_valid():
                    prediction_obj = prediction_serializer.save()
                # Set the 'doctor' field to the retrieved 'User' instance
                appointment = appointment_serializer.save(
                    appointment_date=appointment_date,
                    appointment_time=appointment_time,
                    doctor=doctor,
                    patient=patient
                )
                prediction = prediction_serializer.save(created_by=patient)
                if appointment and prediction:
                    return Response({'status': 200, 'message': 'Appointment request send successfully'})
                else:
                    transaction.set_rollback(True)
                    return Response({'status': 403, 'message': 'Error in request appointment schedule'})
            else:
                return Response({'status': 400, 'message': 'Invalid request!'})
    else:
        return Response({'status': 403, 'message': 'Invalid doctor id or appointment date or appointment time!'})


@api_view(['POST'])
@transaction.atomic
def create_patient_account_store_appointment(request):
    appointment_date = request.session.get('temp_appointment_date')
    appointment_time = request.session.get('temp_appointment_time')
    doctor_id = request.session.get('temp_doctor_id')
    prediction_id = request.session['prediction_id']
    if appointment_date and appointment_time and doctor_id:
        get_appointment = GetAppointment.objects.filter(doctor=doctor_id, appointment_date=appointment_date,
                                                        appointment_time=appointment_time, deleted_at=None)
        if get_appointment.exists():
            return Response({'status': 404, 'message': 'this time already taken'})
        else:
            patient_serializer = PatientSerializer(data=request.data)
            user_serializer = UserSerializer(data=request.data)
            appointment_serializer = PatientAppointmentSerializer(data=request.data)

            if user_serializer.is_valid(raise_exception=True) and patient_serializer.is_valid():
                user_name = request.data.get('user_name')
                email = request.data.get('email')

                if User.objects.filter(user_name=user_name).exists():
                    return Response({'message': 'This User name already taken. Please try another.', 'status': 404})

                if User.objects.filter(email=email, ).exists():
                    return Response({'message': 'This email already used. Please try another.', 'status': 404})

                hashed_password = hashlib.sha256(request.data.get('password').encode()).hexdigest()

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
<<<<<<< HEAD
                # send_mail = send_email(email, message)
                if otp_serializer:
=======
                sent_email = send_email(email, message)
                if otp_serializer and sent_email:
>>>>>>> 0a0d8f532772ef8919a2217788d4c6179800016c
                    if appointment_serializer.is_valid():
                        # Retrieve the 'DoctorProfile' instance for the doctor using 'doctor_id'
                        try:
                            doctor = DoctorProfile.objects.get(id=doctor_id)
                        except DoctorProfile.DoesNotExist:
                            return Response({'status': 404, 'message': 'Doctor not found'})

                        # Set the 'doctor' field to the retrieved 'User' instance
                        appointment = appointment_serializer.save(
                            appointment_date=appointment_date,
                            appointment_time=appointment_time,
                            doctor=doctor,
                            patient=patient
                        )
                        prediction = get_object_or_404(Prediction, id=prediction_id, deleted_at=None)
                        prediction_serializer = PredictionUpdateSerializer(prediction, data={'created_by': patient.id},
                                                                           partial=True)
                        if prediction_serializer.is_valid():
                            prediction_obj = prediction_serializer.save()
                            if appointment and prediction_obj:
                                data = {'email': email, 'status': 200,
                                        'message': 'Appointment request send successfully. We send otp on your email please active your account using otp'}
                                return Response(data)
                            else:
                                transaction.set_rollback(True)
                                return Response({'status': 403, 'message': 'Error in sending appointment request!'})
                        else:
                            transaction.set_rollback(True)
                            return Response({'status': 404, 'message': 'Invalid request!'})
                    else:
                        transaction.set_rollback(True)
                        return Response({'status': 404, 'message': 'Invalid request!'})
                else:
                    transaction.set_rollback(True)
                    return Response({'status': 404, 'message': 'Invalid Otp request!'})
            else:
                return Response({'status': 404, 'message': 'Invalid request!'})
    else:
        return Response({'status': 403, 'message': 'Invalid doctor id or appointment date or appointment time!'})


@api_view(['GET'])
def get_all_appointment_list(request):
    appointments = GetAppointment.objects.filter(deleted_at=None).order_by('-id')

    serialized_data = PatientAppointmentSerializer(appointments, many=True).data
    return Response(serialized_data)


@api_view(['GET'])
def get_all_appointment_by_doctor(request, doctor_id):
    appointments = GetAppointment.objects.filter(doctor=doctor_id, deleted_at=None).order_by('-appointment_date',
                                                                                             '-appointment_time')
    serialized_data = PatientAppointmentViewSerializer(appointments, many=True).data
    return Response(serialized_data)


@api_view(['GET'])
def get_appointment_list_by_date(request, doctor_id):
    today_date = datetime.now().date()
    formatted_today_date = today_date.strftime('%d-%m-%Y (%A)')

    appointments = GetAppointment.objects.filter(
        appointment_date=formatted_today_date, doctor=doctor_id, deleted_at=None
    ).order_by('-appointment_date', '-appointment_time')  # Add this line to order by date and time

    serialized_data = PatientAppointmentViewSerializer(appointments, many=True).data
    return Response(serialized_data)


@api_view(['GET'])
def count_appointments(request, doctor_id):
    today_date = datetime.now().date()
    formatted_today_date = today_date.strftime('%d-%m-%Y (%A)')

    appointments = GetAppointment.objects.filter(appointment_date=formatted_today_date,
                                                 doctor=doctor_id, deleted_at=None).order_by('-id')
    appointments_count = appointments.count()

    serialized_data = {'appointments_count': appointments_count}

    return Response(serialized_data)


@api_view(['POST'])
def get_store_appointment(request):
    appointment_serializer = PatientAppointmentSerializer(data=request.data)
    if appointment_serializer.is_valid():
        patient_id = request.data.get('patient')
        doctor_id = request.data.get('doctor')
        appointment_date = appointment_serializer.validated_data['appointment_date']
        appointment_time = appointment_serializer.validated_data['appointment_time']
        try:
            patient = PatientProfile.objects.get(id=patient_id, deleted_at=None)
        except PatientProfile.DoesNotExist:
            return Response({'status': 404, 'message': 'Patient not found'})

        try:
            doctor = DoctorProfile.objects.get(id=doctor_id)
        except DoctorProfile.DoesNotExist:
            return Response({'status': 404, 'message': 'Doctor not found'})

        # Try to retrieve the existing appointment
        get_appointment = GetAppointment.objects.filter(
            doctor_id=doctor_id,  # Use the actual ID, assuming doctor_id is the ID of DoctorProfile
            appointment_date=appointment_date,
            appointment_time=appointment_time,
            deleted_at=None
        )
        if get_appointment.exists():
            return Response({'status': 403, 'message': 'This time is already taken'})
        else:
            if appointment_serializer.save(
                    appointment_date=appointment_date,
                    appointment_time=appointment_time,
                    doctor=doctor,
                    patient=patient
            ):
                return Response({'status': 200, 'message': 'Appointment data stored successfully'})
            else:
                return Response({'status': 400, 'message': 'Invalid data'})
    else:
        return Response({'status': 400, 'message': 'Invalid data'})


@api_view(['PUT', 'POST'])
def edit_appointment_data(request, appointment_id):
    # Use get_object_or_404 for fetching the appointment
    appointment = get_object_or_404(GetAppointment, id=appointment_id, deleted_at=None)
    serializer = PatientAppointmentSerializer(appointment, data=request.data)
    # Check if the appointment is found before proceeding
    if not appointment:
        return Response({'status': 404, 'message': 'Appointment not found'})

    if serializer.is_valid():
        doctor_id = request.data.get('doctor')

        try:
            doctor = DoctorProfile.objects.get(id=doctor_id)
        except DoctorProfile.DoesNotExist:
            return Response({'status': 404, 'message': 'Doctor not found'})

        if serializer.save(doctor=doctor, updated_at=timezone.now()):
            return Response({'status': 200, 'message': 'Appointment data updated successfully'})
        else:
            return Response({'status': 403, 'message': 'Error in updating appointment data'})
    else:
        return Response({'status': 403, 'message': 'Invalid data!'})


@api_view(['GET'])
def appointment_data_view(request, appointment_id):
    appointment = GetAppointment.objects.get(id=appointment_id)

    serializer = PatientAppointmentViewSerializer(appointment, many=False)

    return Response(serializer.data)
<<<<<<< HEAD
=======


@api_view(['GET'])
def get_all_appointment_by_patient(request, patient_id):
    appointments = GetAppointment.objects.filter(patient=patient_id, deleted_at=None).order_by('-appointment_date',
                                                                                               '-appointment_time')
    serialized_data = PatientAppointmentViewSerializer(appointments, many=True).data
    return Response(serialized_data)
>>>>>>> 0a0d8f532772ef8919a2217788d4c6179800016c
