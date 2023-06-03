from rest_framework.response import Response
from rest_framework.decorators import api_view
from django.http import JsonResponse
from django.db import connection
from .serializers import *


@api_view(['POST'])
def store_bodypart_data(request):
    if request.method == 'POST':
        bodypart_serializer = BodyPartSerializer(data=request.data)
        if bodypart_serializer.is_valid():
            bodypart_serializer.save()
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
def geta_all_bodypart_list(request):
    bodypart = BodyPart.objects.all()
    serializer = BodyPartSerializer(bodypart, many=True)
    return Response(serializer.data)


@api_view(['POST'])
def store_department_data(request):
    if request.method == 'POST':
        department_serializer = DepartmentSerializer(data=request.data)
        if department_serializer.is_valid():
            department_serializer.save()
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
def get_all_departments_list(request):
    department = Department.objects.all()
    serializer = DepartmentSerializer(department, many=True)
    return Response(serializer.data)


@api_view(['POST'])
def store_organ_data(request):
    if request.method == 'POST':
        organ_serializer = OrganSerializer(data=request.data)
        if organ_serializer.is_valid():
            organ_serializer.save()
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
def get_all_organs_list(request):
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
def organ_apiview(request):
    organ = Organ.objects.all()
    serializer = OrganSerializer(organ, many=True)
    return Response(serializer.data)


@api_view(['POST'])
def store_organ_problem_data(request):
    if request.method == 'POST':
        organ_problem_serializer = OrganProblemSerializer(data=request.data)
        if organ_problem_serializer.is_valid():
            organ_problem_serializer.save()
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
def get_all_organ_problem_list(request):
    query = """
    SELECT
        aop.id,
        aop.name,
        aop.description,
        ao.name AS organ_name
    FROM
        myadmin_organsproblem AS aop
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
def store_problem_specification_data(request):
    if request.method == 'POST':
        problem_specification_serializer = ProblemSpecificationSerializer(data=request.data)
        if problem_specification_serializer.is_valid():
            problem_specification_serializer.save()
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
def get_all_problem_specification_list(request):
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
def store_department_specification_data(request):
    if request.method == 'POST':

        department_specification_serializer = DepartmentSpecificationSerializer(
            data=request.data)
        if department_specification_serializer.is_valid():
            department_specification_serializer.save()
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
def get_all_department_specifications_list(request):
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
