from .serializers import *
from rest_framework.response import Response
from rest_framework.decorators import api_view
from admin.authentication.user.models import User
from admin.doctor.models import DoctorProfile
from admin.patient.models import PatientProfile


# @api_view(['GET'])
# def get_admin_info(request, user_id):
#     # Fetch all doctor profiles along with user data and related fields
#     admin = AdminProfile.objects.filter(user_id=user_id, deleted_at=None).select_related(
#         'user').prefetch_related('user__images')
#     serializer = AdminDataSerializer(admin, many=True)
#     return Response(serializer.data)
#
#
# @api_view(['GET'])
# def get_doctor_info(request, user_id):
#     # Fetch all doctor profiles along with user data and related fields
#     doctor = DoctorProfile.objects.filter(user_id=user_id, deleted_at=None).select_related(
#         'user').prefetch_related('user__images')
#     serializer = DoctorDataSerializer(doctor, many=True)
#     # full_name = serializer.data['full_name']
#     #
#     # data = {
#     #     'full_name': full_name,
#     #     # 'appointment_dates': appointment_dates,
#     #     # 'appointment_times': appointment_times
#     # }
#     # print(data)
#     #
#     # return Response(data)
#     return Response(serializer.data)
#
#
# @api_view(['GET'])
# def get_patient_info(request, user_id):
#     # Fetch all doctor profiles along with user data and related fields
#     patient = PatientProfile.objects.filter(user_id=user_id, deleted_at=None).select_related(
#         'user').prefetch_related('user__images')
#     serializer = PatientDataSerializer(patient, many=True)
#     return Response(serializer.data)
