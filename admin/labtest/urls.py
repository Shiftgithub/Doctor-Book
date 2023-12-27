from .webs import *
from django.urls import path, include
# To protect admin panel paths from unauthenticated users
from core.login_decorators import protected_view

urlpatterns = [
    # body-part path
    path(
        '',
        include(
            [
                path('form/', protected_view(lab_test_form), name='lab_test_form'),
                path('store/', protected_view(store_lab_test), name='store_lab_test'),
                path('list/', protected_view(lab_test_data_view), name='lab_test_list'),
                path('edit-form/<int:lab_test_id>/', protected_view(edit_lab_test_form), name='edit_lab_test_form'),
                path('edit/<int:lab_test_id>/', protected_view(edit_lab_test), name='edit_lab_test'),
                path('delete/<int:lab_test_id>/', protected_view(delete_lab_test), name='delete_lab_test'),
            ]
        ),
    ),
]
