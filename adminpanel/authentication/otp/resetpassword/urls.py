from django.urls import path, include
from adminpanel.authentication.otp.resetpassword.webs import *


urlpatterns = [
    path(
        "",
        include(
            [
                path(
                    "forget_pass/",
                    include(
                        [
                            path("", forget_password_method, name="forget_password"),
                            path(
                                "form/",
                                forget_password_form,
                                name="forget_password_form",
                            ),
                        ]
                    ),
                ),
                path(
                    "change_pass/",
                    include(
                        [
                            path("", change_password_method, name="change_password"),
                            path(
                                "form/",
                                change_password_form,
                                name="change_password_form",
                            ),
                        ]
                    ),
                ),
            ]
        ),
    ),
]
