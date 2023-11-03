from .webs import *
from django.urls import path, include

# To protect admin panel paths from unauthenticated users
from backend.login_decorators import protected_view

urlpatterns = [
    path(
        '',
        include(
            [
                # dashboard path
                path('admin/', protected_view(dashboard), name='admin_dashboard'),
                path('doctor/', protected_view(doctor_dashboard), name='doctor_dashboard', ),
                path('patient/', protected_view(patient_dashboard), name='patient_dashboard', ),
            ]
        ),
    ),
]
