from .webs import *
from .views import *
from django.urls import path
from core.login_decorators import protected_view
from ...dashboard.webs import get_user_details

urlpatterns = [
    path('form/', admin_form, name='admin_form'),
    path('store/', store_admin, name='store_admin'),
    path('profile/', protected_view(get_user_details), name='user_details'),
    path('view/<int:admin_id>/', protected_view(view_admin), name='view_admin'),
    path('update/<int:admin_id>/', protected_view(edit_admin_form), name='edit_admin_form', ),
    path('edit/<int:admin_id>/', protected_view(edit_admin), name='edit_admin'),

    path('check-username-availability/<str:username>/', check_username_availability,
         name='check_username_availability'),
    path('check-email-availability/<str:email>/', check_email_availability, name='check_email_availability'),
]
