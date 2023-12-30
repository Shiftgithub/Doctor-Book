from .webs import *
from django.urls import path, include

# To protect admin panel paths from unauthenticated users
from core.login_decorators import protected_view

urlpatterns = [
    path(
        '',
        include(
            [
                # dashboard path
                path('admin/', protected_view(admin_dashboard), name='admin_dashboard'),
                path('doctor/', protected_view(doctor_dashboard), name='doctor_dashboard'),
                path('patient/', protected_view(patient_dashboard), name='patient_dashboard'),
                path('change-theme/', protected_view(change_theme), name='change_theme'),
            ]
        ),
    ),
]
