from django.shortcuts import render
from rest_framework.response import Response
from rest_framework.decorators import api_view
from django.http import JsonResponse
from .models import *
from .serializers import DoctorSerializer
from rest_framework.views import APIView
from . import views


def DoctorForm(request):
    return render(request, 'app/doctor_form.html')


def DoctorDataView(request):
    datas = Doctor.objects.all()
    # datas = getAllDoctors(request)
    return render(request, 'app/viewdata.html', {'datas': datas})
