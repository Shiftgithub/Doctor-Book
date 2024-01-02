from a.webs import *
from django.urls import path, include

# To protect admin panel paths from unauthenticated users
from backend.login_decorators import protected_view

urlpatterns = [
    path(
        'adminpanel/patient/',
        include(
            [
                path(
                    'update/<int:patient_id>/',
                    protected_view(edit_patient_form),
                    name='edit_patient_form',
                ),
                path(
                    'edit/<int:patient_id>/',
                    protected_view(edit_patient),
                    name='edit_patient',
                ),
            ]
        ),
    ),
]
