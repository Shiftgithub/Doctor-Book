from django.urls import path
from .webs import *
from backend.login_decorators import protected_view

# To protect admin panel paths from unauthenticated users

urlpatterns = [
    path('', protected_view(get_user_details), name='user_details'),
    path('add/', admin_form, name='admin_form'),
    path('store/', store_admin, name='store_admin'),
    path('view/<int:admin_id>/', protected_view(view_admin), name='view_admin'),
    path('update/<int:admin_id>/', protected_view(edit_admin_form), name='edit_admin_form', ),
    path('edit/<int:admin_id>/', protected_view(edit_admin), name='edit_admin'),
]
