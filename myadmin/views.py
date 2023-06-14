from .models import *
from .serializers import *
from datetime import datetime
from django.db import connection
from django.http import JsonResponse
from rest_framework.response import Response
from rest_framework.decorators import api_view
from django.shortcuts import get_object_or_404


# store bodypart funtion

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


# all bodypart list funtion

@api_view(['GET'])
def get_all_bodypart_list(request):
    query = """
    SELECT * FROM
    myadmin_bodypart
    WHERE deleted_at IS NULL
    ORDER BY id ASC
    """
    with connection.cursor() as cursor:
        cursor.execute(query)
        results = cursor.fetchall()

    # Convert the query results into a list of dictionaries
    bodyparts = []
    for row in results:
        bodypart = {
            'id': row[0],
            'name': row[1],
            'description': row[2],
        }
        bodyparts.append(bodypart)

    serializer = BodyPartSerializer(bodyparts, many=True)
    serialized_data = serializer.data

    return Response(serialized_data)


#  bodypart data show using id funtion

@api_view(['GET'])
def bodypart_dataview(request, bodypart_id):
    query = """
    SELECT * FROM myadmin_bodypart
    WHERE id = %s AND deleted_at IS NULL
    """
    with connection.cursor() as cursor:
        cursor.execute(query, [bodypart_id])
        results = cursor.fetchall()

    for row in results:
        bodypart = {
            'id': row[0],
            'name': row[1],
            'description': row[2],
            'created_at': row[3],
            'updated_at': row[4],
        }

    serializer = BodyPartSerializer(instance=bodypart)
    serialized_data = serializer.data
    return Response(serialized_data)


# bodypart edit funtion

@api_view(['PUT', 'POST'])
def edit_bodypart_data(request, bodypart_id):
    bodypart = BodyPart.objects.get(id=bodypart_id)
    serializer = BodyPartSerializer(bodypart, data=request.data)
    if serializer.is_valid():
        serializer.save(updated_at=datetime.now())
        data = {'key': None}
        message = 'Success'
        status = 200
        return Response({'data': data, 'message': message, 'status': status})
    else:
        data = {'key': '403 Forbidden'}
        message = 'Error: Invalid request. Permission denied (e.g., invalid API key).'
        status = 403
        return Response({'data': data, 'message': message, 'status': status})


# bodypart delete funtion
@api_view(['PUT', 'GET'])
def softdelete_bodypart_data(request, bodypart_id):
    bodypart = BodyPart.objects.get(id=bodypart_id)
    serializer = BodyPartDeleteSerializer(bodypart, data=request.data)
    if serializer.is_valid():
        serializer.save(deleted_at=datetime.now())
        data = {'key': None}
        message = 'Success'
        status = 200
        return Response({'data': data, 'message': message, 'status': status})
    else:
        data = {'key': '403 Forbidden'}
        message = 'Error: Invalid request. Permission denied (e.g., invalid API key).'
        status = 403
        return Response({'data': data, 'message': message, 'status': status})


# store organ data


@api_view(['POST'])
def store_organ_data(request):
    if request.method == 'POST':
        body_part_id = request.POST.get('body_part')
        organs = request.POST.getlist('names[]')
        descriptions = request.POST.getlist('descriptions[]')

        # Retrieve the BodyPart instance
        body_part = BodyPart.objects.get(id=body_part_id)

        for organ, description in zip(organs, descriptions):
            # Create and save the Organ object to the database
            organ_obj = Organ(body_part=body_part, name=organ, description=description)
            organ_obj.save()

        # Redirect to a success page or perform any desired actions
        data = {'key': None}
        message = 'Success'
        status = 200
        return Response({'data': data, 'message': message, 'status': status})
    else:
        data = {'key': '403 Forbidden'}
        message = 'Error: Invalid request method. Permission denied (e.g., invalid API key).'
        status = 403
        return Response({'data': data, 'message': message, 'status': status})


# all organ list function

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
    INNER JOIN myadmin_bodypart AS mb
    ON
    mo.body_part_id = mb.id
    WHERE mo.deleted_at IS NULL
    ORDER BY
    mo.id ASC
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
    serializer = OrganSerializer(organs, many=True)
    serialized_data = serializer.data

    return Response(serialized_data)


# single organ data using id

