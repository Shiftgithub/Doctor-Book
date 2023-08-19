from django.urls import path, include
from adminpanel.ajax.views import *

# To protect admin panel paths from unauthenticated users
from backend.login_decorators import protected_view

urlpatterns = [
    # Ajax path
    path(
        "",
        include(
            [
                path(
                    "organ/<int:body_part_id>/",
                    get_organs_by_bodypart,
                    name="get_organs",
                ),
                path(
                    "problem/specification/<int:organ_id>/",
                    get_organ_problem_by_organ,
                    name="get_organ_problems",
                ),
                path(
                    "district/<int:division_id>/",
                    get_district_by_division,
                    name="get_districts",
                ),
                path(
                    "upazila/<int:district_id>/",
                    get_upazila_by_district,
                    name="get_upazilas",
                ),
            ]
        ),
    ),
]
