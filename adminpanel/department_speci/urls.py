from django.urls import path, include
from adminpanel.department_speci.webs import *

# To protect admin panel paths from unauthenticated users
from backend.login_decorators import protected_view

urlpatterns = [
    # department specification adminpanel path
    path(
        "",
        include(
            [
                path(
                    "add/",
                    protected_view(department_specification_form),
                    name="add_department_specification_form",
                ),
                path(
                    "store/",
                    protected_view(store_department_specification),
                    name="store_department_specification",
                ),
                path(
                    "list/",
                    protected_view(department_specification_data_view),
                    name="department_specification_list",
                ),
                path(
                    "update/<int:department_specification_id>/",
                    protected_view(edit_department_specification_form),
                    name="edit_department_specification_form",
                ),
                path(
                    "edit/<int:department_specification_id>/",
                    protected_view(edit_department_specification),
                    name="edit_department_specification",
                ),
                path(
                    "delete/<int:department_specification_id>/",
                    protected_view(delete_department_specification),
                    name="delete_department_specification",
                ),
                path(
                    "view/<int:department_specification_id>/",
                    protected_view(view_department_specification),
                    name="view_department_specification",
                ),
            ]
        ),
    ),
]
