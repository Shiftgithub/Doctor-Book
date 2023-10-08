from admin.bodypart.models import BodyPart
from admin.bodypart.serializers import BodyPartSerializer
from rest_framework.response import Response
from landing.prediction.serializers import *
from rest_framework.decorators import api_view
from datetime import datetime, timedelta
from admin.doctor.models import Doctor_Profile
from admin.organ.serializers import OrganBodyPartSerializer
from admin.department_speci.models import DepartmentSpecification
from admin.organ_problem_speci.serializers import OrganProblemSerializer
from admin.doctor.models import OffDay
from admin.doctor.serializers import OffDaySerializer


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


@api_view(['GET'])
def get_off_day_list(request, doctor_id):
    # Filter OffDay objects by the doctor_profile
    off_days = OffDay.objects.filter(doctor_profile_id=doctor_id)

    serializer = OffDayForAppointmentSerializer(off_days, many=True)
    serialized_data = serializer.data
    return Response(serialized_data)
