from django.shortcuts import render
from rest_framework.response import Response
from rest_framework.decorators import api_view
from rest_framework.views import APIView
from rest_framework.authentication import SessionAuthentication
from rest_framework.permissions import IsAuthenticated
from django.http import HttpResponse, JsonResponse,HttpResponseRedirect
from django.db import connection
from rest_framework.exceptions import ValidationError
from django.contrib import messages
from myadmin.models import *
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
        myadmin_doctor AS ap
    INNER JOIN myadmin_department AS ad ON ap.department_id = ad.id
    ORDER BY ap.id   ASC
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


@api_view(['POST'])
def StoreOrganData(request):
    if request.method == 'POST':
        organSerializer = OrganSerializer(data=request.data)
        if organSerializer.is_valid():
            organSerializer.save()
            data = {'key': None}
            message = 'Success'
            status = 200
            return Response({'data': data, 'message': message, 'status': status})
        else:
            data = {'key': '403 Forbidden'}
            message = 'Error: Invalid request. Permission denied (e.g., invalid API key).'
            status = 403
            return Response({'data': data, 'message': message, 'status': status})
    else:
        data = {'key': '403 Forbidden'}
        message = 'Error: Invalid request method. Permission denied (e.g., invalid API key).'
        status = 403
        return Response({'data': data, 'message': message, 'status': status})


@api_view(['GET'])
def getAllOrgansList(request):
    query = """
    SELECT
        ao.id,
        ao.name,
        ao.description,
        ab.name AS bodypart_name
    FROM
        myadmin_organ AS ao
    INNER JOIN
        myadmin_bodypart AS ab ON ao.body_part_id = ab.id
    ORDER BY ao.id   ASC
    """
    with connection.cursor() as cursor:
        cursor.execute(query)
        results = cursor.fetchall()

    # Convert the query results into a list of dictionaries
    organs = []
    for row in results:
        organ = {
            'id': row[0],
            'name': row[1],
            'description': row[2],
            'bodypart_name': row[3],
        }
        # Check the values before appending
        organs.append(organ)
    # Serialize the data
    serializer = OrgansSerializer(data=organs, many=True)
    serializer.is_valid()
    return Response(serializer.data)


@api_view(['GET'])
def OrganApiView(request):
    organ = Organ.objects.all()
    serializer = OrganSerializer(organ, many=True)
    return Response(serializer.data)


@api_view(['POST'])
def StoreOrganProblemData(request):
    if request.method == 'POST':
        organProblemSerializer = OrganProblemSerializer(data=request.data)
        if organProblemSerializer.is_valid():
            organProblemSerializer.save()
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
def getAllOrganProblemList(request):
    query = """
    SELECT
        aop.id,
        aop.name,
        aop.description,
        ao.name AS organ_name
    FROM
        myadmin_organsprobleam AS aop
    INNER JOIN
        myadmin_organ AS ao ON aop.organ_id = ao.id
    ORDER BY aop.id   ASC
    """
    with connection.cursor() as cursor:
        cursor.execute(query)
        results = cursor.fetchall()

    # Convert the query results into a list of dictionaries
    organ_problems = []
    for row in results:
        organ_problem = {
            'id': row[0],
            'name': row[1],
            'description': row[2],
            'organ_name': row[3],
        }
        organ_problems.append(organ_problem)

    # Serialize the data
    serializer = OrganProblemsSerializer(data=organ_problems, many=True)
    serializer.is_valid()
    return Response(serializer.data)


@api_view(['POST'])
def StoreProblemSpecificationData(request):
    if request.method == 'POST':
        problemSpecificationSerializer = ProblemSpecificationSerializer(
            data=request.data)
        if problemSpecificationSerializer.is_valid():
            problemSpecificationSerializer.save()
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
def getAllProblemSpecificationList(request):
    query = """
    SELECT
    aps.id,
    aps.specification,
    aps.description,
    ao.name AS organ_name
    FROM
    myadmin_problemspecification AS aps
    INNER JOIN myadmin_organ AS ao
    WHERE
    aps.organ_id = ao.id
    ORDER BY aps.id   ASC
    """
    with connection.cursor() as cursor:
        cursor.execute(query)
        results = cursor.fetchall()

    # Convert the query results into a list of dictionaries
    problem_specifications = []
    for row in results:
        problem_specification = {
            'id': row[0],
            'specification': row[1],
            'description': row[2],
            'organ_name': row[3]
        }
        problem_specifications.append(problem_specification)

    # Serialize the data
    serializer = ProblemSpecificationsSerializer(
        data=problem_specifications, many=True)
    serializer.is_valid()

    return Response(serializer.data)


@api_view(['POST'])
def StoreDepartmentSpecificationData(request):
    if request.method == 'POST':

        departmentSpecificationSerializer = DepartmentSpecificationSerializer(
            data=request.data)
        if departmentSpecificationSerializer.is_valid():
            departmentSpecificationSerializer.save()
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
def getAllDepartmentSpecificationsList(request):
    # Execute the raw SQL query
    query = """
   SELECT
	ads.id,
    ads.description,
    ad.name AS department_name,
    aps.specification
    FROM
    myadmin_departmentspecification AS ads
    INNER JOIN myadmin_department AS ad
    INNER JOIN myadmin_problemspecification AS aps
    WHERE
    ads.department_id = ad.id AND ads.problem_specification_id = aps.id  
    ORDER BY ads.id   ASC
    """
    with connection.cursor() as cursor:
        cursor.execute(query)
        results = cursor.fetchall()

    # Convert the query results into a list of dictionaries
    department_specifications = []
    for row in results:
        department_specification = {
            'id': row[0],
            'description': row[1],
            'department_name': row[2],
            'problemspecification': row[3],
        }
        # Check the values before appending
        department_specifications.append(department_specification)
    # Serialize the data
    serializer = DepartmentSpecificationsSerializer(
        data=department_specifications, many=True)
    serializer.is_valid()
    return Response(serializer.data)
