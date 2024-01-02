from .webs import *
from django.urls import path, include

# To protect admin panel paths from unauthenticated users
from core.login_decorators import protected_view

urlpatterns = [
    # organ problem speci adminpanel path
    path(
        '',
        include(
            [
                path(
                    'add/',
                    protected_view(organ_problem_specification_form),
                    name='add_organ_problem_specification_form',
                ),
                path(
                    'store/',
                    protected_view(store_organ_problem_specification),
                    name='store_organ_problem_specification',
                ),
                path(
                    'list/',
                    protected_view(organ_problem_specification_data_view),
                    name='organ_problem_specification_list',
                ),
                path(
                    'update/<int:organ_problem_specification_id>/',
                    protected_view(edit_organ_problem_specification_form),
                    name='edit_organ_problem_specification_form',
                ),
                path(
                    'edit/<int:organ_problem_specification_id>/',
                    protected_view(edit_organ_problem_specification),
                    name='edit_organ_problem_specification',
                ),
                path(
                    'delete/<int:organ_problem_specification_id>/',
                    protected_view(delete_organ_problem_specification),
                    name='delete_organ_problem_specification',
                ),
                path(
                    'view/<int:organ_problem_specification_id>/',
                    protected_view(view_organ_problem_specification),
                    name='view_organ_problem_specification',
                ),
            ]
        ),
    ),
]
