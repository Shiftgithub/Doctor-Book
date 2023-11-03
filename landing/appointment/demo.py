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
            formatted_start_time = (
                datetime(1900, 1, 1, current_time // 60, current_time % 60)).strftime(
                "%I:%M %p")
            formatted_end_time = (
                datetime(1900, 1, 1, end_time_patient // 60, end_time_patient % 60)).strftime(
                "%I:%M %p")

            appointment_times.append(f"{formatted_start_time} - {formatted_end_time}")
            current_time = end_time_patient

            # Create a new list with elements that don't match the 'time'
print(appointment_times)