@api_view(['GET'])
def organ_dataview(request, organ_id):
    query = """
        SELECT
        mo.id,
        mo.name,
        mo.description,
        mo.created_at,
        mo.updated_at,
        mb.name AS bodypart_name
        FROM myadmin_organ AS mo
        INNER JOIN myadmin_bodypart AS mb
        ON mo.body_part_id = mb.id
        WHERE mo.id = %s AND mo.deleted_at IS NULL 
        ORDER BY mo.id ASC
    """
    with connection.cursor() as cursor:
        cursor.execute(query, [organ_id])
        results = cursor.fetchall()

    for row in results:
        organ = {
            'id': row[0],
            'name': row[1],
            'description': row[2],
            'created_at': row[3],
            'updated_at': row[4],
            'bodypart_name': row[5],
        }

    serializer = OrganSerializer(instance=organ)
    serialized_data = serializer.data
    return Response(serialized_data)


# edit organ data

@api_view(['PUT', 'POST'])
def edit_organ_data(request, organ_id):
    organ = Organ.objects.get(id=organ_id)
    serializer = OrganStoreSerializer(organ, data=request.data)
    if serializer.is_valid():
        serializer.save(updated_at=datetime.now())
        data = {'key': None}
        message = 'Success'
        status = 200
        return Response({'data': data, 'message': message, 'status': status})
    else:
        data = {'key': '403 Forbidden'}
        message = 'Error: Invalid request. Permission denied (e.g., invalid API key).'
        status = 403
        return Response({'data': data, 'message': message, 'status': status})


# delete organ data

@api_view(['PUT', 'GET'])
def softdelete_organ_data(request, bodypart_id):
    organ = Organ.objects.get(id=bodypart_id)
    serializer = OrganDeleteSerializer(organ, data=request.data)
    if serializer.is_valid():
        serializer.save(deleted_at=datetime.now())
        data = {'key': None}
        message = 'Success'
        status = 200
        return Response({'data': data, 'message': message, 'status': status})
    else:
        data = {'key': '403 Forbidden'}
        message = 'Error: Invalid request. Permission denied (e.g., invalid API key).'
        status = 403
        return Response({'data': data, 'message': message, 'status': status})


# store organ problem data
@api_view(['POST'])
def store_organ_problem_data(request):
    if request.method == 'POST':
        organ_id = request.POST.get('organ')
        organ_problems = request.POST.getlist('names[]')
        descriptions = request.POST.getlist('descriptions[]')

        # Retrieve the BodyPart instance
        organid = Organ.objects.get(id=organ_id)

        for organ_problem, description in zip(organ_problems, descriptions):
            # Create and save the Organ object to the database
            organ_problem_obj = OrgansProblem(organ=organid, name=organ_problem, description=description)
            organ_problem_obj.save()

        # Redirect to a success page or perform any desired actions
        data = {'key': None}
        message = 'Success'
        status = 200
        return Response({'data': data, 'message': message, 'status': status})
    else:
        data = {'key': '403 Forbidden'}
        message = 'Error: Invalid request method. Permission denied (e.g., invalid API key).'
        status = 403
        return Response({'data': data, 'message': message, 'status': status})


# all organproblem data

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
    WHERE mop.deleted_at IS NULL
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
    serializer = OrganProblemSerializer(organ_problems, many=True)
    serialized_data = serializer.data
    return Response(serialized_data)


# single organ problem data using id

@api_view(['GET'])
def organ_problem_dataview(request, organ_problem_id):
    query = """
        SELECT
        mop.id,
        mop.name,
        mop.description,
        mop.created_at,
        mop.updated_at,
        mo.name AS organ_name
        FROM
        myadmin_organsproblem AS mop
        INNER JOIN
        myadmin_organ AS mo ON mop.organ_id = mo.id
        WHERE mop.id = %s AND mop.deleted_at IS NULL 
        ORDER BY mop.id   ASC
    """
    with connection.cursor() as cursor:
        cursor.execute(query, [organ_problem_id])
        results = cursor.fetchall()

    for row in results:
        organ_problem = {
            'id': row[0],
            'name': row[1],
            'description': row[2],
            'created_at': row[3],
            'updated_at': row[4],
            'organ_name': row[5],
        }

    serializer = OrganProblemSerializer(instance=organ_problem)
    serialized_data = serializer.data
    return Response(serialized_data)


# edit organ problem data

@api_view(['PUT', 'POST'])
def edit_organ_problem_data(request, organ_problem_id):
    organ_problem = OrgansProblem.objects.get(id=organ_problem_id)
    serializer = OrganProblemStoreSerializer(organ_problem, data=request.data)
    if serializer.is_valid():
        serializer.save(updated_at=datetime.now())
        data = {'key': None}
        message = 'Success'
        status = 200
        return Response({'data': data, 'message': message, 'status': status})
    else:
        data = {'key': '403 Forbidden'}
        message = 'Error: Invalid request. Permission denied (e.g., invalid API key).'
        status = 403
        return Response({'data': data, 'message': message, 'status': status})


