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
def get_all_bodypart_list(request):
    bodypart = BodyPart.objects.all()
    serializer = BodyPartSerializer(bodypart, many=True)
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
        mo.id,
        mo.name,
        mo.description,
        mb.name AS bodypart_name
    FROM
        myadmin_organ AS mo
    INNER JOIN
        myadmin_bodypart AS mb ON mo.body_part_id = mb.id
    ORDER BY mo.id   ASC
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
        mop.id,
        mop.name,
        mop.description,
        mo.name AS organ_name
    FROM
        myadmin_organsproblem AS mop
    INNER JOIN
        myadmin_organ AS mo ON mop.organ_id = mo.id
    ORDER BY mop.id   ASC
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
    mps.id,
    mps.specification,
    mps.description,
    mo.name AS organ_name
    FROM
    myadmin_problemspecification AS mps
    INNER JOIN myadmin_organ AS mo
    WHERE
    mps.organ_id = mo.id
    ORDER BY mps.id   ASC
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
	mds.id,
    mds.description,
    md.name AS department_name,
    mps.specification
    FROM
    myadmin_departmentspecification AS mds
    INNER JOIN myadmin_department AS md
    INNER JOIN myadmin_problemspecification AS mps
    WHERE
    mds.department_id = md.id AND mds.problem_specification_id = mps.id  
    ORDER BY mds.id   ASC
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

# FAQ 
@api_view(['POST'])
def store_faq_data(request):
    if request.method == 'POST':
        faq_serializer = FAQSerializer(data=request.data)
        if faq_serializer.is_valid():
            faq_serializer.save()
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
def get_all_faq_list(request):
    faq = FAQ.objects.all()
    serializer = FAQSerializer(faq, many=True)
    return Response(serializer.data)

# Article 
@api_view(['POST'])
def store_article_data(request):
    if request.method == 'POST':
        article_serializer = ArticleSerializer(data=request.data)
        if article_serializer.is_valid():
            article_serializer.save()
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
def get_all_article_list(request):
    article = Article.objects.all()
    serializer = ArticleSerializer(article, many=True)
    return Response(serializer.data)