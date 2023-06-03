from rest_framework.response import Response
from rest_framework.decorators import api_view
from django.http import JsonResponse
from django.db import connection
from .serializers import *


@api_view(['POST'])
def store_doctor_data(request):
    if request.method == 'POST':
        doctor_serializer = DoctorSerializer(data=request.data)
        if doctor_serializer.is_valid():
            doctor_serializer.save()
            data = {'key': 'null'}
            message = 'Success'
            status = 200
            return JsonResponse({'data': data, 'message': message, 'status': 200})
        else:
            data = {'key': '403 Forbidden'}
            message = 'Error: Invalid request. Permission denied (e.g. invalid API key).'
            status = 403
            return JsonResponse({'data': data, 'message': message, 'status': status})
    else:
        data = {'key': '403 Forbidden'}
        message = 'Else-2 Error: Invalid request. Permission denied (e.g. invalid API key).'
        status = 403
        return JsonResponse({'data': data, 'message': message, 'status': status})


@api_view(['GET'])
def get_all_doctors_list(request):
    # Execute the raw SQL query
    query = """
    SELECT
    dd.id,
    dd.name,
    dd.description,
    md.name AS department_name
    FROM
    doctor_doctor AS dd
    INNER JOIN myadmin_department AS md
    ON
    dd.department_id = md.id
    ORDER BY
    dd.id ASC
    """
    with connection.cursor() as cursor:
        cursor.execute(query)
        results = cursor.fetchall()

    # Convert the query results into a list of dictionaries
    doctors = []
    for row in results:
        doctor = {
            'id': row[0],
            'name': row[1],
            'description': row[2],
            'department_name': row[3],
        }
        # Check the values before appending
        doctors.append(doctor)
    # Serialize the data
    serializer = DoctorsSerializer(data=doctors, many=True)
    serializer.is_valid()
    return Response(serializer.data)
