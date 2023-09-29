from .webs import *
from django.urls import path, include
# To protect admin panel paths from unauthenticated users
from backend.login_decorators import protected_view

urlpatterns = [
    # prescription adminpanel path
    path(
        '',
        include(
            [
                path('add/', protected_view(prescription_form), name='add_prescription_form'),
                path('store/', protected_view(store_prescription), name='store_prescription'),
                path('list/', protected_view(prescription_data_view), name='prescription_list'),
                path('update/<int:prescription_id>/', protected_view(edit_prescription_form),
                     name='edit_prescription_form'),
                path('edit/<int:prescription_id>/', protected_view(edit_prescription), name='edit_prescription'),
                path('delete/<int:prescription_id>/', protected_view(delete_prescription),
                     name='delete_prescription'),
                # path('view/<int:prescription_id>/', protected_view(view_prescription), name='view_prescription'),
            ]
        ),
    ),
]
