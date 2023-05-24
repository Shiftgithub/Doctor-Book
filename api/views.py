from django.shortcuts import render
from rest_framework.response import Response
from rest_framework.decorators import api_view
from rest_framework.views import APIView
from rest_framework.authentication import SessionAuthentication
from rest_framework.permissions import IsAuthenticated
from django.http import HttpResponse, JsonResponse
from django.db import connection
from app.models import *
from .serializers import *


@api_view(['POST'])
def StoreDepartmentData(request):
    if request.method == 'POST':
        departmentSerializer = DepartmentSerializer(data=request.data)
        if departmentSerializer.is_valid():
            departmentSerializer.save()
            data = {'key': 'null'}
            message = 'Success'
            status = 200
            return JsonResponse({'data': data, 'message': message, 'status': status})
        else:
            data = {'key': '403 Forbidden'}
            message = 'Error: Invalid request. Permission denied (e.g. invalid API key).'
            status = 403
            return JsonResponse({'data': data, 'message': message, 'status': status})
    else:
        data = {'key': '403 Forbidden'}
        message = 'Error: Invalid request.'
        status = 403
        return JsonResponse({'data': data, 'message': message, 'status': status})


@api_view(['GET'])
def getAllDepartmentsList(request):
    department = Department.objects.all()
    serializer = DepartmentSerializer(department, many=True)
    return Response(serializer.data)


@api_view(['POST'])
def StoreDoctorData(request):
    if request.method == 'POST':
        doctorSerializer = DoctorSerializer(data=request.data)
        print(doctorSerializer)
        if doctorSerializer.is_valid():
            doctorSerializer.save()
            data = {'key': 'null'}
            message = 'Sucess'
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
def getAllDoctorsList(request):
    # Execute the raw SQL query
    query = """
    SELECT
        ap.id ,
        ap.name ,
        ap.description ,
        ad.name AS department_name
    FROM
        app_doctor AS ap
    INNER JOIN app_department AS ad ON ap.department_id = ad.id
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


@api_view(['POST'])
def StoreBodyPartData(request):
    if request.method == 'POST':
        bodyPartSerializer = BodyPartSerializer(data=request.data)
        if bodyPartSerializer.is_valid():
            bodyPartSerializer.save()
            data = {'key': 'null'}
            message = 'Success'
            status = 200
            return JsonResponse({'data': data, 'message': message, 'status': status})
        else:
            data = {'key': '403 Forbidden'}
            message = 'Error: Invalid request. Permission denied (e.g. invalid API key).'
            status = 403
            return JsonResponse({'data': data, 'message': message, 'status': status})
    else:
        data = {'key': '403 Forbidden'}
        message = 'Error: Invalid request.'
        status = 403
        return JsonResponse({'data': data, 'message': message, 'status': status})


@api_view(['GET'])
def getAllBodyPartsList(request):
    bodyPart = BodyPart.objects.all()
    serializer = BodyPartSerializer(bodyPart, many=True)
    return Response(serializer.data)
