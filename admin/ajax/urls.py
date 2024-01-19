from landing.prediction.webs import view_prediction_data
from .views import *
from django.urls import path, include

# To protect admin panel paths from unauthenticated users
from core.login_decorators import protected_view

urlpatterns = [
    # Ajax path
    path(
        '',
        include(
            [
                path('time/', generate_time, name='get_time'),
                path('organ/<int:body_part_id>/', get_organs_by_bodypart, name='get_organs'),
                path('problem/specification/<int:organ_id>/', get_organ_problem_by_organ, name='get_organ_problems'),
                path('district/<int:division_id>/', get_district_by_division, name='get_districts'),
                path('upazila/<int:district_id>/', get_upazila_by_district, name='get_upazilas'),
                path('appointment/<int:patient_id>/', get_appointment_date_time_by_patient_name,
                     name='get_patient_appointments_by_name'),
                path('prediction-view/<int:prediction_id>/<int:patient_id>/', get_prediction_view,
                     name='get_prediction_for_appointments'),
            ]
        ),
    ),
]
