from .webs import *
from django.urls import path, include

# To protect admin panel paths from unauthenticated users
from core.login_decorators import protected_view

urlpatterns = [
    # department specification adminpanel path
    path(
        '',
        include(
            [
                path(
                    'add/',
                    protected_view(doctor_form),
                    name='add_doctor_form',
                ),
                path(
                    'work/details/add/',
                    protected_view(doctor_work_details_form),
                    name='add_doctor_work_details_form',
                ),
                path(
                    'store/',
                    protected_view(store_doctor),
                    name='store_doctor',
                ),
                path(
                    'work_details/store/',
                    protected_view(store_doctor_work_details),
                    name='store_doctor_work_details',
                ),
                path(
                    'list/',
                    protected_view(doctor_data_view),
                    name='doctor_list',
                ),
                path(
                    'view/<int:doctor_id>/',
                    protected_view(view_doctor),
                    name='view_doctor_data',
                ),
                path(
                    'update/<int:doctor_id>/',
                    protected_view(edit_doctor_form),
                    name='edit_doctor_form',
                ),
                path(
                    'edit/<int:doctor_id>/',
                    protected_view(edit_doctor),
                    name='edit_doctor',
                ),
                path(
                    'delete/<int:doctor_id>/',
                    protected_view(delete_doctor),
                    name='delete_doctor',
                ),
            ]
        ),
    ),
]
