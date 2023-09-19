from django.urls import path, include
from admin.faq.webs import *

# To protect admin panel paths from unauthenticated users
from backend.login_decorators import protected_view

urlpatterns = [
    # faq adminpanel path
    path(
        "",
        include(
            [
                path("add/", protected_view(faq_form), name="add_faq_form"),
                path("store/", protected_view(store_faq), name="store_faq"),
                path("list/", protected_view(faq_data_view), name="faq_list"),
                path(
                    "update/<int:faq_id>/",
                    protected_view(edit_faq_form),
                    name="edit_faq_form",
                ),
                path(
                    "edit/<int:faq_id>/",
                    protected_view(edit_faq),
                    name="edit_faq",
                ),
                path(
                    "delete/<int:faq_id>/",
                    protected_view(delete_faq),
                    name="delete_faq",
                ),
                path(
                    "list/<int:id>/",
                    protected_view(faq_view_created_by),
                    name="faq_all_list",
                ),
            ]
        ),
    ),
]
