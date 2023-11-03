from .webs import *
from django.urls import path, include

# To protect admin panel paths from unauthenticated users
from backend.login_decorators import protected_view

urlpatterns = [
    # organ adminpanel path
    path(
        '',
        include(
            [
                path(
                    'add/',
                    protected_view(organ_form),
                    name='add_organ_form',
                ),
                path(
                    'store/',
                    protected_view(store_organ),
                    name='store_organ',
                ),
                path(
                    'list/',
                    protected_view(organ_data_view),
                    name='organ_list',
                ),
                path(
                    'update/<int:organ_id>/',
                    protected_view(edit_organ_form),
                    name='edit_organ_form',
                ),
                path(
                    'edit/<int:organ_id>/',
                    protected_view(edit_organ),
                    name='edit_organ',
                ),
                path(
                    'delete/<int:organ_id>/',
                    protected_view(delete_organ),
                    name='delete_organ',
                ),
            ]
        ),
    ),
]