# delete organ problem data

@api_view(['PUT', 'GET'])
def softdelete_organ_problem_data(request, organ_problem_id):
    organ_problem = OrgansProblem.objects.get(id=organ_problem_id)
    serializer = OrganProblemDeleteSerializer(organ_problem, data=request.data)
    if serializer.is_valid():
        serializer.save(deleted_at=datetime.now())
        data = {'key': None}
        message = 'Success'
        status = 200
        return Response({'data': data, 'message': message, 'status': status})
    else:
        data = {'key': '403 Forbidden'}
        message = 'Error: Invalid request. Permission denied (e.g., invalid API key).'
        status = 403
        return Response({'data': data, 'message': message, 'status': status})


# problem specification store 

@api_view(['POST'])
def store_problem_specification_data(request):
    if request.method == 'POST':
        organ_problem_id = request.POST.get('organ_problem')
        specifications = request.POST.getlist('specifications[]')
        descriptions = request.POST.getlist('descriptions[]')

        # Retrieve the BodyPart instance
        organ_problem = OrgansProblem.objects.get(id=organ_problem_id)

        for specification, description in zip(specifications, descriptions):
            # Create and save the Organ object to the database
            problem_specification_obj = ProblemSpecification(organ_problem=organ_problem,
                                                             specification=specification, description=description)
            problem_specification_obj.save()

        # Redirect to a success page or perform any desired actions
        data = {'key': None}
        message = 'Success'
        status = 200
        return Response({'data': data, 'message': message, 'status': status})
    else:
        data = {'key': '403 Forbidden'}
        message = 'Error: Invalid request method. Permission denied (e.g., invalid API key).'
        status = 403
        return Response({'data': data, 'message': message, 'status': status})


# get all data

