from .webs import *
from django.urls import path, include

# To protect admin panel paths from unauthenticated users
from core.login_decorators import protected_view

urlpatterns = [
    # department adminpanel path
    path(
        '',
        include(
            [
                path('add/', protected_view(department_form), name='department_form'),
                path('store/', protected_view(store_department), name='store_department', ),
                path('list/', protected_view(department_data_view), name='department_list'),
                path('update/<int:department_id>/', protected_view(edit_department_form), name='edit_department_form'),
                path('edit/<int:department_id>/', protected_view(edit_department), name='edit_department', ),
                path('delete/<int:department_id>/', protected_view(delete_department), name='delete_department'),
            ]
        ),
    ),
]
