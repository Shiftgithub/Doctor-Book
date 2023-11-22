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
                path('add/', protected_view(body_part_form), name='add_body_part_form'),
                path('store/', protected_view(store_body_part), name='store_body_part'),
                path('list/', protected_view(body_part_data_view), name='body_part_list'),
                path('update/<int:body_part_id>/', protected_view(edit_body_part_form), name='edit_body_part_form'),
                path('edit/<int:body_part_id>/', protected_view(edit_body_part), name='edit_body_part'),
                path('delete/<int:body_part_id>/', protected_view(delete_body_part), name='delete_body_part'),
            ]
        ),
    ),
]
