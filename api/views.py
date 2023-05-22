from django.shortcuts import render
from rest_framework.response import Response
from rest_framework.decorators import api_view
from rest_framework.views import APIView
from rest_framework.authentication import SessionAuthentication
from rest_framework.permissions import IsAuthenticated
from django.http import HttpResponse, JsonResponse
from app.models import *
from .serializers import *


@api_view(['POST'])
def CreateDoctorProfile(request):
    if request.method == 'POST':
        doctorSerializer = DoctorSerializer(data=request.data)
        if doctorSerializer.is_valid():
            doctorSerializer.save()
            data = {'key': 'null'}
            message = 'Success'
            return JsonResponse({'data': data, 'message': message}, status=200)
        else:
            data = {'key': '403 Forbidden'}
            message = 'Error: Invalid request. Permission denied (e.g. invalid API key).'
            return JsonResponse({'data': data, 'message': message}, status=403)
    else:
        data = {'key': '403 Forbidden'}
        message = 'Else-2 Error: Invalid request. Permission denied (e.g. invalid API key).'
        return JsonResponse({'data': data, 'message': message}, status=403)


@api_view(['GET'])
def getAllDoctorsList(request):
    doctors = Doctor.objects.all()
    serializer = DoctorSerializer(doctors, many=True)
    return Response(serializer.data)
# def getAllDoctors(request):
#     return Doctor.objects.all()
