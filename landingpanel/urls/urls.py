from django.urls import path, include

# views
from adminpanel.authentication.logout.views import logout

# webs
from adminpanel.authentication.otp.resetpassword.webs import *
from adminpanel.authentication.otp.verifyotp.webs import *
from adminpanel.authentication.login.webs import *
from landingpage.landing.webs import *
from adminpanel.authentication.otp.resendotp.webs import *
from adminpanel.patient.webs import *

urlpatterns = [
    # auth paths ..
    path("logout/", logout, name="logout"),
    # Landing Frontend paths
    path("", landing_dashboard, name="landing_dashboard"),
    # landing path groups ...
    path(
        "landing/",
        include(
            [
                path("doctors/", landing_doctors, name="landing_doctors"),
                path("faq/", landing_faq, name="landing_faq"),
                path(
                    "article/",
                    include(
                        [
                            path("", landing_article, name="landing_article"),
                            path(
                                "view/<int:article_id>/",
                                landing_single_article,
                                name="landing_article_view",
                            ),
                        ]
                    ),
                ),
                path(
                    "login/",
                    include(
                        [
                            path("", login, name="login"),
                            path(
                                "checking/",
                                check_login_is_valid,
                                name="check_login_is_valid",
                            ),
                        ]
                    ),
                ),
                # path('doctor/register/', doctor_register, name="doctor_register"),
                path(
                    "predict/",
                    include(
                        [
                            path("", predict, name="prediction"),
                            path("form/", predict_form, name="predict_form"),
                        ]
                    ),
                ),
                path(
                    "patient/",
                    include(
                        [
                            path("add/", patient_form, name="add_patient_form"),
                            path("store/", store_patient, name="store_patient"),
                        ]
                    ),
                ),
                path(
                    "otp/",
                    include(
                        [
                            path("", otp_form, name="otp_form"),
                            path("resend/", resend_otp_method, name="resend_otp"),
                            path("varify/", verify_otp_method, name="otp_varify"),
                        ]
                    ),
                ),
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
