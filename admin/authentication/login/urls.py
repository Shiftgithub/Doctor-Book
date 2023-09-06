from django.urls import path, include
from admin.authentication.login.webs import login, check_login_is_valid

urlpatterns = [
    path(
        "",
        include(
            [
                path("", login, name="login"),  # URL: /login/
                path(
                    "checking/",
                    check_login_is_valid,
                    name="check_login_is_valid",  # URL: /login/checking/
                ),
            ]
        ),
    ),
]
