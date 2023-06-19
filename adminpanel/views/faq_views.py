from adminpanel.serializers.faq_serializers import *
from datetime import datetime
from django.db import connection
from rest_framework.response import Response
from rest_framework.decorators import api_view


# FAQ
@api_view(['POST'])
def store_faq_data(request):
    if request.method == 'POST':
        faq_serializer = FAQSerializer(data=request.data)
        if faq_serializer.is_valid():
            if faq_serializer.save():
                return Response({'status': 200})
            else:
                return Response({'status': 403})
        else:
            return Response({'status': 403})
    else:
        return Response({'status': 403})


@api_view(['GET'])
def get_all_faq_list(request):
    query = """SELECT * FROM adminpanel_faq WHERE deleted_at IS NULL ORDER BY id ASC"""
    with connection.cursor() as cursor:
        cursor.execute(query)
        results = cursor.fetchall()
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
    query = """SELECT * FROM adminpanel_faq WHERE id = %s AND deleted_at IS NULL"""
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
        if serializer.save(updated_at=datetime.now()):
            return Response({'status': 200})
        else:
            return Response({'status': 403})
    else:
        return Response({'status': 403})


# faq delete funtion
@api_view(['PUT', 'GET'])
def softdelete_faq_data(request, faq_id):
    faq = FAQ.objects.get(id=faq_id)
    serializer = FAQDeleteSerializer(faq, data=request.data)
    if serializer.is_valid():
        if serializer.save(deleted_at=datetime.now()):
            return Response({'status': 200})
        else:
            return Response({'status': 403})
    else:
        return Response({'status': 403})
