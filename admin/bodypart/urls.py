from .webs import *
from django.urls import path, include

# To protect admin panel paths from unauthenticated users
from backend.login_decorators import protected_view

urlpatterns = [
    # bodypart adminpanel path
    path(
        '',
        include(
            [
                path(
                    'add/',
                    protected_view(bodypart_form),
                    name='add_bodypart_form',
                ),
                path(
                    'store/',
                    protected_view(store_bodypart),
                    name='store_bodypart',
                ),
                path(
                    'list/',
                    protected_view(bodypart_data_view),
                    name='bodypart_list',
                ),
                path(
                    'update/<int:bodypart_id>/',
                    protected_view(edit_bodypart_form),
                    name='edit_bodypart_form',
                ),
                path(
                    'edit/<int:bodypart_id>/',
                    protected_view(edit_bodypart),
                    name='edit_bodypart',
                ),
                path(
                    'delete/<int:bodypart_id>/',
                    protected_view(delete_bodypart),
                    name='delete_bodypart',
                ),
            ]
        ),
    ),
]
