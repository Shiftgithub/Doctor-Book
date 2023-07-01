from rest_framework.response import Response
from rest_framework.decorators import api_view
from django.db import connection
from landing.serializers.patient_serializers import *


@api_view(['POST'])
def store_patient_data(request):
    if request.method == 'POST':
        patient_serializer = PatientSerializer(data=request.data)
        if patient_serializer.is_valid():
            patient_serializer.save()
            return Response({'status': 200})
        else:
            return Response({'status': 403})
    else:
        return Response({'status': 403})
