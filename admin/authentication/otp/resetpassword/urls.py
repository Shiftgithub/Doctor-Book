from .webs import *
from django.urls import path, include
from core.login_decorators import protected_view

urlpatterns = [
    path(
        '',
        include(
            [
                path(
                    'forge-pass/',
                    include(
                        [
                            path('', forget_password_method, name='forget_password'),
                            path('form/', forget_password_form, name='forget_password_form'),
                        ]
                    ),
                ),
                path(
                    'change-password/',
                    include(
                        [
                            path('', change_password_method, name='change_password'),
                            path('form/', change_password_form, name='change_password_form'),
                        ]
                    ),
                ),
                path(
                    'reset-password/',
                    include(
                        [
                            path('', protected_view(reset_password_method), name='store_new_password'),
                            path('form/', protected_view(reset_password_form), name='reset_password_form'),
                        ]
                    ),
                ),
                path(
                    'change-email/',
                    include(
                        [
                            path('', protected_view(change_email_method), name='store_new_email'),
                            path('form/', protected_view(change_email_form), name='change_email_form'),
                        ]
                    ),
                ),
            ]
        ),
    ),
]