@api_view(['GET'])
def get_all_problem_specification_list(request):
    query = """
        SELECT
        mps.id,
        mps.specification,
        mps.description,
        organ_problem.name AS organ_problem_name
        FROM
        myadmin_problemspecification AS mps
        INNER JOIN myadmin_organsproblem AS organ_problem
        WHERE mps.organ_problem_id = organ_problem.id AND mps.deleted_at IS NULL
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
            'organ_problem': row[3],
        }
        problem_specifications.append(problem_specification)

    # Serialize the data
    serializer = ProblemSpecificationSerializer(problem_specifications, many=True)
    serialized_data = serializer.data
    return Response(serialized_data)


# single problem specification data using id

@api_view(['GET'])
def problem_specification_dataview(request, problem_specification_id):
    query = """
        SELECT
        mps.id,
        mps.specification,
        mps.description,
        organ_problem.name AS organ_problem_name,
        mps.created_at,
        mps.updated_at
        FROM myadmin_problemspecification AS mps
        INNER JOIN myadmin_organsproblem AS organ_problem
        WHERE mps.id = %s AND
        mps.organ_problem_id = organ_problem.id AND mps.deleted_at IS NULL
    """
    with connection.cursor() as cursor:
        cursor.execute(query, [problem_specification_id])
        results = cursor.fetchall()

    for row in results:
        problem_specification = {
            'id': row[0],
            'specification': row[1],
            'description': row[2],
            'organ_problem': row[3],
            'created_at': row[4],
            'updated_at': row[5],
        }

    serializer = ProblemSpecificationSerializer(instance=problem_specification)
    serialized_data = serializer.data
    return Response(serialized_data)


# edit problem specification data

@api_view(['PUT', 'POST'])
def edit_problem_specification_data(request, problem_specification_id):
    problem_specification = ProblemSpecification.objects.get(id=problem_specification_id)
    serializer = ProblemSpecificationStoreSerializer(problem_specification, data=request.data)
    if serializer.is_valid():
        serializer.save(updated_at=datetime.now())
        data = {'key': None}
        message = 'Success'
        status = 200
        return Response({'data': data, 'message': message, 'status': status})
    else:
        data = {'key': '403 Forbidden'}
        message = 'Error: Invalid request. Permission denied (e.g., invalid API key).'
        status = 403
        return Response({'data': data, 'message': message, 'status': status})


# delete Problem Specification data

@api_view(['PUT', 'GET'])
def softdelete_problem_specification_data(request, problem_specification_id):
    problem_specification = ProblemSpecification.objects.get(id=problem_specification_id)
    serializer = ProblemSpecificationDeleteSerializer(problem_specification, data=request.data)
    if serializer.is_valid():
        serializer.save(deleted_at=datetime.now())
        data = {'key': None}
        message = 'Success'
        status = 200
        return Response({'data': data, 'message': message, 'status': status})
    else:
        data = {'key': '403 Forbidden'}
        message = 'Error: Invalid request. Permission denied (e.g., invalid API key).'
        status = 403
        return Response({'data': data, 'message': message, 'status': status})


#####################################

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
    query = """
    SELECT * FROM
    myadmin_department
    WHERE deleted_at IS NULL
    ORDER BY id ASC
    """
    with connection.cursor() as cursor:
        cursor.execute(query)
        results = cursor.fetchall()

    # Convert the query results into a list of dictionaries
    departments = []
    for row in results:
        department = {
            'id': row[0],
            'name': row[1],
            'description': row[2],
        }
        departments.append(department)

    serializer = DepartmentSerializer(departments, many=True)
    serialized_data = serializer.data
    return Response(serialized_data)


@api_view(['GET'])
def department_dataview(request, department_id):
    query = """
    SELECT * FROM myadmin_department
    WHERE id = %s AND deleted_at IS NULL
    """
    with connection.cursor() as cursor:
        cursor.execute(query, [department_id])
        results = cursor.fetchall()

    for row in results:
        department = {
            'id': row[0],
            'name': row[1],
            'description': row[2],
            'created_at': row[3],
            'updated_at': row[4],
        }

    serializer = DepartmentSerializer(instance=department)
    serialized_data = serializer.data
    return Response(serialized_data)


# department edit funtion

@api_view(['PUT', 'POST'])
def edit_department_data(request, department_id):
    department = Department.objects.get(id=department_id)
    serializer = DepartmentSerializer(department, data=request.data)
    if serializer.is_valid():
        serializer.save(updated_at=datetime.now())
        data = {'key': None}
        message = 'Success'
        status = 200
        return Response({'data': data, 'message': message, 'status': status})
    else:
        data = {'key': '403 Forbidden'}
        message = 'Error: Invalid request. Permission denied (e.g., invalid API key).'
        status = 403
        return Response({'data': data, 'message': message, 'status': status})


# department delete funtion
@api_view(['PUT', 'GET'])
def softdelete_department_data(request, department_id):
    department = Department.objects.get(id=department_id)
    serializer = DepartmentDeleteSerializer(department, data=request.data)
    if serializer.is_valid():
        serializer.save(deleted_at=datetime.now())
        data = {'key': None}
        message = 'Success'
        status = 200
        return Response({'data': data, 'message': message, 'status': status})
    else:
        data = {'key': '403 Forbidden'}
        message = 'Error: Invalid request. Permission denied (e.g., invalid API key).'
        status = 403
        return Response({'data': data, 'message': message, 'status': status})


@api_view(['POST'])
def store_department_specification_data(request):
    if request.method == 'POST':

        department_specification_serializer = DepartmentSpecificationStoreSerializer(
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
    WHERE mds.department_id = md.id AND mds.problem_specification_id = mps.id  AND mds.deleted_at IS NULL
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
    serializer = DepartmentSpecificationSerializer(department_specifications, many=True)
    serialized_data = serializer.data
    return Response(serialized_data)


@api_view(['GET'])
def department_specification_dataview(request, department_specification_id):
    query = """
    SELECT
	mds.id,
    mds.description,
    md.name AS department_name,
    mps.specification,
    mps.created_at,
    mps.updated_at
    FROM myadmin_departmentspecification AS mds
    INNER JOIN myadmin_department AS md
    INNER JOIN myadmin_problemspecification AS mps
    WHERE mds.id = %s AND mds.department_id = md.id AND 
    mds.problem_specification_id = mps.id  AND mds.deleted_at IS NULL
    """
    with connection.cursor() as cursor:
        cursor.execute(query, [department_specification_id])
        results = cursor.fetchall()

    for row in results:
        department_specification = {
            'id': row[0],
            'description': row[1],
            'department_name': row[2],
            'problemspecification': row[3],
            'created_at': row[4],
            'updated_at': row[5],
        }

    serializer = DepartmentSpecificationSerializer(instance=department_specification)
    serialized_data = serializer.data
    print(serializer)
    return Response(serialized_data)


# edit organ problem data

@api_view(['PUT', 'POST'])
def edit_department_specification_data(request, department_specification_id):
    department_specification = DepartmentSpecification.objects.get(id=department_specification_id)
    serializer = DepartmentSpecificationStoreSerializer(department_specification, data=request.data)
    if serializer.is_valid():
        serializer.save(updated_at=datetime.now())
        data = {'key': None}
        message = 'Success'
        status = 200
        return Response({'data': data, 'message': message, 'status': status})
    else:
        data = {'key': '403 Forbidden'}
        message = 'Error: Invalid request. Permission denied (e.g., invalid API key).'
        status = 403
        return Response({'data': data, 'message': message, 'status': status})


# delete organ problem data

@api_view(['PUT', 'GET'])
def softdelete_department_specification_data(request, department_specification_id):
    department_specification = DepartmentSpecification.objects.get(id=department_specification_id)
    serializer = DepartmentSpecificationDeleteSerializer(department_specification, data=request.data)
    if serializer.is_valid():
        serializer.save(deleted_at=datetime.now())
        data = {'key': None}
        message = 'Success'
        status = 200
        return Response({'data': data, 'message': message, 'status': status})
    else:
        data = {'key': '403 Forbidden'}
        message = 'Error: Invalid request. Permission denied (e.g., invalid API key).'
        status = 403
        return Response({'data': data, 'message': message, 'status': status})


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
    query = """
    SELECT * FROM
    myadmin_faq
    WHERE deleted_at IS NULL
    ORDER BY id ASC
    """
    with connection.cursor() as cursor:
        cursor.execute(query)
        results = cursor.fetchall()

    # Convert the query results into a list of dictionaries
    faqs = []
    for row in results:
        faq = {
            'id': row[0],
            'question': row[1],
            'answer': row[2],
        }
        faqs.append(faq)

    serializer = FAQSerializer(faqs, many=True)
    serialized_data = serializer.data

    return Response(serialized_data)


@api_view(['GET'])
def faq_dataview(request, faq_id):
    query = """
    SELECT * FROM myadmin_faq
    WHERE id = %s AND deleted_at IS NULL
    """
    with connection.cursor() as cursor:
        cursor.execute(query, [faq_id])
        results = cursor.fetchall()

    for row in results:
        faq = {
            'id': row[0],
            'question': row[1],
            'answer': row[2],
            'created_at': row[3],
            'updated_at': row[4],
        }

    serializer = FAQSerializer(instance=faq)
    serialized_data = serializer.data
    return Response(serialized_data)


# faq edit funtion

@api_view(['PUT', 'POST'])
def edit_faq_data(request, faq_id):
    faq = FAQ.objects.get(id=faq_id)
    serializer = FAQSerializer(faq, data=request.data)
    if serializer.is_valid():
        serializer.save(updated_at=datetime.now())
        data = {'key': None}
        message = 'Success'
        status = 200
        return Response({'data': data, 'message': message, 'status': status})
    else:
        data = {'key': '403 Forbidden'}
        message = 'Error: Invalid request. Permission denied (e.g., invalid API key).'
        status = 403
        return Response({'data': data, 'message': message, 'status': status})


# faq delete funtion
@api_view(['PUT', 'GET'])
def softdelete_faq_data(request, faq_id):
    faq = FAQ.objects.get(id=faq_id)
    serializer = FAQDeleteSerializer(faq, data=request.data)
    if serializer.is_valid():
        serializer.save(deleted_at=datetime.now())
        data = {'key': None}
        message = 'Success'
        status = 200
        return Response({'data': data, 'message': message, 'status': status})
    else:
        data = {'key': '403 Forbidden'}
        message = 'Error: Invalid request. Permission denied (e.g., invalid API key).'
        status = 403
        return Response({'data': data, 'message': message, 'status': status})


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
    serialized_data = serializer.data
    return Response(serialized_data)


@api_view(['GET'])
def get_organs_by_bodypart(request, body_part_id):
    query = """
            SELECT
            mo.id,
            mo.name
            FROM myadmin_organ AS mo
            WHERE mo.body_part_id = %s AND mo.deleted_at IS NULL 
            ORDER BY mo.id ASC
        """

    with connection.cursor() as cursor:
        cursor.execute(query, [body_part_id])
        results = cursor.fetchall()

    organs = []
    for row in results:
        organ = {
            'id': row[0],
            'name': row[1],
        }

        organs.append(organ)

    serializer = OrganBodyPartSerializer(many=True, instance=organs)
    serialized_data = serializer.data

    return Response(serialized_data)
