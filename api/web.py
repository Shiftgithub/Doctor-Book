from django.shortcuts import render
from rest_framework.response import Response
from rest_framework.decorators import api_view
from django.http import JsonResponse
from .models import *
from .serializers import DoctorSerializer
from rest_framework.views import APIView
from . import views


def Dashboard(request):
    return render(request, 'app/index.html')


def DepartmentForm(request):
    return render(request, 'app/department_form.html')


def DepartmentDataView(request):
    return render(request, 'app/departmentdata.html')


def DoctorForm(request):
    return render(request, 'app/doctor_form.html')


def DoctorDataView(request):
    return render(request, 'app/viewdata.html')


def BodyPartForm(request):
    return render(request, 'app/bodypart_form.html')


def BodyPartDataView(request):
    return render(request, 'app/bodypartdata.html')
