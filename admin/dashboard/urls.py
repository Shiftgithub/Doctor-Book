from django.urls import path, include
from admin.dashboard.webs import *

# To protect admin panel paths from unauthenticated users
from backend.login_decorators import protected_view

urlpatterns = [
    path(
        '',
        include(
            [
                # adminpanel dashboard path
                path('', protected_view(dashboard), name='admin_dashboard'),
                path(
                    'doctor/',
                    protected_view(doctor_dashboard),
                    name='doctor_dashboard',
                ),
                path(
                    'patient/',
                    protected_view(patient_dashboard),
                    name='patient_dashboard',
                ),
            ]
        ),
    ),
]
